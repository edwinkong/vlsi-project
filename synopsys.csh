#!/bin/csh

#
# synopsys setup file
#

set syndir=/cad/synopsys/syn/latest
#set simdir=/cad/synopsys/sim/2002.06-6
#set simdir=/cad/synopsys/vcs-mx/scirocco2002.12.2
set simdir=/cad/synopsys/vcs-mx/latest

setenv SYNOPSYS_KEY_FILE 1705@licsvr
setenv CCSS_KEYS 1705@licsvr
setenv SNPSLMD_LICENSE_FILE 1705@licsvr
# lmc
setenv LMC_HOME /cad/synopsys/lmc/2004.11
#setenv LMC_USE_32BIT 1

set arch=`$syndir/bin/snps_platform`

if ( -f "$syndir/README.syn" ) then
  set ver=`grep "$arch :" $syndir/README.syn| head -1| cut -f2 -d:`
else
#  set ver="unknown"
  set ver=`grep INSTALLING $syndir/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
endif

#if (`isainfo -b` == "64") then
#	set arch="sparc64"
#else
#	set arch="sparcOS5"
#endif

echo "#######################################################################"
echo "                              Synopsys "
echo "                       http://www.synopsys.com/"
echo "#######################################################################"
echo "Synthesis \t\t$ver"
echo ""

setenv SNPSLMD_LICENSE_FILE 1705@hkueee1
if ( -f "/cad/synopsys/scl/admin/license/key" ) then
  echo "Synopsys Common Licensing 10.8"
endif

#if ( -d $simdir ) then	
#	setenv SYNOPSYS_SIM $simdir
#	source $SYNOPSYS_SIM/admin/setup/environ.csh
#	set path = ($SYNOPSYS_SIM/sparcOS5/sim/bin $path)
#	#echo "Core Simulation Tools 2002.06-6"
#	echo "Core Simulation Tools 2002.12.2"
#
##	if ( $?DISPLAY != 0 ) then
##        	xrdb -merge $SYNOPSYS_SIM/admin/setup/Gvan
##       		xrdb -merge $SYNOPSYS_SIM/admin/setup/HBrowser
##        	xrdb -merge $SYNOPSYS_SIM/admin/setup/PadWindow
##        	xrdb -merge $SYNOPSYS_SIM/admin/setup/ScrolledWindow
##        	xrdb -merge $SYNOPSYS_SIM/admin/setup/Sge
##        	xrdb -merge $SYNOPSYS_SIM/admin/setup/Vhdldbx
##	endif
#endif

if ( -d "$syndir" ) then
	setenv SYNOPSYS $syndir
#	setenv XKEYSYMDB $SYNOPSYS/admin/setup/XKeysymDB
#	setenv XERRORDB $SYNOPSYS/admin/setup/XErrorDB
#	if ( $?DISPLAY != 0 ) then
#		xrdb -merge $SYNOPSYS/admin/setup/Design_analyzer
#	endif

#	setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${SYNOPSYS}/sparcOS5/mw/lib-sunos5_optimized

	set path = ($SYNOPSYS/$arch/syn/bin $path)

	if (`uname` == "SunOS") then
		if (`isainfo -b` == "64") then
                        set path = ($SYNOPSYS/$arch/syn/bin $SYNOPSYS/sparcOS5/syn/bin $path)
		else
                        set path = ($SYNOPSYS/$arch/syn/bin $path)
		endif
		set ver="W-2004.12-SP4-2"
		setenv SYNOPSYS_TMAX $SYNOPSYS
		echo "Core Synthesis Tools ${ver}"
		echo "Synopsys Online Documentation $ver"
		echo "TetraMAX_Overlay_with_Synthesis $ver"
		#echo "Power Fault IDDQ $ver"
		#echo "PrimePower_Overlay (install with Synthesis) $ver"

		# Module Compiler
		if ( -f "$SYNOPSYS/mc/localadm/setup.csh" ) then
			source $SYNOPSYS/mc/localadm/setup.csh
			echo "Module Compiler W-2004.12-SP4-2"
		endif
	endif

#	set SYNVIEW=$SYNOPSYS/worldview
#	set path = ($SYNTMP/syn/bin $SYNOPSYS/../sim/$arch/sim/bin $SYNVIEW/bin $SYNVIEW/lib $SYNVIEW/fultex $path)
#	set path = ($SYNTMP/syn/bin $path)

#	source $SYNOPSYS/admin/install/sim/bin/environ.csh
#	source $SYNOPSYS/admin/setup/environ.csh

#	if ( ! -f $HOME/.synopsys_dc.setup ) then
#		cp $SYNOPSYS/admin/setup/.synopsys_dc.setup $HOME/.synopsys_dc.setup
#	endif
#
	if ( -d $SYNOPSYS/auxx/syn/power/vpower ) then
		setenv SYNOPSYS_ROOT $SYNOPSYS
	endif

#	unset SYNTMP
#	unset SYNVIEW

endif

# astro
#set ver="W-2004.12-SP1"
#if ( -d "/cad/synopsys/astro/latest/bin/IA.32" ) then
##        set ver=`grep "$arch :" /cad/synopsys/astro/latest/README.astro| head -1| cut -f2 -d:`
#	set ver=`grep INSTALLING /cad/synopsys/astro/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#	set path = (/cad/synopsys/astro/latest/bin $path)
#	echo "Astro $ver"
#endif
###

#
# CoCentric System Studio
#
#set ver="W-2004.09-SP2"
if ( -d "/cad/synopsys/css/latest/ccss" ) then
        set ver=`grep INSTALLING /cad/synopsys/css/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	setenv SYNOPSYS_CCSS /cad/synopsys/css/latest/ccss
	set path = ($path $SYNOPSYS_CCSS/bin)
	echo "CoCentric System Studio $ver"
endif
## coretools
if ( -d "/cad/synopsys/coretools/latest/bin" ) then
##	set ver=`grep "$arch :" /cad/synopsys/pp/latest/README.pps| head -1| cut -f2 -d:`
	set ver=`/cad/synopsys/coretools/latest/bin/coreAssembler -version | grep version | cut -f8 -d" "`
	set path = (/cad/synopsys/coretools/latest/bin $path)
	echo "coretools \t\t$ver"
endif

if ( -d "/cad/synopsys/cscope/latest/CosmosScope/bin" ) then
# set ver=`grep "$arch :" /cad/synopsys/ns/latest/README.ns| head -1| cut -f2 -d:`
#  set ver=`grep INSTALLING /cad/synopsys/ns/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#  set path = (/cad/synopsys/ns/latest/$arch/ns/utilities/cosmos/ai_bin $path)
  set ver=`/cad/synopsys/cscope/latest/ai_bin/ai_version |grep RELEASE | tail -1`
  set path = (/cad/synopsys/cscope/latest/ai_bin $path)
  setenv SABER_HOME /cad/synopsys/cscope/latest/CosmosScope
  #setenv LD_LIBRARY_PATH "$SABER_HOME/bin:`printenv $LD_LIBRARY_PATH`"
  if ( $?LD_LIBRARY_PATH ) then
    setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$SABER_HOME/bin
  else
    setenv LD_LIBRARY_PATH $SABER_HOME/bin
  endif

#  setenv AILM_LICENSE_FILE /cad/synopsys/key
  echo "CosmosScope \t\t$ver"
endif

####
set prodid="customdesigner"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "CustomDesigner \t\t$ver"
	endif
endif
####
set prodid="cx"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "CustomExplorer \t\t$ver"
	endif
endif
####

# CustomSim, xa
if ( -d "/cad/synopsys/xa/latest/bin" ) then
	setenv XA_64 1
        set ver=`grep INSTALLING /cad/synopsys/xa/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	set path = ($path /cad/synopsys/xa/latest/bin)
	echo "CustomSim_XA \t\t$ver"
endif

#
# FPGA Compiler II T-2003.09-SP1-FC3.8, Build: 3.8.2.10121
#
if ( -f "/cad/synopsys/fc2/fpga_compiler2/bin/fc2" ) then
	set path = ($path /cad/synopsys/fc2/fpga_compiler2/bin)
	echo "FPGA Compiler II T-2003.09-SP1-FC3.8, Build: 3.8.2.10121"
endif

## ESP-CV
set prodid="esp"
if ( -d "/cad/synopsys/${prodid}/latest/$arch/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	set path = ($path /cad/synopsys/${prodid}/latest/bin)
	echo "ESP-CV \t\t\t$ver"
endif
#
# FineSim 
if ( -d "/cad/synopsys/fsim/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/fsim/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	#set ver="2012.12-SP3"
	setenv FINESIM_HOME /cad/synopsys/fsim/latest
	setenv FINESIM_LIC $SNPSLMD_LICENSE_FILE

	setenv FINESIM_64   1
	setenv FINEWAVE_64  1
	setenv POWERVIEW_64 1

	set path = ($path /cad/synopsys/fsim/latest/bin)
	echo "FineSim \t\t$ver"
endif
###
#
# Formality 
if ( -d "/cad/synopsys/fm/latest/$arch/fm/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/fm/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	set path = ($path /cad/synopsys/fm/latest/bin)
	echo "Formality \t\t$ver"
endif
###
### Hercules
###
set prodid="hercules"
if ( -d "/cad/synopsys/${prodid}/latest/bin/$arch" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	set path = ($path /cad/synopsys/${prodid}/latest/bin/${arch})
	echo "Hercules \t\t$ver"
endif
###
#
# HSIM
if ( -d "/cad/synopsys/hsim/latest/hsimplus/bin" ) then
	setenv HSIM_64 1
	setenv HSIM_HOME /cad/synopsys/hsim/latest/hsimplus
        set ver=`grep INSTALLING /cad/synopsys/hsim/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	set path = ($path /cad/synopsys/hsim/latest/hsimplus/bin)
	echo "HSimPlus \t\t$ver"
endif

#
# HSPICE
#
if ( -d "/cad/synopsys/hspice/latest" ) then
	setenv HSP_HOME /cad/synopsys/hspice/latest/hspice
	set path=($path $HSP_HOME/bin $HSP_HOME/$arch)
	if ( $?LD_LIBRARY_PATH ) then
	  setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:$HSP_HOME/$arch
	else
	  setenv LD_LIBRARY_PATH $HSP_HOME/$arch
	endif

	if ( $?LIBPATH ) then
	  # setenv LIBPATH $HSP_HOME/$arch:$LIBPATH
	else
	  setenv LIBPATH $HSP_HOME/$arch
	endif
	if ( $?SHLIB_PATH ) then
	  # setenv SHLIB_PATH $HSP_HOME/$arch:$SHLIB_PATH
	else
	  setenv SHLIB_PATH $HSP_HOME/$arch
	endif
	
	# set ver=`grep "$arch :" /cad/synopsys/hspice/latest/README.hspice| head -1| cut -f2 -d:`
	set ver=`grep INSTALLING /cad/synopsys/hspice/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	echo "HSPICE \t\t\t$ver"
endif


#
# pp PrimePower
#set ver="W-2004.12-SP3"
#if ( -d "/cad/synopsys/pp/latest/$arch/syn/bin" ) then
#	set ver=`grep "$arch :" /cad/synopsys/pp/latest/README.pps| head -1| cut -f2 -d:`
#	set path = (/cad/synopsys/pp/latest/$arch/syn/bin $path)
#	echo "PrimePower ($arch) $ver"
#endif
# pm PathMill
#set ver="V-2003.12-SP3"
#set ver="W-2004.12-SP2"
#if ( -d "/cad/synopsys/pm/latest/$arch/pm/bin" ) then
#	set ver=`grep "$arch :" /cad/synopsys/pm/latest/README.pm| head -1| cut -f2 -d:`
#	set path = (/cad/synopsys/pm/latest/$arch/pm/bin $path)
#	echo "PathMill ($arch) $ver"
#endif
## sx SpiceExplorer
#set ver="W-2004.12-SP3"
#if ( -d "/cad/synopsys/sx/latest/admin" ) then
#        set ver=`grep INSTALLING /cad/synopsys/sx/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#	set path = (/cad/synopsys/sx/latest/C2009.03-SP1/sx_C2009_03-SP1/bin $path)
#	echo "SpiceExplorer $ver"
##
## Amps
#if ( -d "/cad/synopsys/pm/$ver/$arch/amps/bin" ) then
#	set path = (/cad/synopsys/pm/$ver/$arch/amps/bin $path)
#	echo "Amps $ver"
#endif

# COSSAP 2002.05
#
#if ( -f "/cad/synopsys/cos/2002.05/$arch/cossap/admin/install/cshrc.user" ) then
#	source "/cad/synopsys/cos/2002.05/$arch/cossap/admin/install/cshrc.user"
#	echo "COSSAP 2002.05"
#endif

#
# Chip Architect
#
#if ( -d "/cad/synopsys/ca/$arch/ca/bin" ) then
#	set path = ($path /cad/synopsys/ca/$arch/ca/bin)
#	echo "Chip Architect 2001.8"
#endif
#####
##### icc
#####
set prodid="icc"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "IC Compiler \t\t$ver"
	endif
endif
####

#####
##### icwbev_plus
#####
set prodid="icwbev_plus"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "IC WorkBench EV Plus \t$ver"
	endif
endif
#####
##### LEDA
#####
set prodid="leda"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	setenv LEDA_PATH /cad/synopsys/${prodid}/latest/
	echo "Leda Design Checker\t$ver"
	endif
endif
#####
##### Library NCX
#####
set prodid="ncx"
if ( -d "/cad/synopsys/${prodid}/latest/${prodid}/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/${prodid}/bin/ $path)
	echo "Library NCX \t\t$ver"
	endif
endif
#
# Milkyway
#
if ( -d "/cad/synopsys/mw/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/mw/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
	#setenv SYNOPSYS_CCSS /cad/synopsys/css/latest/ccss
	set path = ($path /cad/synopsys/mw/latest/bin/AMD.64)
	echo "Milkyway \t\t$ver"
endif
#####
##### MVtools
#####
set prodid="mvtools"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	setenv ARCHPRO_ROOT /cad/synopsys/${prodid}/latest/
	echo "MVtools \t\t$ver"
	endif
endif
###
### nanosim
###
if ( -d "/cad/synopsys/ns/latest/$arch/ns/bin" ) then
# set ver=`grep "$arch :" /cad/synopsys/ns/latest/README.ns| head -1| cut -f2 -d:`
  set ver=`grep INSTALLING /cad/synopsys/ns/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
  set path = (/cad/synopsys/ns/latest/$arch/ns/utilities/cosmos/ai_bin $path)
  set path = (/cad/synopsys/ns/latest/$arch/ns/bin $path)
  echo "NanoSim \t\t$ver"
endif

#####
set prodid="nt"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "NanoTime \t\t$ver"
	endif
endif
# TMAX 2001.08
##
#if ( -f "${SYNOPSYS}/$arch/syn/bin/tmax" ) then
#	setenv SYNOPSYS_TMAX ${SYNOPSYS}
#	echo "TMAX 2001.08"
#endif

# Floorplan Compiler V-2003.12
#set ver="V-2003.12"
#if ( -d "/cad/synopsys/fpc/$ver/$arch/fpc/bin" ) then
#	set path = ($path /cad/synopsys/fpc/$ver/$arch/fpc/bin)
#	echo "Floorplan Compiler ($arch) $ver"
#endif

#####
set prodid="simif"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "Simif \t\t\t$ver"
	endif
endif
# PrimeTime 
#set ver="X-2005.06"
if ( -d "/cad/synopsys/pts/latest/$arch/syn/bin" ) then
#	set ver=`grep "$arch :" /cad/synopsys/pts/latest/README.pts| head -1| cut -f2 -d:`
  set ver=`grep INSTALLING /cad/synopsys/pts/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
  set path = ($path /cad/synopsys/pts/latest/$arch/syn/bin)
  echo "PrimeTime \t\t$ver"
        if ( ! -f $HOME/.synopsys_pt.setup ) then
                #cp $SYNOPSYS/../pts/admin/setup/.synopsys_pt.setup $HOME/.synopsys_pt.setup
                cp /cad/synopsys/pts/latest/admin/setup/.synopsys_pt.setup $HOME/.synopsys_pt.setup
        endif
endif

#####
# TMAX
#if ( -d "$SYNOPSYS/../txs/sparcOS5/syn/bin" ) then
#	set path = ($path $SYNOPSYS/../txs/sparcOS5/syn/bin)
#endif

# TestGen
#if ( -d "$SYNOPSYS/../tgs/sparcOS5/tg4.2/bin" ) then
#	set path = ($path $SYNOPSYS/../tgs/sparcOS5/tg4.2/bin)
#	echo "TestGen 4.2"
#endif

# VERA 6.3.30
#if ( -d "/cad/synopsys/vera/vera-6.3.30-solaris_64/bin" ) then
#	setenv VERA_HOME /cad/synopsys/vera/vera-6.3.30-solaris_64
#	set path = ($path /cad/synopsys/vera/vera-6.3.30-solaris_64/bin)
#	setenv LD_LIBRARY_PATH "$VERA_HOME/lib:$LD_LIBRARY_PATH"
#	echo "VERA System Verifier 6.3.30"
#endif

#
# VirSim
#
#if ( -d "/cad/synopsys/virsim/4_3_R3" ) then
#	setenv VIRSIMHOME /cad/synopsys/virsim/4_3_R3
#	set path = ($path /cad/synopsys/virsim/4_3_R3/bin)
#	echo "Virtual Simulator Environment (virsim) 4.3 R3"
#endif
#
# rm RailMill
#set ver="U-2003.03-SP2"
#if ( -d "/cad/synopsys/rm/latest/sparc64/rm/bin" ) then
#	set ver=`grep "$arch :" /cad/synopsys/rm/latest/README.rm| head -1| cut -f2 -d:`
#        set path = (/cad/synopsys/rm/latest/$arch/rm/bin $path)
#	echo "RailMill ($arch) $ver"
#	endif
#endif
#
#if ( -d "/cad/synopsys/star-rcxt/latest/${arch}_star-rcxt/bin" ) then
#        set ver=`grep INSTALLING /cad/synopsys/star-rcxt/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#        set path = (/cad/synopsys/star-rcxt/latest/${arch}_star-rcxt/bin $path)
#	echo "Star-RCXT ($arch) $ver"
#	endif
#endif
### Cadabra
#if ( -d "/cad/synopsys/cadabra/latest/bin" ) then
## set ver=`grep "$arch :" /cad/synopsys/cadabra/latest/README.starrc| head -1| cut -f2 -d:`
#  set ver=`grep INSTALLING /cad/synopsys/cadabra/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#  set path = (/cad/synopsys/cadabra/latest/bin $path)
#  setenv CADABRAHOME /cad/synopsys/cadabra/latest
#  echo "Cadabra $ver"
#endif

### starrc
if ( -d "/cad/synopsys/starrc/latest/bin" ) then
# set ver=`grep "$arch :" /cad/synopsys/starrc/latest/README.starrc| head -1| cut -f2 -d:`
  set ver=`grep INSTALLING /cad/synopsys/starrc/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
  set path = (/cad/synopsys/starrc/latest/bin $path)
  echo "StarRC \t\t\t$ver"
endif

#####
set prodid="txs"
if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
        set path = (/cad/synopsys/${prodid}/latest/bin $path)
	echo "TetraMAX_StandAlone \t$ver"
	endif
endif
#set prodid="coretools"
#if ( -d "/cad/synopsys/${prodid}/latest/bin" ) then
#        #set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#        set path = (/cad/synopsys/star-rcxt/latest/${prodid}/bin $path)
#	echo "$prodid ($arch) $ver"
#	endif
#endif
# Arcadia
#set ver="U-2003.03-SP3"
#if ( -d "/cad/synopsys/arc/$ver/$arch/arc/bin" ) then
#       	set path = (/cad/synopsys/arc/$ver/$arch/arc/bin $path)
#	echo "Arcadia ($arch) $ver"
#endif
# Mempro
#
#if ( -d "/cad/synopsys/lmc/" ) then
#	setenv LMC_HOME /cad/synopsys/lmc
#	set path = ($path $LMC_HOME/bin)
#	echo "MemPro 2001.08"
#endif
#
#	Module Compiler (No license)
#    endif
#else
##	echo "Beware .......You have sourced to this file before....."
#	echo ""
#endif
#
# LEDA
#
#if ( -d "/cad/synopsys/leda/latest" ) then
#	setenv LEDA_PATH /cad/synopsys/leda/latest/hspice
#	set path = ($path $LEDA_PATH/bin)
#
##	setenv LD_LIBRARY_PATH $LD_LIBRARY_PATH:$LEDA_PATH/sparcOS5
##	if ( $?LIBPATH ) then
##		setenv LIBPATH $LEDA_PATH/sparcOS5:$LIBPATH
##	else
##		setenv LIBPATH $LEDA_PATH/sparcOS5
##	endif
##	if ( $?SHLIB_PATH ) then
##		setenv SHLIB_PATH $LEDA_PATH/sparcOS5:$SHLIB_PATH
##	else
##		setenv SHLIB_PATH $LEDA_PATH/sparcOS5
##	endif
#	
#	echo "LEDA 4.0.4"
#endif
#
#
# Verilog Compiled Simulator 7.2
#

if ( -d "/cad/synopsys/vcs-mx/latest/bin" ) then
	setenv VCS_HOME /cad/synopsys/vcs-mx/latest
	set vcsplatform=`$VCS_HOME/bin/vcs -platform`
	set ver=`$VCS_HOME/bin/vhdlan -v | grep version| cut -f4 -d" "`
	setenv VCS_ARCH_OVERRIDE linux
	set path=($VCS_HOME/bin \
		$VCS_HOME/$vcsplatform/bin \
		$VCS_HOME/$vcsplatform/util \
		$path)

	echo "VCS-MX Verilog + VHDL mixed simulator \n\t\t\t$ver"
endif

#
# Verilog Compiled Simulator 7.0
#
#if ( -f "/cad/synopsys/vcsi.csh" ) then
#	setenv VCSI_HOME /cad/synopsys/vcsi/vcsi7.0
#	set path=($VCSI_HOME/bin \
#		$VCSI_HOME/`$VCS_HOME/bin/vcs -platform`/bin \
#		$VCSI_HOME/`$VCS_HOME/bin/vcs -platform`/util \
#		$path)
#
#	echo "Verilog Compiled Simulator 7.0"
#endif
#
#	Module Compiler (No license)
#	if ( -f "/cad/synopsys/mc/localadm/setup.csh" ) then
#		source /cad/synopsys/mc/localadm/setup.csh
#	endif


#####
##### VERA
#####
#set prodid="vera"
#if ( -d "/cad/synopsys/${prodid}/latest/admin" ) then
#        set ver=`grep INSTALLING /cad/synopsys/${prodid}/latest/install.log | cut -f3 -d,| head -1 | cut -f2 -d" "`
#        set path = (/cad/synopsys/${prodid}/latest/${prodid}_v${ver}_${arch}/bin $path)
#	setenv VERA_HOME /cad/synopsys/vera/latest/${prodid}_v${ver}_${arch}
#	echo "VERA System Verifier\t$ver"
#	endif
#endif
#echo ""
#echo "Information: http://www.eee.hku.hk/computer/eeefaq/licensedsw.html#synopsys"
#echo "Synopsys OnLine Documentation (SOLD) 	$SYNOPSYS/sold "
#echo "Synopsys OnLine Documentation (SOLD) 	/cad/synopsys/sold/latest/sold "
echo "Synopsys Documentation  	"
echo "    acroread /cad/synopsys/galaxy/latest/top.pdf "
echo "please read the /cad/synopsys/galaxy/README.txt on how to search the documents."

##  Simulation OnLine Documentation  	acroread $SYNOPSYS_SIM/doc/online/sim/sim_home.pdf
#echo "  Licenses will expire on 28 November 2004"
echo "#######################################################################"
