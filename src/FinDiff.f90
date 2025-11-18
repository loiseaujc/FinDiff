module FinDiff
   use kinds
   use linalg, only: vandermonde
   use stdlib_linalg, only: solve
   implicit none
   private

   public :: ilp, wp
   public :: central_findiff

   interface
      module function central_findiff(order) result(stencil)
         integer(ilp), intent(in) :: order
         real(wp), allocatable :: stencil(:)
      end function central_findiff
   end interface

contains

   module procedure central_findiff
   integer(ilp) :: i, n
   real(wp), allocatable :: A(:, :), b(:)
   !> Number of points in the stencil.
   n = order + 1
   !> Linear system.
   A = transpose(vandermonde([(real(i, kind=wp), i=(-n + 1)/2, (n - 1)/2)]))
   allocate (b(size(A, 1)), source=0.0_wp); b(2) = 1.0_wp
   !> Solve linear system.
   stencil = solve(A, b)
   end procedure central_findiff

end module FinDiff
