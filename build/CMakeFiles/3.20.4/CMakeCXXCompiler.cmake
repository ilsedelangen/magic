set(CMAKE_CXX_COMPILER "/sw/eb/GCCcore/12.3.0/bin/c++")
set(CMAKE_CXX_COMPILER_ARG1 "")
set(CMAKE_CXX_COMPILER_ID "GNU")
set(CMAKE_CXX_COMPILER_VERSION "12.3.0")
set(CMAKE_CXX_COMPILER_VERSION_INTERNAL "")
set(CMAKE_CXX_COMPILER_WRAPPER "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "17")
set(CMAKE_CXX_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20;cxx_std_23")
set(CMAKE_CXX98_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters")
set(CMAKE_CXX11_COMPILE_FEATURES "cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates")
set(CMAKE_CXX14_COMPILE_FEATURES "cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates")
set(CMAKE_CXX17_COMPILE_FEATURES "cxx_std_17")
set(CMAKE_CXX20_COMPILE_FEATURES "cxx_std_20")
set(CMAKE_CXX23_COMPILE_FEATURES "cxx_std_23")

set(CMAKE_CXX_PLATFORM_ID "Linux")
set(CMAKE_CXX_SIMULATE_ID "")
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "")
set(CMAKE_CXX_SIMULATE_VERSION "")




set(CMAKE_AR "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ar")
set(CMAKE_CXX_COMPILER_AR "/sw/eb/GCCcore/12.3.0/bin/gcc-ar")
set(CMAKE_RANLIB "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ranlib")
set(CMAKE_CXX_COMPILER_RANLIB "/sw/eb/GCCcore/12.3.0/bin/gcc-ranlib")
set(CMAKE_LINKER "/sw/eb/binutils/2.40-GCCcore-12.3.0/bin/ld")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCXX 1)
set(CMAKE_CXX_COMPILER_LOADED 1)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)
set(CMAKE_COMPILER_IS_MINGW )
set(CMAKE_COMPILER_IS_CYGWIN )
if(CMAKE_COMPILER_IS_CYGWIN)
  set(CYGWIN 1)
  set(UNIX 1)
endif()

set(CMAKE_CXX_COMPILER_ENV_VAR "CXX")

if(CMAKE_COMPILER_IS_MINGW)
  set(MINGW 1)
endif()
set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_CXX_SOURCE_FILE_EXTENSIONS C;M;c++;cc;cpp;cxx;m;mm;mpp;CPP)
set(CMAKE_CXX_IGNORE_EXTENSIONS inl;h;hpp;HPP;H;o;O;obj;OBJ;def;DEF;rc;RC)

foreach (lang C OBJC OBJCXX)
  if (CMAKE_${lang}_COMPILER_ID_RUN)
    foreach(extension IN LISTS CMAKE_${lang}_SOURCE_FILE_EXTENSIONS)
      list(REMOVE_ITEM CMAKE_CXX_SOURCE_FILE_EXTENSIONS ${extension})
    endforeach()
  endif()
endforeach()

set(CMAKE_CXX_LINKER_PREFERENCE 30)
set(CMAKE_CXX_LINKER_PREFERENCE_PROPAGATES 1)

# Save compiler ABI information.
set(CMAKE_CXX_SIZEOF_DATA_PTR "8")
set(CMAKE_CXX_COMPILER_ABI "ELF")
set(CMAKE_CXX_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_CXX_LIBRARY_ARCHITECTURE "")

if(CMAKE_CXX_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_CXX_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_CXX_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_CXX_COMPILER_ABI}")
endif()

if(CMAKE_CXX_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_CXX_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/include;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/include;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/include;/sw/eb/FFTW/3.3.10-GCC-12.3.0/include;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/include;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/include;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/include;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/include;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/include;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/include;/sw/eb/OpenSSL/1.1/include;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/include;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/include;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/include/libxml2;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/include;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/include;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/include;/sw/eb/binutils/2.40-GCCcore-12.3.0/include;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/include;/sw/eb/GCCcore/12.3.0/include/c++/12.3.0;/sw/eb/GCCcore/12.3.0/include/c++/12.3.0/x86_64-pc-linux-gnu;/sw/eb/GCCcore/12.3.0/include/c++/12.3.0/backward;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0/include;/sw/eb/GCCcore/12.3.0/include;/usr/include")
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "stdc++;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES "/sw/eb/ScaLAPACK/2.2.0-gompi-2023a-fb/lib64;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/lib64;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/lib64;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/lib64;/sw/eb/FFTW/3.3.10-GCC-12.3.0/lib64;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib64;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/lib64;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/lib64;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/lib64;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/lib64;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/lib64;/sw/eb/OpenSSL/1.1/lib64;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/lib64;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/lib64;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/lib64;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/lib64;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/lib64;/sw/eb/binutils/2.40-GCCcore-12.3.0/lib64;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/lib64;/sw/eb/GCCcore/12.3.0/lib/gcc/x86_64-pc-linux-gnu/12.3.0;/sw/eb/GCCcore/12.3.0/lib64;/lib64;/usr/lib64;/sw/eb/ScaLAPACK/2.2.0-gompi-2023a-fb/lib;/sw/eb/FlexiBLAS/3.3.1-GCC-12.3.0/lib;/sw/eb/OpenBLAS/0.3.23-GCC-12.3.0/lib;/sw/eb/FFTW.MPI/3.3.10-gompi-2023a/lib;/sw/eb/FFTW/3.3.10-GCC-12.3.0/lib;/sw/eb/OpenMPI/4.1.5-GCC-12.3.0/lib;/sw/eb/UCC/1.2.0-GCCcore-12.3.0/lib;/sw/eb/PMIx/4.2.4-GCCcore-12.3.0/lib;/sw/eb/libfabric/1.18.0-GCCcore-12.3.0/lib;/sw/eb/UCX/1.14.1-GCCcore-12.3.0/lib;/sw/eb/libevent/2.1.12-GCCcore-12.3.0/lib;/sw/eb/OpenSSL/1.1/lib;/sw/eb/hwloc/2.9.1-GCCcore-12.3.0/lib;/sw/eb/libpciaccess/0.17-GCCcore-12.3.0/lib;/sw/eb/libxml2/2.11.4-GCCcore-12.3.0/lib;/sw/eb/XZ/5.4.2-GCCcore-12.3.0/lib;/sw/eb/numactl/2.0.16-GCCcore-12.3.0/lib;/sw/eb/binutils/2.40-GCCcore-12.3.0/lib;/sw/eb/zlib/1.2.13-GCCcore-12.3.0/lib;/sw/eb/GCCcore/12.3.0/lib")
set(CMAKE_CXX_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
