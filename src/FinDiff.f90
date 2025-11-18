module FinDiff
   use kinds
   use linalg, only: vandermonde
   use stdlib_linalg, only: solve
   implicit none
   private

   public :: ilp, wp
   public :: taylor_optimized_findiff
   public :: central_findiff
   public :: backward_findiff
   public :: forward_findiff

   interface
      module function central_findiff(order) result(weights)
         integer(ilp), intent(in) :: order
         real(wp), allocatable :: weights(:)
      end function central_findiff

      module function backward_findiff(order) result(weights)
         integer(ilp), intent(in) :: order
         real(wp), allocatable :: weights(:)
      end function backward_findiff

      module function forward_findiff(order) result(weights)
         integer(ilp), intent(in) :: order
         real(wp), allocatable :: weights(:)
      end function forward_findiff

      module function taylor_optimized_findiff(stencil) result(weights)
         integer(ilp), intent(in) :: stencil(:)
         real(wp), allocatable :: weights(:)
      end function taylor_optimized_findiff
   end interface

contains

   module procedure taylor_optimized_findiff
   real(wp), allocatable :: A(:, :), b(:)
   !> Linear system.
   A = transpose(vandermonde(real(stencil, kind=wp)))
   allocate (b(size(A, 1)), source=0.0_wp); b(2) = 1.0_wp
   !> Finite-difference weights.
   weights = solve(A, b)
   end procedure taylor_optimized_findiff

   module procedure central_findiff
   integer(ilp) :: i, n
   !> Number of points in the stencil.
   n = order + 1
   !> Finite-difference weights
   weights = taylor_optimized_findiff([(i, i=(-n + 1)/2, (n - 1)/2)])
   end procedure central_findiff

   module procedure backward_findiff
   integer(ilp) :: i, n
   !> Number of points in the stencil.
   n = order + 1
   !> Finite-difference weights.
   weights = taylor_optimized_findiff([(i, i=-n + 1, 0)])
   end procedure backward_findiff

   module procedure forward_findiff
   integer(ilp) :: i, n
   !> Number of points in the stencil.
   n = order + 1
   !> Finite-difference weights.
   weights = taylor_optimized_findiff([(i, i=0, n - 1)])
   end procedure forward_findiff

end module FinDiff
