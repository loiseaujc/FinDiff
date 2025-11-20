module FinDiff_utils
   use stdlib_optval, only: optval
   use stdlib_linalg, only: hermitian, solve
   use FinDiff_kinds, only: ilp, qp
   use assert_m, only: assert => assert_always
   implicit none(type, external)
   private

   public :: vandermonde
   public :: factorial
   public :: constrained_quadprog

   interface
      integer(ilp) pure module function factorial(n) result(out)
         implicit none(type, external)
         integer(ilp), intent(in) :: n
      end function factorial

      module function vandermonde(x, order) result(A)
         implicit none(type, external)
         real(qp), intent(in) :: x(:)
         integer(ilp), intent(in), optional :: order
         real(qp), allocatable :: A(:, :)
      end function vandermonde

      module function constrained_quadprog(P, q, A, b) result(x)
         implicit none(type, external)
         complex(qp), intent(in) :: P(:, :), q(:)
         complex(qp), intent(in) :: A(:, :), b(:)
         complex(qp), allocatable :: x(:)
      end function constrained_quadprog
   end interface

contains

   module procedure vandermonde
   integer(ilp) :: i, j, n, order_
   !> System's dimensions.
   n = size(x); order_ = optval(order, n)
   call assert(assertion=n >= 0, &
               description="The power needs to be non-negative.")
   !> Allocate matrix.
   allocate (A(n, order_), source=0.0_qp)
   do concurrent(i=1:n, j=1:order_)
      A(i, j) = x(i)**(j - 1)
   end do
   end procedure vandermonde

   module procedure factorial
   integer(ilp) :: i
   out = 1
   if ((n == 0) .or. (n == 1)) then
      return
   else
      do i = 2, n
         out = i*out
      end do
   end if
   end procedure factorial

   module procedure constrained_quadprog
   integer(ilp) :: m, n
   complex(qp), allocatable :: K(:, :), f(:)
   !> Assertions.
   call assert(assertion=size(P, 1) == size(P, 2), &
               description="Matrix P needs to be square.")
   call assert(assertion=size(P, 1) == size(q), &
               description="Matrix P and vector q have incompatible dimensions.")
   call assert(assertion=size(A, 1) == size(b), &
               description="Matrix A and vector b have incompatible dimensions.")
   call assert(assertion=size(P, 2) == size(A, 2), &
               description="Matrices P and A have a different number of columns.")
   call assert(assertion=size(A, 1) <= size(P, 1), &
               description="Matrix A defines more constraints than the number of free variables.")
   !> Problem size.
   m = size(P, 1); n = size(A, 1)
   !> Allocate matrices for the KKT optimality conditions.
   allocate (K(m + n, m + n), source=cmplx(0.0_qp, 0.0_qp, kind=qp))
   allocate (f(m + n), source=cmplx(0.0_qp, 0.0_qp, kind=qp))
   !> Create the KKT system.
   K(:m, :m) = P; K(:m, m + 1:) = hermitian(A); f(:m) = q
   K(m + 1:, :n) = A; f(m + 1:) = b
   !> Solve linear system.
   x = solve(K, f)
   !> Discard the last n entries corresponding to the Lagrange multipliers.
   x = x(:m)
   end procedure constrained_quadprog
end module FinDiff_utils
