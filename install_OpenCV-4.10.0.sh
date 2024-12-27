#!/bin/bash
#SBATCH -N 1
#SBATCH -n 32
#SBATCH -p rc
#SBATCH -t 8:00:00

# Setting up the environment
source env_OpenCV-4.10.0.sh

# Creating the src directory for the installed application
mkdir -p $SOFTWARE_DIRECTORY/src

# Installing $SOFTWARE_NAME/$SOFTWARE_VERSION
cd $SOFTWARE_DIRECTORY/src
wget https://github.com/opencv/opencv/archive/refs/tags/4.10.0.tar.gz
tar -xvf 4.10.0.tar.gz
wget -O opencv-contrib.tar.gz https://github.com/opencv/opencv_contrib/archive/refs/tags/4.10.0.tar.gz
tar -xvf opencv-contrib.tar.gz
mkdir -p build
cd build
cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.10.0/modules -DCMAKE_INSTALL_PREFIX=$SOFTWARE_DIRECTORY ../opencv-4.10.0
make
make install

# Creating modulefile
touch $SOFTWARE_VERSION
echo "#%Module" >> $SOFTWARE_VERSION
echo "module-whatis	 \"Loads $SOFTWARE_NAME/$SOFTWARE_VERSION module." >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "This module was built on $(date)" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "OpenCV (https://opencv.org/) is a compute vision library." >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "The script used to build this module can be found here: $GITHUB_URL" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "To load the module, type:" >> $SOFTWARE_VERSION
echo "module load $SOFTWARE_NAME/$SOFTWARE_VERSION" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "\"" >> $SOFTWARE_VERSION
echo "" >> $SOFTWARE_VERSION
echo "conflict	 $SOFTWARE_NAME" >> $SOFTWARE_VERSION
echo "prepend-path	 PATH $SOFTWARE_DIRECTORY/bin" >> $SOFTWARE_VERSION
echo "prepend-path	 LD_LIBRARY_PATH $SOFTWARE_DIRECTORY/lib64" >> $SOFTWARE_VERSION
echo "prepend-path	 LIBRARY_PATH $SOFTWARE_DIRECTORY/lib64" >> $SOFTWARE_VERSION
echo "prepend-path	 CPATH $SOFTWARE_DIRECTORY/include" >> $SOFTWARE_VERSION

# Moving modulefile
mkdir -p $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME
cp $SOFTWARE_VERSION $CLUSTER_DIRECTORY/modulefiles/$SOFTWARE_NAME/$SOFTWARE_VERSION
cp $SOFTWARE_VERSION $CURRENT_PATH
