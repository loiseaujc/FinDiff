module test_drp_schemes
   use stdlib_math, only: all_close
   use FinDiff
   use testdrive, only: new_unittest, unittest_type, error_type, check
   implicit none(type, external)
   private

   public :: collect_test_drp_schemes
   real(qp), parameter :: alpha_max = 2.5_qp
   real(qp), parameter :: tol = 1e-14_qp
   real(qp), parameter :: pi = 4.0_qp*atan(1.0_qp)

contains

   subroutine collect_test_drp_schemes(testsuite)
      type(unittest_type), allocatable, intent(out) :: testsuite(:)
      testsuite = [new_unittest("Tam & Webb (1993)", test_tam_webb_scheme)]
      testsuite = [testsuite, new_unittest("Donzis (2019)", test_donzis_schemes)]
   end subroutine collect_test_drp_schemes

   subroutine test_tam_webb_scheme(error)
      type(error_type), allocatable, intent(out) :: error
      integer(ilp), parameter :: npts = 7
      integer(ilp) :: i
      integer(ilp), allocatable :: stencil(:)
      real(qp), allocatable :: weights(:)
      real(qp), parameter :: weights_drp(npts) = [-0.02651995_qp, 0.18941314_qp, -0.79926643_qp, 0.0_qp, &
                                                  0.79926643_qp, -0.18941314_qp, 0.02651995_qp]

      !> Compute DRP scheme.
      stencil = [(i, i=-(npts - 1)/2, (npts - 1)/2)]
      weights = central_drp_findiff(order=4, npts=npts, nth=1, alpha_max=pi/2)
      call check(error, all_close(weights, weights_drp, abs_tol=1e-8_qp))
      if (allocated(error)) return
   end subroutine test_tam_webb_scheme

   subroutine test_donzis_schemes(error)
      type(error_type), allocatable, intent(out) :: error
      real(qp), allocatable :: weights(:)

      !------------------------------------
      !-----     FIRST DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_3pts_2order(3) = [-0.5_qp, 0.0_qp, 0.5_qp]
         real(qp), parameter :: weights_5pts_2order(5) = [0.220751102318488_qp, -0.941502204636976_qp, 0.0_qp, &
                                                          0.941502204636976_qp, -0.220751102318488_qp]
         real(qp), parameter :: weights_7pts_2order(7) = [-0.111425875874899_qp, 0.372951233396604_qp, -0.911624839168511_qp, &
                                                          0.0_qp, 0.911624839168511_qp, -0.372951233396604_qp, 0.111425875874899_qp]
         real(qp), parameter :: weights_9pts_2order(9) = [0.058199832241477_qp, -0.182092697439389_qp, 0.376375957228243_qp, &
                                                          -0.939273151104227_qp, 0.0_qp, 0.939273151104227_qp, &
                                                          -0.376375957228243_qp, 0.182092697439389_qp, -0.058199832241477_qp]
         !> Standard second-order scheme.
         weights = central_drp_findiff(order=2, npts=3, nth=1, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_3pts_2order, abs_tol=tol))
         if (allocated(error)) return

         !> 2nd-order DRP w/ 5 points.
         weights = central_drp_findiff(order=2, npts=5, nth=1, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_5pts_2order, abs_tol=tol))
         if (allocated(error)) return

         !> 2nd-order DRP w/ 7 points.
         weights = central_drp_findiff(order=2, npts=7, nth=1, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_7pts_2order, abs_tol=tol))
         if (allocated(error)) return

         !> 2nd-order DRP w/ 9 points.
         weights = central_drp_findiff(order=2, npts=9, nth=1, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_9pts_2order, abs_tol=tol))
         if (allocated(error)) return
      end block

      !-------------------------------------
      !-----     SECOND DERIVATIVE     -----
      !-------------------------------------
      block
         real(qp), parameter :: weights_3pts_2order(3) = [1.0_qp, -2.0_qp, 1.0_qp]
         real(qp), parameter :: weights_5pts_2order(5) = [-0.164490985357722_qp, 1.657963941430890_qp, &
                                                          -2.986945912146335_qp, 1.657963941430890_qp, -0.164490985357722_qp]
         real(qp), parameter :: weights_7pts_2order(7) = [0.050589678364752_qp, -0.312793272384242_qp, 1.795865984254199_qp, &
                                                          -3.067324780469417_qp, 1.795865984254199_qp, &
                                                          -0.312793272384242_qp, 0.050589678364752_qp]
         real(qp), parameter :: weights_9pts_2order(9) = [-0.019192313056941_qp, 0.099426449444277_qp, -0.357929955982910_qp, &
                                                          1.843958787844204_qp, -3.132525936497260_qp, 1.843958787844204_qp, &
                                                          -0.357929955982910_qp, 0.099426449444277_qp, -0.019192313056941_qp]

         !> Standard second-order scheme.
         weights = central_drp_findiff(order=2, npts=3, nth=2, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_3pts_2order, abs_tol=tol))
         if (allocated(error)) return

         !> 2nd-order DRP w/ 5 points.
         weights = central_drp_findiff(order=2, npts=5, nth=2, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_5pts_2order, abs_tol=tol))
         if (allocated(error)) return

         !> 2nd-order DRP w/ 7 points.
         weights = central_drp_findiff(order=2, npts=7, nth=2, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_7pts_2order, abs_tol=tol))
         if (allocated(error)) return

         !> 2nd-order DRP w/ 9 points.
         weights = central_drp_findiff(order=2, npts=9, nth=2, alpha_max=alpha_max)
         call check(error, all_close(weights, weights_9pts_2order, abs_tol=tol))
         if (allocated(error)) return
      end block
   end subroutine test_donzis_schemes

end module test_drp_schemes

program tester
   use, intrinsic :: iso_fortran_env, only: error_unit
   use testdrive, only: run_testsuite, new_testsuite, testsuite_type
   use test_drp_schemes, only: collect_test_drp_schemes
   implicit none
   integer :: stat, is
   type(testsuite_type), allocatable :: testsuites(:)
   character(len=*), parameter :: fmt = '("#", *(1x, a))'

   stat = 0

   testsuites = [new_testsuite("DRP schemes", collect_test_drp_schemes)]

   do is = 1, size(testsuites)
      write (error_unit, fmt) "Testing:", testsuites(is)%name
      call run_testsuite(testsuites(is)%collect, error_unit, stat)
   end do

   if (stat > 0) then
      write (error_unit, '(i0, 1x, a)') stat, "test(s) failed!"
      error stop
   end if
end program tester
