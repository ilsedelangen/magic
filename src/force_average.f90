module force_average
    !
    ! This module initializes the averaging of the Lorentz force.
    !

    use calc_ave
    use radial_data, only: nRstart, nRstop
    use truncation, only: n_phi_max, nlat_padded

    implicit none

    type(ave), public :: LFr_ave, LFt_ave, LFp_ave

    public initialize_force_average, finalize_force_average

contains

    subroutine initialize_force_average

        call LFr_ave%init(nRstart,nRstop,nlat_padded,n_phi_max)
        call LFt_ave%init(nRstart,nRstop,nlat_padded,n_phi_max)
        call LFp_ave%init(nRstart,nRstop,nlat_padded,n_phi_max)

    end subroutine initialize_force_average

    subroutine finalize_force_average

        call LFr_ave%finalize
        call LFt_ave%finalize
        call LFp_ave%finalize

    end subroutine finalize_force_average


end module force_average









