# example .bashrc

# Quick way to get home
export SCRATCH_HOME=/scratch/iansseijelly


####################################
# SERVER Specific Configuration
####################################

export LD_LIBRARY_PATH=$SCRATCH_HOME/local-lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Quickly call the vlsi script for the tools
source /ecad/tools/vlsi.bashrc
export VCS_LIC_EXPIRE_WARNING=0

# Set SBT to cache locally
# Used in Chipyard SBT invocation and $SCRATCH_HOME/bin
export CACHE_OPTS="-Dsbt.ivy.home=$SCRATCH_HOME/.ivy2 -Dsbt.global.base=$SCRATCH_HOME/.sbt -Dsbt.boot.directory=$SCRATCH_HOME/.sbt/boot/"
export JVM_OPTS="-Xmx8G -Xss8M -Djava.io.tmpdir=$SCRATCH_HOME/.java_tmp"

# support newer chipyard
export JAVA_OPTS="$JVM_OPTS"
export SBT_OPTS="$CACHE_OPTS"

export COURSIER_CACHE=$SCRATCH_HOME/.coursier-cache

# only source on firesim1
# Get Vitis (and Vivado) 2020.2
source /ecad/tools/xilinx/Vitis/2021.1/settings64.sh > /dev/null

# Get XRT
#source /opt/xilinx/xrt/setup.sh > /dev/null

#export PS1="\[$(tput setaf 7)\]\u@\h:\w $ \[$(tput sgr0)\]"
alias ls='ls --color'
LS_COLORS='di=96:fi=35:ln=31:pi=5:so=5:bd=5:cd=10:or=31:mi=0:ex=32:*.rpm=90#'
export LS_COLORS

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/scratch/iansseijelly/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/scratch/iansseijelly/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/scratch/iansseijelly/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/scratch/iansseijelly/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

