program main
   use FinDiff
   use stdlib_io_npy, only: save_npy
   implicit none
   integer(ilp), parameter :: nth = 1
   integer(ilp), parameter :: order = 2
   integer(ilp), parameter :: npts = order + 1
   integer(ilp) :: i
   real(qp), allocatable :: weights(:), kappa(:)
   integer(ilp), allocatable :: stencil(:)

   !> Central Finite Difference Scheme.
   weights = central_findiff(order=order, nth=nth)
   stencil = [(i, i=(-npts + 1)/2, (npts - 1)/2)]
   kappa = effective_wavenumber(stencil, weights)
   call save_npy("wavenumber.npy", real(kappa, kind=dp))

end program main
