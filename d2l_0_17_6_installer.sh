#!/bin/sh

echo "=== Environment Pre-Check ==="

# Check if conda is available
if ! command -v conda >/dev/null 2>&1; then
    echo "Error: conda is not found in PATH. Please install and activate conda."
    exit 1
fi

if ! conda config --show channels | grep -q "conda-forge"; then
    echo "conda-forge channel not found. Adding conda-forge channel..."
    conda config --add channels conda-forge
fi

if ! command -v python >/dev/null 2>&1; then
    echo "Error: python is not found in PATH. Please activate a conda environment with python."
    exit 1
fi

pip install torch==1.12.0
pip install torchvision==0.13.0

conda install -c conda-forge "d2l==0.17.6"

python_bin=$(which python)
env_path=$(dirname $(dirname $(realpath "$python_bin")))

python_version=$(python -c "import sys; print(f'python{sys.version_info.major}.{sys.version_info.minor}')")

metadata_file="$env_path/lib/$python_version/site-packages/d2l-0.17.6.dist-info/METADATA"

if [ -f "$metadata_file" ]; then
    echo "Found METADATA at: $metadata_file"
    sed -i '' 's/^Requires-Dist: pandas (==1\.2\.4)$/# Requires-Dist: pandas (==1.2.4)/' "$metadata_file"
    echo "Requires-Dist: pandas (==1.2.4) has been commented out."
else
    echo "d2l 0.17.6 METADATA file not found!"
    exit 1
fi

conda install -c conda-forge "pandas>1.5,<2.0"

echo "=== Done ==="

