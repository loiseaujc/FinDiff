module FinDiff
   use FinDiff_kinds, only: ilp, dp, qp
   use FinDiff_utils, only: vandermonde, factorial
   use stdlib_optval, only: optval
   use stdlib_linalg, only: solve
   use assert_m, only: assert => assert_always
   implicit none(type, external)
   private

   public :: ilp, dp, qp
   !> Standard finite differences schemes.
   public :: taylor_optimized_findiff
   public :: central_findiff
   public :: backward_findiff
   public :: forward_findiff

   !-------------------------------------------------------
   !-----     STANDARD FINITE DIFFERENCES SCHEMES     -----
   !-------------------------------------------------------

   interface
      module function central_findiff(order, nth) result(weights)
         implicit none(type, external)
         integer(ilp), intent(in) :: order
         integer(ilp), optional, intent(in) :: nth
         real(qp), allocatable :: weights(:)
      end function central_findiff

      module function backward_findiff(order, nth) result(weights)
         implicit none(type, external)
         integer(ilp), intent(in) :: order
         integer(ilp), optional, intent(in) :: nth
         real(qp), allocatable :: weights(:)
      end function backward_findiff

      module function forward_findiff(order, nth) result(weights)
         implicit none(type, external)
         integer(ilp), intent(in) :: order
         integer(ilp), optional, intent(in) :: nth
         real(qp), allocatable :: weights(:)
      end function forward_findiff

      module function taylor_optimized_findiff(stencil, nth) result(weights)
         implicit none(type, external)
         integer(ilp), intent(in) :: stencil(:)
         integer(ilp), intent(in) :: nth
         real(qp), allocatable :: weights(:)
      end function taylor_optimized_findiff
   end interface

end module FinDiff
