program main
   use FinDiff
   implicit none
   integer(ilp), parameter :: nth = 1
   integer(ilp) :: order
   real(qp), allocatable :: weights(:)

   !-----------------------------------------------------
   !-----     Central Finite Difference Schemes     -----
   !-----------------------------------------------------

   do order = 2, 8, 2
      weights = central_findiff(order, nth=2)
      print *, "Central finite difference scheme for the first derivative"
      print *, "     - Order  :", order
      print *, "     - Stencil:", weights
      print *, ""
   end do

   !------------------------------------------------------
   !-----     Backward Finite Difference Schemes     -----
   !------------------------------------------------------

   do order = 1, 4
      weights = backward_findiff(order, nth=nth)
      print *, "Backward finite difference scheme for the first derivative"
      print *, "    - Order  :", order
      print *, "    - Stencil:", weights
      print *, ""
   end do

   !-----------------------------------------------------
   !-----     Forward Finite Difference Schemes     -----
   !-----------------------------------------------------

   do order = 1, 4
      weights = forward_findiff(order, nth=nth)
      print *, "Forward finite difference scheme for the first derivative"
      print *, "    - Order  :", order
      print *, "    - Stencil:", weights
      print *, ""
   end do

end program main
