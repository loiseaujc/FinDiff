submodule(FinDiff) analysis
   use stdlib_math, only: linspace
   use stdlib_linalg, only: outer_product, diag
   implicit none(type, external)
contains

   module procedure effective_wavenumber
   integer(ilp), parameter :: npts = 1024
   real(qp), allocatable :: kappa_true(:)
   integer(ilp) :: i
   !> True wavenumbers.
   kappa_true = linspace(0.0_qp, pi, npts)
   !> Effective wavenumbers.

   kappa = -real(matmul(exp(im*outer_product(kappa_true, real(stencil, kind=qp))), weights))
   end procedure effective_wavenumber
end submodule analysis
