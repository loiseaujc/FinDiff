module FinDiff
   use kinds
   use linalg, only: vandermonde
   use stdlib_optval, only: optval
   use stdlib_linalg, only: solve
   implicit none
   private

   public :: ilp, wp
   public :: taylor_optimized_findiff
   public :: central_findiff
   public :: backward_findiff
   public :: forward_findiff

   interface
      module function central_findiff(order, nth) result(weights)
         integer(ilp), intent(in) :: order
         integer(ilp), optional, intent(in) :: nth
         real(wp), allocatable :: weights(:)
      end function central_findiff

      module function backward_findiff(order, nth) result(weights)
         integer(ilp), intent(in) :: order
         integer(ilp), optional, intent(in) :: nth
         real(wp), allocatable :: weights(:)
      end function backward_findiff

      module function forward_findiff(order, nth) result(weights)
         integer(ilp), intent(in) :: order
         integer(ilp), optional, intent(in) :: nth
         real(wp), allocatable :: weights(:)
      end function forward_findiff

      module function taylor_optimized_findiff(stencil, nth) result(weights)
         integer(ilp), intent(in) :: stencil(:)
         integer(ilp), intent(in) :: nth
         real(wp), allocatable :: weights(:)
      end function taylor_optimized_findiff
   end interface

contains

   integer(ilp) pure function factorial(n) result(out)
      integer(ilp), intent(in) :: n
      integer(ilp) :: i
      out = 1
      do i = 1, n
         out = i*out
      end do
   end function factorial

   module procedure taylor_optimized_findiff
   real(wp), allocatable :: A(:, :), b(:)
   !> Linear system.
   A = transpose(vandermonde(real(stencil, kind=wp)))
   allocate (b(size(A, 1)), source=0.0_wp); b(nth + 1) = factorial(nth)
   !> Finite-difference weights.
   weights = solve(A, b)
   end procedure taylor_optimized_findiff

   module procedure central_findiff
   integer(ilp) :: i, n, nth_
   !> Order of the derivative.
   nth_ = optval(nth, 1)
   !> Number of points in the stencil.
   n = order + nth_
   !> Finite-difference weights
   weights = taylor_optimized_findiff([(i, i=(-n + 1)/2, (n - 1)/2)], nth_)
   end procedure central_findiff

   module procedure backward_findiff
   integer(ilp) :: i, n, nth_
   !> Order of the derivative.
   nth_ = optval(nth, 1)
   !> Number of points in the stencil.
   n = order + nth_
   !> Finite-difference weights.
   weights = taylor_optimized_findiff([(i, i=-n + 1, 0)], nth_)
   end procedure backward_findiff

   module procedure forward_findiff
   integer(ilp) :: i, n, nth_
   !> Order of the derivative.
   nth_ = optval(nth, 1)
   !> Number of points in the stencil.
   n = order + nth_
   !> Finite-difference weights.
   weights = taylor_optimized_findiff([(i, i=0, n - 1)], nth_)
   end procedure forward_findiff

end module FinDiff
