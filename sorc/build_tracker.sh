#!/bin/sh
set -xeu
source ./machine-setup.sh > /dev/null 2>&1

#Supports Debug or Release modes for the build
BUILD_MODE=${BUILD_MODE:-Release}

cwd=$(pwd)

if [ "${BUILD_MODE}" = Release ]; then
  export BUILD_TYPE=RELEASE
else
  export BUILD_TYPE=DEBUG
fi

module use ../modulefiles
module load $target.lua
module list

cd ..

if [ -d "build" ]; then
   rm -rf build
fi
mkdir build
cd build

cmake .. -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER} -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_BUILD_TYPE=${BUILD_TYPE}

make -j 8 VERBOSE=2
make install

cd ..
export home=$PWD

# move into sorc/gfdl_tracker.fd directory
export gfdl_tracker=sorc/gfdl_tracker.fd/code/
cd $gfdl_tracker

# build & compile gfdl-vortextracker executables
if [ -d "build" ]; then
   rm -rf build
fi
mkdir build && cd build
cmake .. -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER} -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
make
make install

# copy gfdl-tracker executables & move them into tc_tracker exec/ dir
cd ..
export gfdl_exec=exec/
cd $gfdl_exec
cp * $home/exec/.

# move back into home/base directory
cd $home
exit