module FinDiff_utils
   use stdlib_optval, only: optval
   use FinDiff_kinds, only: ilp, qp
   use assert_m, only: assert => assert_always
   implicit none(type, external)
   private

   public :: vandermonde
   public :: factorial

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
end module FinDiff_utils
