help([[
loads TC_tracker modulefile and related set environment veriables on GAEA C6
]])

prepend_path("MODULEPATH", "/autofs/ncrc-svm1_proj/epic/spack-stack/spack-stack-1.6.0/envs/unified-env-c6/install/modulefiles/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2023.2.0"
load(pathJoin("stack-intel", stack_intel_ver))

stack_mpich_ver=os.getenv("stack_mpich_ver") or "8.1.29"
load(pathJoin("stack-cray-mpich", stack_mpich_ver))

craype_ver=os.getenv("craype_ver") or "2.7.30"
load(pathJoin("craype", craype_ver))

cmake_ver=os.getenv("cmake_ver") or "3.23.1"
load(pathJoin("cmake", cmake_ver))

jasper_ver=os.getenv("jasper_ver") or "2.0.32"
load(pathJoin("jasper", jasper_ver))

zlib_ver=os.getenv("zlib_ver") or "1.2.13"
load(pathJoin("zlib", zlib_ver))

libpng_ver=os.getenv("libpng_ver") or "1.6.37"
load(pathJoin("libpng", libpng_ver))

hdf5_ver=os.getenv("hdf5_ver") or "1.14.0"
load(pathJoin("hdf5", hdf5_ver))

netcdf_c_ver=os.getenv("netcdf_c_ver") or "4.9.2"
load(pathJoin("netcdf-c", netcdf_c_ver))

netcdf_fortran_ver=os.getenv("netcdf_fortran_ver") or "4.6.1"
load(pathJoin("netcdf-fortran", netcdf_fortran_ver))

bacio_ver=os.getenv("bacio_ver") or "2.4.1"
load(pathJoin("bacio", bacio_ver))

g2_ver=os.getenv("g2_ver") or "3.4.5"
load(pathJoin("g2", g2_ver))

g2tmpl_ver=os.getenv("g2tmpl_ver") or "1.10.2"
load(pathJoin("g2tmpl", g2tmpl_ver))

w3emc_ver=os.getenv("w3emc_ver") or "2.10.0"
load(pathJoin("w3emc", w3emc_ver))

sigio_ver=os.getenv("sigio_ver") or "2.3.2"
load(pathJoin("sigio", sigio_ver))

prod_util_ver=os.getenv("prod_util_ver") or "2.1.1"
load(pathJoin("prod_util", prod_util_ver))

wgrib2_ver=os.getenv("wgrib2_ver") or "2.0.8"
load(pathJoin("wgrib2", wgrib2_ver))

grib_util_ver=os.getenv("grib_util_ver") or "1.3.0"
load(pathJoin("grib-util", grib_util_ver))

setenv("CC", "cc")
setenv("CXX", "CC")
setenv("FC", "ftn")
setenv("CMAKE_C_COMPILER", "cc")
setenv("CMAKE_CXX_COMPILER", "CC")
setenv("CMAKE_Fortran_COMPILER", "ftn")
setenv("CMAKE_Platform", "gaeac6")

