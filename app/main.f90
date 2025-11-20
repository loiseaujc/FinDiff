program main
   use FinDiff
   use stdlib_io_npy, only: save_npy
   implicit none
   integer(ilp), parameter :: nth = 1
   integer(ilp), parameter :: order = 2
   real(qp), parameter :: pi = 4.0_qp*atan(1.0_qp)
   integer(ilp) :: i, npts
   real(qp), allocatable :: weights(:), kappa(:)
   integer(ilp), allocatable :: stencil(:)

   !----------------------------------------------
   !-----     CENTRAL FINITE DIFFERENCES     -----
   !----------------------------------------------

   !> Standard 2nd-order accurate finite difference scheme.
   npts = 5
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   weights = central_findiff(order=npts - 1, nth=1)
   kappa = effective_wavenumber(stencil, weights)
   call save_npy("central_findiff_5pts_4order.npy", real(kappa, kind=dp))

   !> Standard 6nd-order accurate finite difference scheme.
   npts = 7
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   weights = central_findiff(order=npts - 1, nth=1)
   kappa = effective_wavenumber(stencil, weights)
   call save_npy("central_findiff_7pts_6order.npy", real(kappa, kind=dp))

   !> Tam & Webb (1993)
   npts = 7
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   weights = [-0.02651995_qp, 0.18941314_qp, -0.79926643_qp, 0.0_qp, 0.79926643_qp, -0.18941314_qp, 0.02651995_qp]
   kappa = effective_wavenumber(stencil, weights)
   call save_npy("tam_webb_7pts_4order.npy", real(kappa, kind=dp))

   print *, "Tam & Webb (1993)"
   print *, "-----------------"
   print *, real(weights, kind=dp)

   !> Optimal Tam & Webb.
   npts = 7
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   weights = central_drp_findiff(order=4, npts=npts, nth=1, alpha_max=pi/2)
   kappa = effective_wavenumber(stencil, weights)
   call save_npy("optimal_drp_7pts_4order.npy", real(kappa, kind=dp))

   print *, "Optimal DRP scheme 7pts/4th order"
   print *, "------------------"
   print *, real(weights, kind=dp)

end program main
