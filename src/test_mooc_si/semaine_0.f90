!> Concepts de le semaine 0 du MOOC

module semaine_0
    use mvs_descri
    implicit none
    private

    public :: cours_0!, exo, quiz

    integer, parameter :: dp = selected_real_kind(15)

contains

    subroutine cours_0
        
        !integer :: univers_size = 13
        real(dp), target :: univers(13)
        real(dp), pointer :: ptr_univers(:)
        integer :: univers_size = 13
        real(dp) ::  mean
        ! the default value is the value
        ! to tell there is a missing value
        ! in this location, it will not be 
        ! taken into account in the mean
        real(dp) :: default_value = -1.0_dp


        univers = [real(dp) :: -1.0, 1.0, 2.0, 3.0, -1.0, 7.0, 11.0, 12.0, 13.0, -1.0, 15.0, 16.0, 17.0]
        ptr_univers => univers 
        
        ! the default value is the value
        ! to tell there is a missing value
        ! in this location, it will not be 
        ! taken into account in the mean
        !real(dp) :: default_value = -1.0_dp

        mean = mvs_mean(ptr_univers, univers_size, default_value)

        print *, "The univers is: ", univers
        print *, "The main of the univers is: ", mean

    end subroutine cours_0



    !subroutine exo_0

    !end subroutine exo_0


    !subroutine quiz_0

    !end subroutine quiz_0
 
end module semaine_0
