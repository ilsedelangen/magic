module calc_ave
    ! 
    ! This module calculates the time-averaged field quantities such as the Lorentz force.
    !
    use precision_mod
    use constants, only: zero

    implicit none

    private

    type, public :: ave         
        real(cp), allocatable :: f_ave(:,:,:)    ! 3dim array to store average field in
        real(cp), allocatable :: time_last(:)     ! Last time at which the routine is called 
        real(cp), allocatable :: time_ave(:)      ! Time that has passed since last averaging 
        integer, allocatable :: nTimes(:)     ! Counter for how many times the subroutine is called
        integer :: nt, np
    contains
        procedure :: init
        procedure :: add_r
        procedure :: finalize
    end type ave

contains 
  
    subroutine init(this,nr_start,nr_stop,nt_I,np_I)
        ! 
        ! Initialize the array containing the averaged field
        ! 
        class(ave) :: this
        integer :: nr_start, nr_stop, nt_I, np_I               ! Define grid that is expected
        allocate(this%f_ave(nr_start:nr_stop,nt_I,np_I))
        allocate(this%nTimes(nr_start:nr_stop))
        allocate(this%time_last(nr_start:nr_stop))
        allocate(this%time_ave(nr_start:nr_stop))
        this%nTimes = zero
        this%nt = nt_I
        this%np = np_I
        this%nTimes=0         ! Set counter to zero
        
    end subroutine init

    subroutine add_r(this,f_in,time_in,nR)
        !
        ! For a given radial level, add the updated field and compute new average
        !
        class(ave) :: this 
        real(cp), intent(in) :: f_in(:,:)    ! field to be added
        real(cp), intent(in) :: time_in      ! time corresponding to field to be added 
        integer, intent(in) :: nR        ! Radial grid level 

        real(cp) :: dt                       ! time since last call
        integer :: nshape(2)
        integer :: nsize

        ! Check if input field has correct dimension
        nshape = shape(f_in)
        nsize = size(nshape)
        if ( nsize /= 2 ) then
           stop "Wrong input size"
        else
           if ( nshape(1) /= this%nt .or. nshape(2) /= this%np ) then
               stop "Wrong input dimension" 
           end if
        end if        

        this%nTimes(nR)=this%nTimes(nR)+1 
           
        if ( this%nTimes(nR)==1 ) then                 
            this%f_ave(nR,:,:) = f_in                 ! First call: average field == input field 
        else
            dt = time_in-this%time_last(nR)       ! Calculate dt for all other calls   

            if ( this%nTimes(nR)==2 ) then
                this%f_ave(nR,:,:)=dt*(this%f_ave(nR,:,:)+f_in)    ! Second call: we sum and divide by 2. 
                this%time_ave(nR)=2*dt
            else
                this%f_ave(nR,:,:) = this%f_ave(nR,:,:)*this%time_ave(nR) + dt*f_in    ! We do the averaged field times the passed time over averaging? and the input field times the new dt
                this%time_ave(nR)=this%time_ave(nR)+dt                     ! Calculate new time over averaging 
            end if

            this%f_ave(nR,:,:) = this%f_ave(nR,:,:)/this%time_ave(nR)         ! To get average we divide by total time
        end if

        this%time_last(nR)=time_in   


    end subroutine add_r

    subroutine finalize(this)
        ! 
        ! Initialize the array containing the averaged field
        ! 
        class(ave) :: this

        deallocate(this%f_ave)
        deallocate(this%nTimes)
        deallocate(this%time_last)
        deallocate(this%time_ave)

    end subroutine finalize


end module calc_ave  









