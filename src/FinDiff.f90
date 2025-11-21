module FinDiff
   use FinDiff_kinds, only: ilp, dp, qp
   use assert_m, only: assert => assert_always
   implicit none(type, external)
   private

   public :: ilp, dp, qp
   !> Standard finite differences schemes.
   public :: taylor_optimized_findiff
   public :: central_findiff
   public :: backward_findiff
   public :: forward_findiff
   !> Dispersion-Relation-Preserving finite differences schemes.
   public :: central_drp_findiff
   !> Analysis/Diagnostics.
   public :: effective_wavenumber

   !> Constants.
   real(qp), parameter :: pi = 4.0_qp*atan(1.0_qp)
   complex(qp), parameter :: im = cmplx(0.0_qp, 1.0_qp, kind=qp)

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

   !----------------------------------------------------------
   !-----     DISPERSION-RELATION-PRESERVING SCHEMES     -----
   !----------------------------------------------------------

   interface
      module function central_drp_findiff(order, npts, nth, alpha_max) result(weights)
         integer(ilp), intent(in) :: order
         integer(ilp), intent(in) :: npts
         integer(ilp), optional, intent(in) :: nth
         real(qp), optional, intent(in) :: alpha_max
         real(qp), allocatable :: weights(:)
      end function central_drp_findiff
   end interface

   !---------------------------------------
   !-----     ANALYSIS/DIAGNOSTIC     -----
   !---------------------------------------

   interface
      pure module function effective_wavenumber(stencil, weights, nth) result(kappa)
         implicit none(type, external)
         integer(ilp), intent(in) :: stencil(:)
         real(qp), intent(in) :: weights(:)
         integer(ilp), optional, intent(in) :: nth
         real(qp), allocatable :: kappa(:)
      end function effective_wavenumber
   end interface

end module FinDiff
