#!/data/data/com.termux/files/usr/bin/bash

# Virtual Number bot for Telegram 
# Sends random virtual numbers to user
# Service: OnlineSim.io
# SourceCode (https://github.com/Kourva/OnlineSimBot)
# Termux support (https://github.com/Anon4You/OnlineSimBot)

apt update && apt upgrade -y

# installing required packages
pkgs=(python build-essential cmake ninja libopenblas libandroid-execinfo patchelf binutils-is-llvm)
for p in "${pkgs[@]}"; do
  if ! hash ${p} > /dev/null 2>&1; then
    printf "\n\e[32m${p} not found installing....\n\e[0m"
    apt install ${p} -y > /dev/null 2>&1
  fi
done

# installing required pips
echo -e "\e[32mInstall pip depends\e[0m"
pip3 install setuptools wheel packaging pyproject_metadata cython meson-python versioneer 

# Check your python version with bellow comnand
# python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")'

: <<'END_COMMENT'
Install Numpy with actual Python version 
On Termux app 
replace version velues if needed
END_COMMENT

MATHLIB=m LDFLAGS="-lpython3.12" pip3 install --no-build-isolation --no-cache-dir numpy

: <<'END_COMMENT'
Install pandas with actual Python version 
On Termux app
replace version velues if needed
END_COMMENT

LDFLAGS="-lpython3.12" pip3 install --no-build-isolation --no-cache-dir pandas

# installing other requirements 
pip install -r requirements.txt

printf "\a\a
Every requirements satisfied
your bot is ready to launch\n
"
