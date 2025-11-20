submodule(FinDiff) drp_schemes
   use stdlib_optval, only: optval
   implicit none(type, external)
contains
   module procedure central_drp_findiff
   integer(ilp) :: nth_
   real(qp) :: kmin_, kmax_
   !> Optional arguments.
   nth_ = optval(nth, 1)
   kmin_ = optval(kmin, pi/16)
   kmax_ = optval(kmax, pi/2)
   end procedure central_drp_findiff

   pure subroutine construct_quadprog(stencil, order, nth, kmin, kmax, P, q, A, b)
      implicit none(type, external)
      integer(ilp), intent(in) :: stencil(:)
      integer(ilp), intent(in) :: order
      integer(ilp), intent(in) :: nth
      real(qp), intent(in) :: kmin, kmax
      real(qp), allocatable, intent(out) :: P(:, :), q(:)
      real(qp), allocatable, intent(out) :: A(:, :), b(:)
      !> Internal variables.
      integer(ilp) :: i, j, k, npts

      npts = size(stencil)  ! Number of points in the stencil.

      !> Assertions.
      call assert(assertion=nth == 1, &
                  description="Only first order derivatives are supported for now.")
      call assert(assertion=order > 0, &
                  description="The order of the approximation needs to be strictly positive.")
      call assert(assertion=all(stencil == -stencil(npts:1:-1)), &
                  description="Only central schemes are supported for now.")
      call assert(assertion=npts > order + 1, &
                  description="The number of points in the stencil needs to be larger than order + 1.")
      call assert(assertion=kmin < kmax, &
                  description="The wavenumber lower-bound needs to be smaller than the upper-bound.")
      call assert(assertion=kmin > 0, &
                  description="The wavenumber lower-bound needs to be strictly positive.")
   end subroutine construct_quadprog
end submodule drp_schemes
