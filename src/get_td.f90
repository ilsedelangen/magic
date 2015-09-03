#include "intrinsic_sizes.h"
#include "perflib_preproc.cpp"
#ifdef WITH_LIKWID
#include "likwid_f90.h"
#endif

module nonlinear_lm_mod

   use, intrinsic :: iso_c_binding
   use precision_mod, only: cp
   use truncation, only: lm_max, l_max, lm_maxMag
   use logic, only : l_anel, l_conv_nl, l_corr, l_heat, l_anelastic_liquid, &
                     l_mag_nl, l_mag_kin, l_mag_LF, l_RMStest, l_conv,      &
                     l_mag
   use radial_functions, only: r,or2,or1,beta,rho0,rgrav,epscProf,or4,temp0
   use physical_parameters, only: CorFac,ra,epsc,ViscHeatFac,OhmLossFac,n_r_LCR
   use blocking, only: lm2l, lm2m, lm2lmP, lmP2lmPS, lmP2lmPA, lm2lmA, &
                       lm2lmS, st_map
   use horizontal_data, only: dLh, dTheta1S, dTheta1A, dPhi, dTheta2A, &
                              dTheta3A, dTheta4A, dPhi0, dTheta2S,     &
                              dTheta3S, dTheta4S, hdif_V, hdif_B
   use RMS, only: AdvPolLMr, AdvPolAs2hInt, AdvPol2hInt, AdvTor2hInt, &
                  AdvTorAs2hInt, PreLMr, Pre2hInt, PreAs2hInt,BuoLMr, &
                  Buo2hInt, BuoAs2hInt, CorPolLMr, CorPol2hInt,       &
                  CorPolAs2hInt, CorTor2hInt, CorTorAs2hInt,          &
                  LFPolLMr, LFPol2hInt, LFPolAs2hInt, LFTor2hInt,     &
                  LFTorAs2hInt, GeoLMr, Geo2hInt, GeoAs2hInt,         &
                  Mag2hInt, MagAs2hInt, MagLMr, ArcLMr, Arc2hInt,     &
                  ArcAs2hInt
   use leg_helper_mod, only:leg_helper_t
   use const, only: zero, two
   use fields, only: w_Rloc,dw_Rloc,z_Rloc
   use RMS_helpers, only: hInt2Pol, hInt2Tor
    

   implicit none
 
   type :: nonlinear_lm_t
      !----- Nonlinear terms in lm-space: 
      complex(cp), allocatable :: AdvrLM(:), AdvtLM(:), AdvpLM(:)
      complex(cp), allocatable :: LFrLM(:),  LFtLM(:),  LFpLM(:)
      complex(cp), allocatable :: VxBrLM(:), VxBtLM(:), VxBpLM(:)
      complex(cp), allocatable :: VSrLM(:),  VStLM(:),  VSpLM(:)
      complex(cp), allocatable :: ViscHeatLM(:), OhmLossLM(:)
 
   contains
 
      procedure :: initialize
      procedure :: finalize
      procedure :: output
      procedure :: set_zero
      procedure :: get_td
 
   end type nonlinear_lm_t

contains

   subroutine initialize(this,lmP_max)

      class(nonlinear_lm_t) :: this
      integer, intent(in) :: lmP_max
      !integer :: size_in_bytes

      allocate( this%AdvrLM(lmP_max) )   
      allocate( this%AdvtLM(lmP_max) )   
      allocate( this%AdvpLM(lmP_max) )   
      allocate( this%LFrLM(lmP_max) )    
      allocate( this%LFtLM(lmP_max) )    
      allocate( this%LFpLM(lmP_max) )    
      allocate( this%VxBrLM(lmP_max) )   
      allocate( this%VxBtLM(lmP_max) )   
      allocate( this%VxBpLM(lmP_max) )   
      allocate( this%VSrLM(lmP_max) )    
      allocate( this%VStLM(lmP_max) )    
      allocate( this%VSpLM(lmP_max) )    
      allocate( this%ViscHeatLM(lmP_max) )
      allocate( this%OhmLossLM(lmP_max) )
      !size_in_bytes=14*lmP_max*SIZEOF_DOUBLE_COMPLEX
      !write(*,"(A,I15,A)") "nonlinear_lm: allocated ",size_in_bytes,"B."
      !call this%set_zero()

      !write(*,"(A,I5,A,I10,A)") "cache info for first element,  &
      !     &       size is lmP_max=",lmP_max," = ",lmP_max*16,"B"
      !call print_cache_info_dcmplx("this%AdvrLM"//C_NULL_CHAR,this%AdvrLM(1))
      !call print_cache_info_dcmplx("this%AdvtLM"//C_NULL_CHAR,this%AdvtLM(1))
      !call print_cache_info_dcmplx("this%AdvpLM"//C_NULL_CHAR,this%AdvpLM(1))

      !call print_address("this%VStLM"//C_NULL_CHAR,this%VStLM(1))
      !call print_address("this%VSpLM"//C_NULL_CHAR,this%VSpLM(1))

   end subroutine initialize
!----------------------------------------------------------------------------
   subroutine finalize(this)

      class(nonlinear_lm_t) :: this

      deallocate( this%AdvrLM )   
      deallocate( this%AdvtLM )   
      deallocate( this%AdvpLM )   
      deallocate( this%LFrLM )    
      deallocate( this%LFtLM )    
      deallocate( this%LFpLM )    
      deallocate( this%VxBrLM )   
      deallocate( this%VxBtLM )   
      deallocate( this%VxBpLM )   
      deallocate( this%VSrLM )    
      deallocate( this%VStLM )    
      deallocate( this%VSpLM )    
      deallocate( this%ViscHeatLM )
      deallocate( this%OhmLossLM )

   end subroutine finalize
!----------------------------------------------------------------------------
   subroutine set_zero(this)

      class(nonlinear_lm_t) :: this
      
      this%AdvrLM=zero
      this%AdvtLM=zero
      this%AdvpLM=zero
      this%LFrLM=zero
      this%LFtLM=zero
      this%LFpLM=zero
      this%VxBrLM=zero
      this%VxBtLM=zero
      this%VxBpLM=zero
      this%VSrLM=zero
      this%VStLM=zero
      this%VSpLM=zero
      this%ViscHeatLM=zero
      this%OhmLossLM=zero

   end subroutine set_zero
!----------------------------------------------------------------------------
   subroutine output(this)

      class(nonlinear_lm_t) :: this
      
      write(*,"(A,6ES20.12)") "AdvrLM,AdvtLM,AdvpLM = ",&
           & sum(this%AdvrLM), sum(this%AdvtLM),        &
           & sum(this%AdvpLM)

   end subroutine output
!----------------------------------------------------------------------------
   subroutine get_td(this,nR,nBc,lRmsCalc,dVSrLM,dVxBhLM, &
        &            dwdt,dzdt,dpdt,dsdt,dbdt,djdt,leg_helper)
      !  +-------------------------------------------------------------------+
      !  |                                                                   |
      !  |  Purpose of this to calculate time derivatives                    |
      !  |  dwdt,dzdt,dpdt,dsdt,dbdt,djdt                                    |
      !  |  and auxiliary arrays dVSrLM and dVxBhLM                          |
      !  |  from non-linear terms in spectral form,                          |
      !  |  contained in flmw1-3,flms1-3, flmb1-3 (input)                    |
      !  |                                                                   |
      !  +-------------------------------------------------------------------+
    
      !-- Input of variables:
      class(nonlinear_lm_t) :: this

      integer,            intent(in) :: nR
      integer,            intent(in) :: nBc ! signifies boundary conditions
      logical,            intent(in) :: lRmsCalc
      type(leg_helper_t), intent(in) :: leg_helper
    
      !-- Output of variables:
      complex(cp), intent(out) :: dwdt(lm_max),dzdt(lm_max)
      complex(cp), intent(out) :: dpdt(lm_max),dsdt(lm_max)
      complex(cp), intent(out) :: dbdt(lm_maxMag),djdt(lm_maxMag)
      complex(cp), intent(out) :: dVxBhLM(lm_maxMag)
      complex(cp), intent(out) :: dVSrLM(lm_max)
    
      !-- Local variables:
      integer :: l,m,lm,lmS,lmA,lmP,lmPS,lmPA
      complex(cp) :: CorPol(lm_max),CorTor(lm_max)
      complex(cp) :: AdvPol(lm_max),AdvTor(lm_max)
      complex(cp) :: LFPol(lm_max),LFTor(lm_max)
      complex(cp) :: AdvPol_loc,CorPol_loc,AdvTor_loc,CorTor_loc
      complex(cp) :: dsdt_loc
    
      integer, parameter :: DOUBLE_COMPLEX_PER_CACHELINE=4
    
    
      !write(*,"(I3,A,4ES20.12)") nR,": get_td start: ",SUM(this%AdvrLM), &
      !                                                 SUM(leg_helper%dLHz)
    
      !lm_chunksize=(((lm_max)/nThreads)/DOUBLE_COMPLEX_PER_CACHELINE) * &
      !             & DOUBLE_COMPLEX_PER_CACHELINE
      !lm_chunksize=4
      !write(*,"(A,I4)") "Using a chunksize of ",lm_chunksize
    
      if ( nBc > 0 ) then   ! boundary !
         !PERFON('td_bnd')
         if ( l_mag_nl .or. l_mag_kin ) then
    
            !----- Stress free boundary, only nl mag. term for poloidal field needed.
            !      Because the radial derivative will be taken, this will contribute to
            !      the other radial grid points.
            dVxBhLM(1)=zero
            dVSrLM(1) =zero
            do lm=2,lm_max
               l   =lm2l(lm)
               m   =lm2m(lm)
               lmP =lm2lmP(lm)
               lmPS=lmP2lmPS(lmP)   ! l-1
               lmPA=lmP2lmPA(lmP)   ! l+1
               if ( l > m ) then
                  dVxBhLM(lm)=r(nR)*r(nR)* (               &
                       & dTheta1S(lm)*this%VxBtLM(lmPS) -  &
                       & dTheta1A(lm)*this%VxBtLM(lmPA) +  &
                       &     dPhi(lm)*this%VxBpLM(lmP)  )
               else if ( l == m ) then ! (l-1) not allowed !
                  dVxBhLM(lm)=r(nR)*r(nR)* (               &
                       - dTheta1A(lm)*this%VxBtLM(lmPA) +  &
                       dPhi(lm)*this%VxBpLM(lmP)  )
               end if
               dVSrLM(lm)=zero
            end do
    
         else
            do lm=1,lm_max
               if ( l_mag ) dVxBhLM(lm)=zero
               dVSrLM(lm) =zero
            end do
         end if
         if ( l_heat ) then
            do lm=1,lm_max
               dVSrLM(lm)=zero
            end do
         end if
         !PERFOFF
      else
    
         if ( l_conv ) then  ! Convection
    
            lm =1   ! This is l=0,m=0
            lmA=lm2lmA(lm)
            lmP=1
            lmPA=lmP2lmPA(lmP)
            if ( l_conv_nl ) then
               AdvPol_loc=      or2(nR)*this%AdvrLM(lm)
               AdvTor_loc=-dTheta1A(lm)*this%AdvpLM(lmPA)
            else
               AdvPol_loc=zero
               AdvTor_loc=zero
            end if
            if ( l_corr ) then
               CorPol_loc=two*CorFac*or1(nR) * dTheta2A(lm)* z_Rloc(lmA,nR)
               CorTor_loc= two*CorFac*or2(nR) * ( &
                    dTheta3A(lm)*dw_Rloc(lmA,nR) + &
                    or1(nR)*dTheta4A(lm)* w_Rloc(lmA,nR) )
            else
               CorPol_loc=zero
               CorTor_loc=zero
            end if
            dwdt(lm)=AdvPol_loc+CorPol_loc
            dzdt(lm)=AdvTor_loc+CorTor_loc
            if ( lRmsCalc .and. l_mag_LF .and. nR>n_r_LCR ) then
               LFPol(lm) =      or2(nR)*this%LFrLM(lm)
               LFTor(lm) =-dTheta1A(lm)*this%LFpLM(lmPA)
               AdvPol(lm)=AdvPol_loc-LFPol(lm)
               AdvTor(lm)=AdvTor(lm)-LFTor(lm)
               CorPol(lm) = CorPol_loc
            end if
    
            !PERFON('td_cv1')
            !$OMP PARALLEL do default(none) &
            !$OMP private(lm,l,m,lmS,lmA,lmP,lmPS,lmPA) &
            !$OMP private(AdvPol_loc,CorPol_loc,AdvTor_loc,CorTor_loc) &
            !$OMP shared(lm2l,lm2m,lm2lmS,lm2lmA,lm2lmP,lmP2lmPS,lmP2lmPA) &
            !$OMP shared(lm_max,l_corr,l_max,l_conv_nl,lRmsCalc,l_mag_LF) &
            !$OMP shared(CorPol,AdvPol,LFPol,CorTor,AdvTor,LFTor,z_Rloc,nR) &
            !$OMP shared(w_Rloc,this,dw_Rloc) &
            !$OMP shared(CorFac,or1,or2,dPhi0,dPhi,dTheta2A,dTheta2S,n_r_LCR) &
            !$OMP shared(dTheta3A,dTheta4A,dTheta3S,dTheta4S,dTheta1S,dTheta1A) &
            !$OMP shared(dwdt,dzdt)
            do lm=1,lm_max
               if (lm == 1) CYCLE
               l   =lm2l(lm)
               m   =lm2m(lm)
               lmS =lm2lmS(lm)
               lmA =lm2lmA(lm)
               lmP =lm2lmP(lm)
               lmPS=lmP2lmPS(lmP)
               lmPA=lmP2lmPA(lmP)
    
#if 0
               write(*,"(A,I4,A)") "========== lm = ",lm," =========="
               call print_cache_info_integer("l"//C_NULL_CHAR,l)
               call print_cache_info_dcmplx("dPhi0"//C_NULL_CHAR,dPhi0(lm))
               call print_cache_info_dcmplx("dPhi"//C_NULL_CHAR,dPhi(lm))
               call print_cache_info_dreal("dTheta1A"//C_NULL_CHAR,dTheta1A(lm))
               call print_cache_info_dreal("dTheta1S"//C_NULL_CHAR,dTheta1S(lm))
               call print_cache_info_dreal("dTheta2A"//C_NULL_CHAR,dTheta2A(lm))
               call print_cache_info_dreal("dTheta2S"//C_NULL_CHAR,dTheta2S(lm))
               call print_cache_info_dreal("dTheta3A"//C_NULL_CHAR,dTheta3A(lm))
               call print_cache_info_dreal("dTheta3S"//C_NULL_CHAR,dTheta3S(lm))
               call print_cache_info_dreal("dTheta4A"//C_NULL_CHAR,dTheta4A(lm))
               call print_cache_info_dreal("dTheta4S"//C_NULL_CHAR,dTheta4S(lm))
               call print_cache_info_dcmplx("z_Rloc(lmA)"//C_NULL_CHAR,z_Rloc(lmA,nR))
               call print_cache_info_dcmplx("z_Rloc(lmS)"//C_NULL_CHAR,z_Rloc(lmS,nR))
               call print_cache_info_dcmplx("w_Rloc(lmA)"//C_NULL_CHAR,w_Rloc(lmA,nR))
               call print_cache_info_dcmplx("w_Rloc(lmS)"//C_NULL_CHAR,w_Rloc(lmS,nR))
               call print_cache_info_dcmplx("dw_Rloc(lmA)"//C_NULL_CHAR,dw_Rloc(lmA,nR))
               call print_cache_info_dcmplx("dw_Rloc(lmS)"//C_NULL_CHAR,dw_Rloc(lmS,nR))
               call print_cache_info_dcmplx("dw_Rloc"//C_NULL_CHAR,dw_Rloc(lm,nR))
               call print_cache_info_dcmplx("this%AdvrLM(lmP)"//C_NULL_CHAR, &
                                            this%AdvrLM(lmP))
               call print_cache_info_dcmplx("this%AdvtLM(lmP)"//C_NULL_CHAR, &
                                            this%AdvtLM(lmP))
               call print_cache_info_dcmplx("this%AdvpLM(lmPA)"//C_NULL_CHAR, &
                                            this%AdvpLM(lmPA))
               call print_cache_info_dcmplx("this%AdvpLM(lmPS)"//C_NULL_CHAR, &
                                            this%AdvpLM(lmPS))
               write(*,"(A)") ""
#endif
               if ( l_corr ) then
                  if ( l < l_max .and. l > m ) then
                     CorPol_loc =two*CorFac*or1(nR) * ( &
                             dPhi0(lm)*dw_Rloc(lm,nR) +  & ! phi-deriv of dw/dr
                          dTheta2A(lm)*z_Rloc(lmA,nR) -  & ! sin(theta) dtheta z
                          dTheta2S(lm)*z_Rloc(lmS,nR) )
    
                     CorTor_loc=          two*CorFac*or2(nR) * ( &
                                      dPhi0(lm)*z_Rloc(lm,nR)   + &
                                  dTheta3A(lm)*dw_Rloc(lmA,nR)  + &
                          or1(nR)*dTheta4A(lm)* w_Rloc(lmA,nR)  + &
                                  dTheta3S(lm)*dw_Rloc(lmS,nR)  - &
                          or1(nR)*dTheta4S(lm)* w_Rloc(lmS,nR)  )
                  else if ( l == l_max ) then
                     CorPol_loc= two*CorFac*or1(nR) * ( &
                                  dPhi0(lm)*dw_Rloc(lm,nR)  )
                     CorTor_loc=two*CorFac*or2(nR) * ( &
                                  dPhi0(lm)*z_Rloc(lm,nR)   )
                  else if ( l == m ) then
                     CorPol_loc = two*CorFac*or1(nR) * ( &
                              dPhi0(lm)*dw_Rloc(lm,nR)  + &
                           dTheta2A(lm)*z_Rloc(lmA,nR) )
                     CorTor_loc=  two*CorFac*or2(nR) * ( &
                              dPhi0(lm)*z_Rloc(lm,nR)   + &
                          dTheta3A(lm)*dw_Rloc(lmA,nR)  + &
                          or1(nR)*dTheta4A(lm)* w_Rloc(lmA,nR)  )
                  end if
               else
                  CorPol_loc=zero
                  CorTor_loc=zero
               end if
    
               if ( l_conv_nl ) then
                  AdvPol_loc=or2(nR)*this%AdvrLM(lmP)
    
                  if ( l > m ) then
                     AdvTor_loc=   -dPhi(lm)*this%AdvtLM(lmP)  + &
                                dTheta1S(lm)*this%AdvpLM(lmPS) - &
                                dTheta1A(lm)*this%AdvpLM(lmPA)
                  else if ( l == m ) then
                     AdvTor_loc=   -dPhi(lm)*this%AdvtLM(lmP)  - &
                                dTheta1A(lm)*this%AdvpLM(lmPA)
                  end if
               else
                  AdvPol_loc=zero
                  AdvTor_loc=zero
               end if
    
               ! Here false sharing is still possible
               dwdt(lm)=AdvPol_loc+CorPol_loc
               dzdt(lm)=CorTor_loc+AdvTor_loc
               ! until here
    
               if ( lRmsCalc .and. l_mag_LF .and. nR>n_r_LCR ) then
                  !------ When RMS values are required, the Lorentz force is treated
                  !       separately:
                  !--------- FLPol = ( curl(B)xB )_r
                  LFPol(lm) =or2(nR)*this%LFrLM(lmP)
                  AdvPol(lm)=AdvPol_loc-LFPol(lm)
                  CorPol(lm)=CorPol_loc
    
                  !------ When RMS values are required, the Lorentz force is treated
                  !       separately:
                  if ( l > m ) then
                     !------- LFTor= 1/(E*Pm) * curl( curl(B) x B )_r
                     LFTor(lm) =   -dPhi(lm)*this%LFtLM(lmP)  + &
                                dTheta1S(lm)*this%LFpLM(lmPS) - &
                                dTheta1A(lm)*this%LFpLM(lmPA)
                  else if ( l == m ) then
                     LFTor(lm) =   -dPhi(lm)*this%LFtLM(lmP)  - &
                                dTheta1A(lm)*this%LFpLM(lmPA)
                  end if
                  AdvTor(lm)=AdvTor_loc-LFTor(lm)
                  CorTor(lm)=CorTor_loc
               end if
    
            end do
            !$OMP END PARALLEL DO
            !PERFOFF
    
            if ( lRmsCalc ) then
    
               if ( l_conv_nl ) then
                  call hInt2Pol(AdvPol,1,lm_max,nR,2,lm_max,AdvPolLMr, &
                                AdvPol2hInt(nR),AdvPolAs2hInt(nR),st_map)
                  call hInt2Tor(AdvTor,1,lm_max,nR,2,lm_max, &
                                AdvTor2hInt(nR),AdvTorAs2hInt(nR),st_map)
               end if
               ! rho* grad(p/rho) = grad(p) - beta*p
               call hInt2Pol(leg_helper%dpR-beta(nR)*leg_helper%preR,1, &
                             lm_max,nR,2,lm_max,PreLMr, &
                    Pre2hInt(nR),PreAs2hInt(nR),st_map)
               if ( ra /= 0.0_cp ) &
                    call hInt2Pol(leg_helper%sR,1,lm_max,nR,2,lm_max,BuoLMr, &
                                  Buo2hInt(nR),BuoAs2hInt(nR),st_map)
               if ( l_corr ) then
                  call hInt2Pol(CorPol,1,lm_max,nR,2,lm_max,CorPolLMr, &
                                CorPol2hInt(nR),CorPolAs2hInt(nR),st_map)
                  call hInt2Tor(CorTor,1,lm_max,nR,2,lm_max, &
                                CorTor2hInt(nR),CorTorAs2hInt(nR),st_map)
               end if
               if ( l_mag_LF .and. nR>n_r_LCR ) then
                  call hInt2Pol(LFPol,1,lm_max,nR,2,lm_max,LFPolLMr, &
                                LFPol2hInt(nR),LFPolAs2hInt(nR),st_map)
                  call hInt2Tor(LFTor,1,lm_max,nR,2,lm_max, &
                                LFTor2hInt(nR),LFTorAs2hInt(nR),st_map)
               end if
    
               !----- Calculate balances: recycle AdvPol, AdvTor for this:
               do lm=2,lm_max
                  if ( l_RMStest ) then
                     AdvPol(lm)=AdvPol(lm)+CorPol(lm)+LFPol(lm)-           &
                          leg_helper%dpR(lm)+beta(nR)*leg_helper%preR(lm)+ &
                          rho0(nR)*rgrav(nR)*leg_helper%sR(lm)
                     AdvTor(lm)=AdvTor(lm)+CorTor(lm)+LFTor(lm)
                     CorPol(lm)=or2(nR)*leg_helper%dLhw(lm)
                  else
                     AdvPol(lm)=CorPol(lm)-leg_helper%dpR(lm)+ &
                                beta(nR)*leg_helper%preR(lm)
                     AdvTor(lm)=AdvPol(lm)+LFPol(lm)
                     CorPol(lm)=AdvTor(lm)+rho0(nR)*rgrav(nR)*leg_helper%sR(lm)
                  end if
               end do
               call hInt2Pol(AdvPol,1,lm_max,nR,2,lm_max,GeoLMr, &
                             Geo2hInt(nR),GeoAs2hInt(nR),st_map)
               if ( l_RMStest ) then
                  call hInt2Tor(AdvTor,1,lm_max,nR,2,lm_max, &
                                Mag2hInt(nR),MagAs2hInt(nR),st_map)
               else
                  call hInt2Pol(AdvTor,1,lm_max,nR,2,lm_max,MagLMr, &
                                Mag2hInt(nR),MagAs2hInt(nR),st_map)
               end if
               call hInt2Pol(CorPol,1,lm_max,nR,2,lm_max,ArcLMr, &
                             Arc2hInt(nR),ArcAs2hInt(nR),st_map)
    
            end if
    
            !PERFON('td_cv2')
            !$OMP PARALLEL default(none) &
            !$OMP private(lm,l,m,lmS,lmA,lmP,lmPS,lmPA) &
            !$OMP private(AdvPol_loc,CorPol_loc) &
            !$OMP shared(lm2l,lm2m,lm2lmS,lm2lmA,lm2lmP,lmP2lmpS,lmP2lmPA) &
            !$OMP shared(lm_max,l_max,nR,l_corr,l_conv_nl) &
            !$OMP shared(CorFac,or1,or2,dPhi0,dTheta3A,dTheta3S,dTheta1S,dTheta1A) &
            !$OMP shared(z_Rloc,dPhi,leg_helper,dw_Rloc) &
            !$OMP shared(CorPol,AdvPol,dpdt,this)
            !LIKWID_ON('td_cv2')
            !$OMP DO
            do lm=2,lm_max
               l   =lm2l(lm)
               m   =lm2m(lm)
               lmS =lm2lmS(lm)
               lmA =lm2lmA(lm)
               lmP =lm2lmP(lm)
               lmPS=lmP2lmPS(lmP)
               lmPA=lmP2lmPA(lmP)
    
               !------ Recycle CorPol and AdvPol:
               if ( l_corr ) then
                  !PERFON('td_cv2c')
                  if ( l < l_max .and. l > m ) then
                     CorPol_loc=                    two*CorFac*or2(nR) * &
                          &               ( -dPhi0(lm) * ( dw_Rloc(lm,nR) &
                          &                  +or1(nR)*leg_helper%dLhw(lm) &
                          &                                             ) &
                          &                  +dTheta3A(lm)*z_Rloc(lmA,nR) &
                          &                  +dTheta3S(lm)*z_Rloc(lmS,nR) &
                          &               )
    
                  else if ( l == l_max ) then
                     CorPol_loc=  two*CorFac*or2(nR) * ( -dPhi0(lm) *  &
                                 ( dw_Rloc(lm,nR) + or1(nR)*leg_helper%dLhw(lm) ) )
    
                  else if ( l == m ) then
                     CorPol_loc=                    two*CorFac*or2(nR) * &
                          &               ( -dPhi0(lm) * ( dw_Rloc(lm,nR) &
                          &                  +or1(nR)*leg_helper%dLhw(lm) &
                          &                                              )&
                          &                 +dTheta3A(lm)*z_Rloc(lmA,nR)  &
                          &               )
    
                  end if
                  !PERFOFF
               else
                  CorPol_loc=zero
               end if
               if ( l_conv_nl ) then
                  !PERFON('td_cv2nl')
                  if ( l > m ) then
                     AdvPol_loc= dTheta1S(lm)*this%AdvtLM(lmPS) - &
                                 dTheta1A(lm)*this%AdvtLM(lmPA) + &
                                     dPhi(lm)*this%AdvpLM(lmP)
                  else if ( l == m ) then
                     AdvPol_loc=-dTheta1A(lm)*this%AdvtLM(lmPA) + &
                                     dPhi(lm)*this%AdvpLM(lmP)
                  end if
                  !PERFOFF
               else
                  AdvPol_loc=zero
               end if
               dpdt(lm)=AdvPol_loc+CorPol_loc
    
            end do ! lm loop
            !$OMP end do 
            !LIKWID_OFF('td_cv2')
            !$OMP END PARALLEL 
            !PERFOFF
         else
            do lm=2,lm_max
               dwdt(lm) =0.0_cp
               dzdt(lm) =0.0_cp
               dpdt(lm) =0.0_cp
            end do
         end if ! l_conv ?
    
         if ( l_heat ) then
            dsdt_loc  =epsc*epscProf(nR)!+opr/epsS*divKtemp0(nR)
            dVSrLM(1)=this%VSrLM(1)
            if ( l_anel ) then
               if ( l_anelastic_liquid ) then
                  if ( l_mag_nl ) then
                     dsdt_loc=dsdt_loc+                                        &
                     &    ViscHeatFac*hdif_V(1)*temp0(nR)*this%ViscHeatLM(1)+  &
                     &     OhmLossFac*hdif_B(1)*temp0(nR)*this%OhmLossLM(1)
                  else
                     dsdt_loc=dsdt_loc+ &
                     &    ViscHeatFac*hdif_V(1)*temp0(nR)*this%ViscHeatLM(1)
                  end if
               else
                  if ( l_mag_nl ) then
                     dsdt_loc=dsdt_loc+ViscHeatFac*hdif_V(1)*this%ViscHeatLM(1)+ &
                                        OhmLossFac*hdif_B(1)*this%OhmLossLM(1)
                  else
                     dsdt_loc=dsdt_loc+ViscHeatFac*hdif_V(1)*this%ViscHeatLM(1)
                  end if
               end if
            end if
            dsdt(1)=dsdt_loc
    
            !PERFON('td_heat')
            !$OMP PARALLEL DEFAULT(none) &
            !$OMP private(lm,l,m,lmP,lmPS,lmPA,dsdt_loc) &
            !$OMP shared(lm2l,lm2m,lm2lmP,lmP2lmPS,lmP2lmPA) &
            !$OMP shared(lm_max,dsdt,dVSrLM,dTheta1S,dTheta1A,dPhi) &
            !$OMP shared(l_anel,l_anelastic_liquid,l_mag_nl,nR) &
            !$OMP shared(ViscHeatFac,hdif_V,OhmLossFac,hdif_B,temp0,this)
            !LIKWID_ON('td_heat')
            !$OMP DO
            do lm=2,lm_max
               l   =lm2l(lm)
               m   =lm2m(lm)
               lmP =lm2lmP(lm)
               lmPS=lmP2lmPS(lmP)
               lmPA=lmP2lmPA(lmP)
               !------ This is horizontal heat advection:
               !PERFON('td_h1')
    
               if ( l > m ) then
                  dsdt_loc= -dTheta1S(lm)*this%VStLM(lmPS) &
                       &    +dTheta1A(lm)*this%VStLM(lmPA) &
                       &    -dPhi(lm)*this%VSpLM(lmP)
               else if ( l == m ) then
                  dsdt_loc=  dTheta1A(lm)*this%VStLM(lmPA) &
                       &     -dPhi(lm)*this%VSpLM(lmP)
               end if
               !PERFOFF
               !PERFON('td_h2')
               if ( l_anel ) then
                  if ( l_anelastic_liquid ) then
                     dsdt_loc = dsdt_loc+ &
                          &     ViscHeatFac*hdif_V(lm)*temp0(nR)*this%ViscHeatLM(lmP)
                     if ( l_mag_nl ) then
                        dsdt_loc = dsdt_loc+ &
                             &     OhmLossFac*hdif_B(lm)*temp0(nR)*this%OhmLossLM(lmP)
                     end if
                  else
                     dsdt_loc = dsdt_loc+ &
                          &     ViscHeatFac*hdif_V(lm)*this%ViscHeatLM(lmP)
                     if ( l_mag_nl ) then
                        dsdt_loc = dsdt_loc+ &
                             &     OhmLossFac*hdif_B(lm)*this%OhmLossLM(lmP)
                     end if
                  end if
               end if
               !PERFOFF
               !-----   simplified form for linear onset !
               !        not ds not saved in the current program form!
               !                 dsdt(lm)=
               !                    -dLh(lm)*w(lm,nR)*or2(nR)*dsR(1)
               dVSrLM(lm)=this%VSrLM(lmP)
               dsdt(lm) = dsdt_loc
            end do
            !$OMP end do
            !LIKWID_OFF('td_heat')
            !$OMP END PARALLEL
            !PERFOFF
         else
            do lm=2,lm_max
               dsdt(lm)  =0.0_cp
               dVSrLM(lm)=0.0_cp
            end do
         end if
    
         if ( l_mag_nl .or. l_mag_kin  ) then
            !PERFON('td_magnl')
    
            !$OMP PARALLEL do default(none) &
            !$OMP private(lm,l,m,lmP,lmPS,lmPA) &
            !$OMP shared(lm_max,lm2l,lm2m,lm2lmP,lmP2lmPS,lmP2lmPA) &
            !$OMP shared(dbdt,djdt,dTheta1S,dTheta1A,dPhi) &
            !$OMP shared(dLh,or4,dVxBhLM,r,nR,this)
            do lm=1,lm_max
               if (lm == 1) then
                  lmP=1
                  lmPA=lmP2lmPA(lmP)
                  dVxBhLM(lm)= -r(nR)*r(nR)* dTheta1A(lm)*this%VxBtLM(lmPA)
                  dbdt(lm)   = -dTheta1A(lm)*this%VxBpLM(lmPA)
                  djdt(lm)   = zero
                  CYCLE
               end if
               l   =lm2l(lm)
               m   =lm2m(lm)
               lmP =lm2lmP(lm)
               lmPS=lmP2lmPS(lmP)
               lmPA=lmP2lmPA(lmP)
    
               !------- This is the radial part of the dynamo terms \curl(VxB)
               !PERFON('td_mnl1')
               if ( l > m ) then
                  dbdt(lm)=  dTheta1S(lm)*this%VxBpLM(lmPS) &
                       &    -dTheta1A(lm)*this%VxBpLM(lmPA) &
                       &    -dPhi(lm)    *this%VxBtLM(lmP)
               else if ( l == m ) then
                  dbdt(lm)= -dTheta1A(lm)*this%VxBpLM(lmPA) &
                       &    -dPhi(lm)    *this%VxBtLM(lmP)
               end if
               !PERFOFF
    
               !------- Radial component of
               !           \curl\curl(UxB) = \grad\div(UxB) - \laplace(VxB)
    
               !------- This is the radial part of \laplace (UxB)
               djdt(lm)=dLh(lm)*or4(nR)*this%VxBrLM(lmP)
    
               !------- This is r^2 * horizontal divergence of (UxB)
               !        Radial derivative performed in get_dr_td
               !PERFON('td_mnl2')
               if ( l > m ) then
                  dVxBhLM(lm)=            r(nR)*r(nR)* ( &
                       dTheta1S(lm)*this%VxBtLM(lmPS) -  &
                       dTheta1A(lm)*this%VxBtLM(lmPA) +  &
                       dPhi(lm)*this%VxBpLM(lmP)  )
               else if ( l == m ) then
                  dVxBhLM(lm)=              r(nR)*r(nR)* ( &
                       - dTheta1A(lm)*this%VxBtLM(lmPA) +  &
                       dPhi(lm)*this%VxBpLM(lmP)  )
               end if
               !PERFOFF
            end do
            !$OMP END PARALLEL DO
            !PERFOFF
         else
            if ( l_mag ) then
               do lm=1,lm_max
                  dbdt(lm)   =zero
                  djdt(lm)   =zero
                  dVxBhLM(lm)=zero
               end do
            end if
         end if
    
      end if  ! boundary ? lvelo ?

   end subroutine get_td
!-----------------------------------------------------------------------------
end module nonlinear_lm_mod