program main
   use FinDiff
   use stdlib_io_npy, only: save_npy
   implicit none
   real(qp), parameter :: pi = 4.0_qp*atan(1.0_qp)
   integer(ilp) :: i, npts
   real(qp), allocatable :: weights(:), kappa(:)
   integer(ilp), allocatable :: stencil(:)

   !----------------------------------------------
   !-----     CENTRAL FINITE DIFFERENCES     -----
   !----------------------------------------------

   !> Standard second-order laplacian.
   npts = 3
   weights = central_findiff(order=2, nth=2)
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   kappa = effective_wavenumber(stencil, weights, nth=2)
   call save_npy("central_findiff_3pts_2order.npy", real(kappa, kind=dp))

   !> Standard second-order laplacian.
   npts = 5
   weights = central_findiff(order=4, nth=2)
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   kappa = effective_wavenumber(stencil, weights, nth=2)
   call save_npy("central_findiff_5pts_4order.npy", real(kappa, kind=dp))

   !> Standard 6-th order laplacian.
   npts = 7
   weights = central_findiff(order=6, nth=2)
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   kappa = effective_wavenumber(stencil, weights, nth=2)
   call save_npy("central_findiff_7pts_6order.npy", real(kappa, kind=dp))

   !> Optimal DRP scheme 7pts 4-th order.
   npts = 7
   stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
   weights = central_drp_findiff(order=4, npts=npts, nth=2, alpha_max=pi/2)
   kappa = effective_wavenumber(stencil, weights, nth=2)
   call save_npy("optimal_drp_findiff_7pts_4order.npy", real(kappa, kind=dp))

end program main
