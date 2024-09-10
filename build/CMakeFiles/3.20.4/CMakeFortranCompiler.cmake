set(CMAKE_Fortran_COMPILER "/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/bin/mpif90")
set(CMAKE_Fortran_COMPILER_ARG1 "")
set(CMAKE_Fortran_COMPILER_ID "GNU")
set(CMAKE_Fortran_COMPILER_VERSION "12.3.0")
set(CMAKE_Fortran_COMPILER_WRAPPER "")
set(CMAKE_Fortran_PLATFORM_ID "")
set(CMAKE_Fortran_SIMULATE_ID "")
set(CMAKE_Fortran_SIMULATE_VERSION "")




set(CMAKE_AR "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ar")
set(CMAKE_Fortran_COMPILER_AR "/sw/eb/GCCcore/12.3.0/bin/gcc-ar")
set(CMAKE_RANLIB "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ranlib")
set(CMAKE_Fortran_COMPILER_RANLIB "/sw/eb/GCCcore/12.3.0/bin/gcc-ranlib")
set(CMAKE_COMPILER_IS_GNUG77 1)
set(CMAKE_Fortran_COMPILER_LOADED 1)
set(CMAKE_Fortran_COMPILER_WORKS TRUE)
set(CMAKE_Fortran_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_Fortran_COMPILER_ENV_VAR "FC")

set(CMAKE_Fortran_COMPILER_SUPPORTS_F90 1)

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_Fortran_COMPILER_ID_RUN 1)
set(CMAKE_Fortran_SOURCE_FILE_EXTENSIONS f;F;fpp;FPP;f77;F77;f90;F90;for;For;FOR;f95;F95)
set(CMAKE_Fortran_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_Fortran_LINKER_PREFERENCE 20)
if(UNIX)
  set(CMAKE_Fortran_OUTPUT_EXTENSION .o)
else()
  set(CMAKE_Fortran_OUTPUT_EXTENSION .obj)
endif()

# Save compiler ABI information.
set(CMAKE_Fortran_SIZEOF_DATA_PTR "8")
set(CMAKE_Fortran_COMPILER_ABI "")
set(CMAKE_Fortran_LIBRARY_ARCHITECTURE "")

if(CMAKE_Fortran_SIZEOF_DATA_PTR AND NOT CMAKE_SIZEOF_VOID_P)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_Fortran_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_Fortran_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_Fortran_COMPILER_ABI}")
endif()

if(CMAKE_Fortran_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()





set(CMAKE_Fortran_IMPLICIT_INCLUDE_DIRECTORIES "/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/include;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0/finclude;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/include;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/include;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/include;/sw/eb/FFTW/3.3.10-GCC-12.3.0/include;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/include;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/include;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/include;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/include;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/include;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/include/libxml2;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/include;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/include;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/include;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/include;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/include;/sw/eb/binutils/2.40-GCCcore-12.3.0/include;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/include;/sw/eb/imkl/2023.1.0/mkl/2023.1.0/include/fftw;/sw/eb/imkl/2023.1.0/mkl/2023.1.0/include;/sw/eb/OpenSSL/1.1/include;/sw/eb/impi/2021.9.0-intel-compilers-2023.1.0/mpi/2021.9.0/include;/sw/eb/intel-compilers/2023.1.0/tbb/2021.9.0/include;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include;/sw/eb/GCCcore/12.3.0/include;/usr/include")
set(CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES "mpi_usempif08;mpi_usempi_ignore_tkr;mpi_mpifh;mpi;gfortran;m;gcc_s;gcc;quadmath;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_Fortran_IMPLICIT_LINK_DIRECTORIES "/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/lib;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/lib;/sw/eb/ScaLAPACK/2.2.0-gompi-2023a-fb/lib64;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/lib64;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib64;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/lib64;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/lib64;/sw/eb/FFTW/3.3.10-GCC-12.3.0/lib64;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/lib64;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/lib64;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/lib64;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/lib64;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/lib64;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/lib64;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/lib64;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/lib64;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/lib64;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/lib64;/sw/eb/binutils/2.40-GCCcore-12.3.0/lib64;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/lib64;/sw/eb/OpenSSL/1.1/lib64;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0;/sw/eb/GCCcore/12.3.0/lib64;/lib64;/usr/lib64;/sw/eb/ScaLAPACK/2.2.0-gompi-2023a-fb/lib;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/lib;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/lib;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/lib;/sw/eb/FFTW/3.3.10-GCC-12.3.0/lib;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/lib;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/lib;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/lib;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/lib;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/lib;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/lib;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/lib;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/lib;/sw/eb/binutils/2.40-GCCcore-12.3.0/lib;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/lib;/sw/eb/imkl/2023.1.0/mkl/2023.1.0/lib/intel64;/sw/eb/imkl/2023.1.0/compiler/2023.1.0/linux/compiler/lib/intel64_lin;/sw/eb/OpenSSL/1.1/lib;/sw/eb/imkl-FFTW/2023.1.0-iimpi-2023.03/lib;/sw/eb/impi/2021.9.0-intel-compilers-2023.1.0/mpi/2021.9.0/libfabric/lib;/sw/eb/impi/2021.9.0-intel-compilers-2023.1.0/mpi/2021.9.0/lib/release;/sw/eb/impi/2021.9.0-intel-compilers-2023.1.0/mpi/2021.9.0/lib;/sw/eb/intel-compilers/2023.1.0/tbb/2021.9.0/lib/intel64/gcc4.8;/sw/eb/intel-compilers/2023.1.0/compiler/2023.1.0/linux/compiler/lib/intel64_lin;/sw/eb/intel-compilers/2023.1.0/compiler/2023.1.0/linux/lib/x64;/sw/eb/intel-compilers/2023.1.0/compiler/2023.1.0/linux/lib;/sw/eb/GCCcore/12.3.0/lib")
set(CMAKE_Fortran_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
