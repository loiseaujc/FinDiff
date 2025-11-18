program main
   use FinDiff
   implicit none
   integer(ilp), parameter :: n = 8
   integer(ilp) :: order
   real(wp), allocatable :: stencil(:)

   do order = 2, n, 2
      stencil = central_findiff(order)
      print *, "Central finite difference scheme for the first derivative"
      print *, "     - Order  :", order
      print *, "     - Stencil:", stencil
      print *, ""
   end do
end program main
