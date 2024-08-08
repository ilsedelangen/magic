set(CMAKE_C_COMPILER "/sw/eb/GCCcore/12.3.0/bin/gcc")
set(CMAKE_C_COMPILER_ARG1 "")
set(CMAKE_C_COMPILER_ID "GNU")
set(CMAKE_C_COMPILER_VERSION "12.3.0")
set(CMAKE_C_COMPILER_VERSION_INTERNAL "")
set(CMAKE_C_COMPILER_WRAPPER "")
set(CMAKE_C_STANDARD_COMPUTED_DEFAULT "11")
set(CMAKE_C_COMPILE_FEATURES "c_std_90;c_function_prototypes;c_std_99;c_restrict;c_variadic_macros;c_std_11;c_static_assert")
set(CMAKE_C90_COMPILE_FEATURES "c_std_90;c_function_prototypes")
set(CMAKE_C99_COMPILE_FEATURES "c_std_99;c_restrict;c_variadic_macros")
set(CMAKE_C11_COMPILE_FEATURES "c_std_11;c_static_assert")

set(CMAKE_C_PLATFORM_ID "Linux")
set(CMAKE_C_SIMULATE_ID "")
set(CMAKE_C_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_C_SIMULATE_VERSION "")




set(CMAKE_AR "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ar")
set(CMAKE_C_COMPILER_AR "/sw/eb/GCCcore/12.3.0/bin/gcc-ar")
set(CMAKE_RANLIB "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ranlib")
set(CMAKE_C_COMPILER_RANLIB "/sw/eb/GCCcore/12.3.0/bin/gcc-ranlib")
set(CMAKE_LINKER "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ld")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCC 1)
set(CMAKE_C_COMPILER_LOADED 1)
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_C_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_C_COMPILER_ENV_VAR "CC")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_C_COMPILER_ID_RUN 1)
set(CMAKE_C_SOURCE_FILE_EXTENSIONS c;m)
set(CMAKE_C_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_C_LINKER_PREFERENCE 10)

# Save compiler ABI information.
set(CMAKE_C_SIZEOF_DATA_PTR "8")
set(CMAKE_C_COMPILER_ABI "ELF")
set(CMAKE_C_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_C_LIBRARY_ARCHITECTURE "")

if(CMAKE_C_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_C_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_C_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_C_COMPILER_ABI}")
endif()

if(CMAKE_C_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_C_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_C_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_C_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES "/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/include;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/include;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/include;/sw/eb/FFTW/3.3.10-GCC-12.3.0/include;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/include;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/include;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/include;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/include;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/include;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/include;/sw/eb/OpenSSL/1.1/include;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/include;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/include;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/include/libxml2;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/include;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/include;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/include;/sw/eb/binutils/2.40-GCCcore-12.3.0/include;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/include;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include;/sw/eb/GCCcore/12.3.0/include;/usr/include")
set(CMAKE_C_IMPLICIT_LINK_LIBRARIES "gcc;gcc_s;c;gcc;gcc_s")
set(CMAKE_C_IMPLICIT_LINK_DIRECTORIES "/sw/eb/ScaLAPACK/2.2.0-gompi-2023a-fb/lib64;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/lib64;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/lib64;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/lib64;/sw/eb/FFTW/3.3.10-GCC-12.3.0/lib64;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib64;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/lib64;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/lib64;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/lib64;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/lib64;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/lib64;/sw/eb/OpenSSL/1.1/lib64;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/lib64;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/lib64;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/lib64;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/lib64;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/lib64;/sw/eb/binutils/2.40-GCCcore-12.3.0/lib64;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/lib64;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0;/sw/eb/GCCcore/12.3.0/lib64;/lib64;/usr/lib64;/sw/eb/ScaLAPACK/2.2.0-gompi-2023a-fb/lib;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/lib;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/lib;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/lib;/sw/eb/FFTW/3.3.10-GCC-12.3.0/lib;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/lib;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/lib;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/lib;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/lib;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/lib;/sw/eb/OpenSSL/1.1/lib;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/lib;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/lib;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/lib;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/lib;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/lib;/sw/eb/binutils/2.40-GCCcore-12.3.0/lib;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/lib;/sw/eb/GCCcore/12.3.0/lib")
set(CMAKE_C_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
