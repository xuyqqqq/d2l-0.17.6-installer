# D2L-0.17.6 Installer

**D2L 0.17.6 Installer for Apple Silicon**

This installer resolves the following common issues on Apple Silicon:

1. "ERROR: Failed building wheel for pandas"
2. "ERROR: Failed to build installable wheels for some pyproject.toml based projects (pandas)"
3. "AttributeError: module 'd2l.torch' has no attribute 'train_ch3'"

## Prepare

### Installation (Based on the book)

**Download Miniconda**
Download and install Miniconda for Apple Silicon (arm64) from the official web:

```
curl -O https://repo.anaconda.com/miniconda/Miniconda3-py39_25.3.1-1-MacOSX-arm64.sh
```

**Install Miniconda**
After downloading the installer, open a terminal and run the following command:

```
sh Miniconda3-py39_25.3.1-1-MacOSX-arm64.sh -b
touch ~/.zshrc
~/miniconda3/bin/conda init
```

**Restart the Terminal and Create a Python Environment**
After restarting the terminal, create a new conda environment with Python 3.9:

```
conda create --name d2l python=3.9 -y
conda activate d2l
```

## Install D2L

```
conda activate d2l
git clone https://github.com/xuyqqqq/d2l-0.17.6-installer.git
cd d2l-0.17.6-installer
sh d2l_0_17_6_installer.sh
```
