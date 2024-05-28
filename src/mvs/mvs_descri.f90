! stastistique descriptive 

! Missing Values Statistics

module mvs_descri
    implicit none
    private

    public :: mvs_mean
    public :: mvs_variance

    integer, parameter :: dp = selected_real_kind(15)
contains

    !real(dp) function mvs_mean(ptr_univers, univers_size, default_value) result(mean)
    real(dp) function mvs_mean(ptr_univers, univers_size, default_value) result(mean)
        ! calculate the maen without the default value
    
        ! inputs
        real(dp), pointer, dimension(:), intent(in) :: ptr_univers
        integer, intent(in) :: univers_size
        real(dp), intent(in) :: default_value
        ! output
        !real(dp) :: mean
        ! iterator
        integer :: n_element
        ! to count number of time a defaulf value is not encounter
        real(dp) :: divisor


        mean = 0.0_dp
        divisor = real(univers_size, dp)

        do n_element = 1, univers_size
            !if (ptr_univers(n_element) == default_value) then
                ! if the element n is not a default value
            !    divisor = divisor - 1_dp
            !else
            !    mean = mean + ptr_univers(n_element)
            !end if
            
            if (abs(ptr_univers(n_element) - default_value) > epsilon(default_value)) then                ! if the element n is not a default value
                mean = mean + ptr_univers(n_element)
            else
                divisor = divisor - 1_dp
            end if
        end do

        mean = mean / divisor

    end function mvs_mean

!--------------------------------------------------------

    real(dp) function mvs_variance(ptr_univers, univers_size, default_value) result(variance)
    
        ! inputs
        real(dp), pointer, dimension(:), intent(in) :: ptr_univers
        integer, intent(in) :: univers_size
        real(dp), intent(in) :: default_value
        ! output
        !real(dp) :: variance
        ! iterator
        integer :: n_element
        ! to count number of time a defaulf value is not encounter
        real(dp) :: divisor
        real(dp) :: mean
        
        
        variance = 0.0_dp
        divisor = real(univers_size, dp)

        !real(dp) :: mean = calculate_mean(ptr_univers, univers_size, default_value)
        mean = mvs_mean(ptr_univers, univers_size, default_value)

        do n_element = 1, univers_size
            !if (ptr_univers(n_element) == default_value) then
                ! if the element n is not a default value
            !    divisor = divisor - 1_dp
            !else
            !    variance = variance + (ptr_univers(n_element) - mean)**2
            !end if
            
            if (abs(ptr_univers(n_element) - default_value) > epsilon(default_value)) then   ! if the element n is not a default value
                variance = variance + (ptr_univers(n_element) - mean)**2
            else
                divisor = divisor - 1_dp
            end if
        end do

        ! We have the global gap between the mean and the n_elements
        ! but we want the average:
        variance = variance / divisor

    end function mvs_variance


    !real function calculate_q3(
end module mvs_descri 
