module linalg
   use stdlib_optval, only: optval
   use kinds
   implicit none(type, external)
   private

   public :: vandermonde

   interface
      module function vandermonde(x, order) result(A)
         real(wp), intent(in) :: x(:)
         integer(ilp), intent(in), optional :: order
         real(wp), allocatable :: A(:, :)
      end function vandermonde
   end interface
contains
   module procedure vandermonde
   integer(ilp) :: i, j, n, order_
   !> System's dimensions.
   n = size(x); order_ = optval(order, n)
   !> Allocate matrix.
   allocate (A(n, order_), source=0.0_wp)
   do concurrent(i=1:n, j=1:order_)
      A(i, j) = x(i)**(j - 1)
   end do
   end procedure
end module linalg
