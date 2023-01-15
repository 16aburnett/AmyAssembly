#! /bin/bash

# Build script for AmyAssembly Interpreter 
# Author: Amy Burnett

export INSTALL_DIR="$HOME/bin"

# build 
echo "Building AmyAssembly Interpreter"
pyinstaller amyAssemblyInterpreter.py --noconfirm -n amyasmi --clean
echo "Finished Building AmyAssembly Interpreter"

# install
echo "Installing amyasmi into $INSTALL_DIR"
mkdir -p $INSTALL_DIR
# delete previous
rm -f $INSTALL_DIR/amyasmi
ln -s `pwd`/dist/amyasmi/amyasmi "$INSTALL_DIR/amyasmi"

# ensure it is in the path
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo "Warning: You need to add $HOME/bin to your path"
    echo "   you can do this by adding the following line to your ~/.bashrc"
    echo 'export PATH="$HOME/bin:$PATH"'
fi

echo "Install finished"