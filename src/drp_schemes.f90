submodule(FinDiff) drp_schemes
   use stdlib_optval, only: optval
   use stdlib_linalg, only: solve
   use stdlib_io_npy, only: save_npy
   use FinDiff_utils, only: vandermonde, factorial, constrained_quadprog
   implicit none(type, external)
contains
   module procedure central_drp_findiff
   integer(ilp) :: i, nth_, stencil(npts)
   real(qp) :: alpha_max_
   complex(qp), allocatable :: P(:, :), q(:)
   complex(qp), allocatable :: A(:, :), b(:)
   !> Optional arguments.
   nth_ = optval(nth, 1)
   alpha_max_ = optval(alpha_max, pi/2)
   !> Stencil.
   stencil = [(i, i=(-npts + 1)/2, (npts - 1)/2)]
   !> Quadratic program.
   call construct_quadprog(stencil, order, nth_, alpha_max_, P, q, A, b)
   weights = real(constrained_quadprog(P, q, A, b), kind=qp)
   end procedure central_drp_findiff

   subroutine construct_quadprog(stencil, order, nth, alpha_max, P, q, A, b)
      implicit none(type, external)
      integer(ilp), intent(in) :: stencil(:)
      integer(ilp), intent(in) :: order
      integer(ilp), intent(in) :: nth
      real(qp), intent(in) :: alpha_max
      complex(qp), allocatable, intent(out) :: P(:, :), q(:)
      complex(qp), allocatable, intent(out) :: A(:, :), b(:)
      !> Internal variables.
      integer(ilp) :: i, j, k, npts

      npts = size(stencil)  ! Number of points in the stencil.

      !> Assertions.
      call assert(assertion=nth <= 2, &
                  description="Only first and second order derivatives are supported for now.")
      call assert(assertion=order > 0, &
                  description="The order of the approximation needs to be strictly positive.")
      call assert(assertion=all(stencil == -stencil(npts:1:-1)), &
                  description="Only central schemes are supported for now.")
      call assert(assertion=npts >= order + 1, &
                  description="The number of points in the stencil needs to be larger than order + 1.")
      call assert(assertion=alpha_max >= 0, &
                  description="The wavenumber upper-bound needs to be positive.")

      !> Construct Quadratic form.
      P = construct_P(stencil, alpha_max)
      q = construct_q(stencil, nth, alpha_max)
      !> Constraints.
      A = cmplx(transpose(vandermonde(real(stencil, kind=qp), n=order + 1)), 0.0_qp, kind=qp)
      allocate (b(size(A, 1)), source=cmplx(0.0_qp, 0.0_qp, kind=qp))
      b(nth + 1) = factorial(nth)
      print *, size(A, 1), size(A, 2)
   end subroutine construct_quadprog

   function construct_P(stencil, alpha_max) result(P)
      integer(ilp), intent(in) :: stencil(:)
      real(qp), intent(in) :: alpha_max
      complex(qp), allocatable :: P(:, :)
      integer(ilp) :: i, j, npts, k
      !> Allocate array.
      npts = size(stencil)
      allocate (P(npts, npts), source=cmplx(0.0_qp, 0.0_qp, kind=qp))
      !> Hermitian Circulant matrix.
      do j = 1, npts
         do i = 1, npts
            k = stencil(i) + stencil(npts - j + 1)
            if (k == 0) then
               P(i, j) = 4*alpha_max
            else
               P(i, j) = 4*sin(alpha_max*k)/k
            end if
         end do
      end do
   end function construct_P

   function construct_q(stencil, nth, alpha_max) result(q)
      integer(ilp), intent(in) :: stencil(:)
      integer(ilp), intent(in) :: nth
      real(qp), intent(in) :: alpha_max
      complex(qp), allocatable :: q(:)
      integer(ilp) :: i, k, npts
      !> Allocate array.
      npts = size(stencil)
      allocate (q(npts), source=cmplx(0.0_qp, 0.0_qp, kind=qp))

      select case (nth)
      case (1)
         do concurrent(i=1:npts)
            k = stencil(i)
            if (k == 0) then
               q(i) = 0.0_qp
            else
               q(i) = 4*(sin(alpha_max*k) - alpha_max*k*cos(alpha_max*k))/k**2
            end if
         end do
      case (2)
         do concurrent(i=1:npts)
            k = stencil(i)
            if (k == 0) then
               q(i) = -4.0_qp*alpha_max**3/3.0_qp
            else
               q(i) = -4.0_qp*((alpha_max**2*k**2 - 2)*sin(alpha_max*k) + 2*alpha_max*k*cos(alpha_max*k))/k**3
            end if
         end do
      end select
   end function construct_q
end submodule drp_schemes
