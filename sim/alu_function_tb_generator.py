import subprocess
import os

TESTBENCH_ROOT = './'
if not os.path.exists(TESTBENCH_ROOT):
    os.mkdir(TESTBENCH_ROOT)

ALU_FUNCTION_TB_TEMPLATE = '''
`timescale 10ns/100ps
`define CLK {clock_freq}
`define CLKH (`CLK / 2)
`include "{target_file}"

module {target_module}_tb();
    reg [31: 0] rs1, rs2;
    reg clk;
    wire [31: 0] rd;

    {target_module} specimen (.rs1(rs1), .rs2(rs2), .rd(rd));
    initial begin
        $display("--- {target_module} simulation...");
        $display("--- clk = %-d", `CLK);
        rs1 = 0; rs2 = 0; clk = 0;
        #1;
        {test_content}
        #(`CLK) $finish;
    end

    always #(`CLKH) clk = ~clk;

    always @(negedge clk)
        $display("time= %d: rs1=%d | rs2=%d | rd=%d", $time, rs1, rs2, rd);
endmodule
'''

TEST_CASE_TEMPLATE =  '#(`CLK) rs1 <= {}; rs2 <= {};'

SIMULATION_PRECISION = 100 # in picosecond
CLOCK_FREQ = 20 # in precision unit
BIT_DEPTH = 32

def generate_test_bench(file, module, content):
    test_content = '\n        '.join([TEST_CASE_TEMPLATE.format(rs1,rs2) for rs1, rs2, _, _ in content])

    test_bench = ALU_FUNCTION_TB_TEMPLATE.format(
        root=TESTBENCH_ROOT,
        clock_freq=CLOCK_FREQ,
        target_file=file,
        target_module=module,
        test_content=test_content
    ).strip()
    
    test_bench_fp = '{}/{}_tb.v'.format(TESTBENCH_ROOT, module)

    with open(test_bench_fp, 'w') as f:
        f.write(test_bench)
    
    return test_bench_fp

def run_test_bench(test_bench_fp):
    output_fp = test_bench_fp.replace('.v', '.out')
    subprocess.check_output(["iverilog", "-o", output_fp, test_bench_fp])
    result = subprocess.check_output(["vvp", output_fp])
    parsed = result.decode('ascii').split('\n')
    for test, test_result in zip(content, parsed[3:-1]):
        expected = test_result.split('|')[-1].replace('rd=', '').strip()
        rs1, rs2, rd, intent = test
        if str(rd) == expected or str(2**BIT_DEPTH + rd) == expected:
            print('PASSED | {} should {} | {}'.format(module, intent, test[0:3]))
        else:
            print('FAILED | {} should {} | RS1: {}, RS2: {}, EXPECTED: {}, ACTUAL: {}'.format(module, intent, rs1, rs2, rd, expected))

# add
run_test_bench('alu_function.v', 'alu_add', [
    (1, 1, 2, 'perform pos-pos addition'),
    (-1, -1, -2, 'perform neg-neg addition'),
    (10, -10, 0, 'perform pos-neg addition'),
    (-10, 10, 0, 'perform neg-pos addition'),
    (10, 21, 31, 'perform multi-bit addition'),
    (2**32-1, 2, 1, 'overflow correctly'),
])

# subtract
run_test_bench('alu_function.v', 'alu_sub', [
    (1, 1, 0, 'perform pos-pos subtraction'),
    (-1, -1, 0, 'perform neg-neg subtraction'),
    (10, -10, 20, 'perform pos-neg subtraction'),
    (-10, 10, -20, 'perform neg-pos subtraction'),
    (21, 10, 11, 'perform multi-bit subtraction'),
    (2**32-1, -1, 0, 'overflow correctly')
])

# left logical shift
run_test_bench('alu_function.v', 'alu_sll', [
    (1, 1, 2, 'shift bit leftward'),
    (2**32-1, 3, 2**32-8, 'fill rightmost bits 0'),
    (2**32, 1, 0, 'return 0 if all bits are overflowed rightward'),
])

# signed less than comparison
run_test_bench('alu_function.v', 'alu_slt', [
    (2, 1, 0, 'return 0 if rs1 < rs2'),
    (1, 2, 1, 'return 1 if rs1 > rs2'),
    (1, 1, 0, 'return 0 if rs1 = rs2'),
    (-1, 1, 1, 'correctly compares postive and negative numbers'),
    (-1, -2, 0, 'correctly compares 2 negative numbers')
])

# unsigned less than comparison
run_test_bench('alu_function.v', 'alu_sltu', [
    (2, 1, 0, 'return 0 if rs1 < rs2'),
    (1, 2, 1, 'return 1 if rs1 > rs2'),
    (1, 1, 0, 'return 0 if rs1 = rs2'),
    (-1, 1, 0, 'do unsigned comparison on positive and negative integers'),
    (-1, -2, 0, 'do unsigned comparison on negative and negative integers')
])

# xor
run_test_bench('alu_function.v', 'alu_xor', [
    (0, 0, 0, 'return 0 if inputs are 0 and 0 for each bit'),
    (0, 2**32-1, 2**32-1, 'return 1 if inputs are 0 and 1 for each bit'),
    (2**32-1, 0, 2**32-1, 'return 1 if inputs are 1 and 0 for each bit'),
    (2**32-1, 2**32-1, 0, 'return 0 if inputs are 1 and 1 for each bit')
])

# unsigned shift right
run_test_bench('alu_function.v', 'alu_srl', [
    (2, 1, 1, 'shift bit rightward'),
    (1, 1, 0, 'fill 0 if all bits are shifted'),
    (2**32-1, 1, 2**31-1, 'does not preserve sign bit')
])

# right arithmetic shift
run_test_bench('alu_function.v', 'alu_sra', [
    (2, 1, 1, 'shift bit rightward'),
    (-2, 1, -1, 'fill 0 if all bits are shifted'),
    (2**32-1, 1, 2**32-1, 'preserve sign bit')
])

# or
run_test_bench('alu_function.v', 'alu_or', [
    (0, 0, 0, 'return 0 if inputs are 0 and 0 for each bit'),
    (0, 2**32-1, 2**32-1, 'return 1 if inputs are 0 and 1 for each bit'),
    (2**32-1, 0, 2**32-1, 'return 1 if inputs are 1 and 0 for each bit'),
    (2**32-1, 2**32-1, 2**32-1, 'return 1 if inputs are 1 and 1 for each bit')
])

# and
run_test_bench('alu_function.v', 'alu_and', [
    (0, 0, 0, 'return 0 if inputs are 0 and 0 for each bit'),
    (0, 2**32-1, 0, 'return 0 if inputs are 0 and 1 for each bit'),
    (2**32-1, 0, 0, 'return 0 if inputs are 1 and 0 for each bit'),
    (2**32-1, 2**32-1, 2**32-1, 'return 1 if inputs are 1 and 1 for each bit')
])

for file in os.listdir(TESTBENCH_ROOT):
    if file.endswith('.out'):
        os.remove(os.path.join(TESTBENCH_ROOT, file))