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
   kappa = imag(sum(matmul(diag(weights), &
                           exp(im*outer_product(real(stencil, kind=qp), kappa_true))), dim=1))
   end procedure effective_wavenumber
end submodule analysis
