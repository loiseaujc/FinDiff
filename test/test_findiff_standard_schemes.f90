module test_FinDiff_standard_schemes
   use stdlib_math, only: all_close
   use FinDiff
   use testdrive, only: new_unittest, unittest_type, error_type, check
   implicit none(type, external)
   private

   public :: collect_test_standard_schemes
contains
   subroutine collect_test_standard_schemes(testsuite)
      type(unittest_type), allocatable, intent(out) :: testsuite(:)
      testsuite = [new_unittest("Standard central schemes", test_central_schemes)]
      testsuite = [testsuite, new_unittest("Standard forward schemes", test_forward_findiff)]
      testsuite = [testsuite, new_unittest("Standard backward schemes", test_backward_findiff)]
   end subroutine collect_test_standard_schemes

   subroutine test_central_schemes(error)
      type(error_type), allocatable, intent(out) :: error
      real(qp), allocatable :: weights(:)

      !------------------------------------
      !-----     FIRST DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_3pts_2order(3) = [-0.5_qp, 0.0_qp, 0.5_qp]
         real(qp), parameter :: weights_5pts_4order(5) = [1.0_qp/12.0_qp, -2.0_qp/3.0_qp, 0.0_qp, 2.0_qp/3.0_qp, -1.0_qp/12.0_qp]
         real(qp), parameter :: weights_7pts_6order(7) = [-1.0_qp/60.0_qp, 3.0_qp/20.0_qp, -0.75_qp, 0.0_qp, &
                                                          0.75_qp, -3.0_qp/20.0_qp, 1.0_qp/60.0_qp]
         real(qp), parameter :: weights_9pts_8order(9) = [1.0_qp/280.0_qp, -4.0_qp/105.0_qp, 0.2_qp, -0.8_qp, 0.0_qp, &
                                                          0.8_qp, -0.2_qp, 4.0_qp/105.0_qp, -1.0_qp/280.0_qp]

         !> Second-order accurate scheme.
         weights = central_findiff(order=2)
         call check(error, all_close(weights, weights_3pts_2order))
         if (allocated(error)) return

         !> Forth-order accurate scheme.
         weights = central_findiff(order=4)
         call check(error, all_close(weights, weights_5pts_4order))
         if (allocated(error)) return

         !> Six-th order accurate scheme.
         weights = central_findiff(order=6)
         call check(error, all_close(weights, weights_7pts_6order))
         if (allocated(error)) return

         !> Eight-th order accurate scheme.
         weights = central_findiff(order=8)
         call check(error, all_close(weights, weights_9pts_8order))
         if (allocated(error)) return
      end block

      !-------------------------------------
      !-----     SECOND DERIVATIVE     -----
      !-------------------------------------
      block
         real(qp), parameter :: weights_3pts_2order(3) = [1.0_qp, -2.0_qp, 1.0_qp]
         real(qp), parameter :: weights_5pts_4order(5) = [-1.0_qp/12.0_qp, 4.0_qp/3.0_qp, -2.5_qp, 4.0_qp/3.0_qp, -1.0_qp/12.0_qp]
         real(qp), parameter :: weights_7pts_6order(7) = [1.0_qp/90.0_qp, -3.0_qp/20.0_qp, 1.5_qp, -49.0_qp/18.0_qp, &
                                                          1.5_qp, -3.0_qp/20.0_qp, 1.0_qp/90.0_qp]
         real(qp), parameter :: weights_9pts_8order(9) = [-1.0_qp/560.0_qp, 8.0_qp/315.0_qp, -0.2_qp, 8.0_qp/5.0_qp, &
                                                       -205.0_qp/72.0_qp, 8.0_qp/5.0_qp, -0.2_qp, 8.0_qp/315.0_qp, -1.0_qp/560.0_qp]

         !> Second-order accurate scheme.
         weights = central_findiff(order=2, nth=2)
         call check(error, all_close(weights, weights_3pts_2order))
         if (allocated(error)) return

         !> Fourth-order accurate scheme.
         weights = central_findiff(order=4, nth=2)
         call check(error, all_close(weights, weights_5pts_4order))
         if (allocated(error)) return

         !> Sixth-order accurate scheme.
         weights = central_findiff(order=6, nth=2)
         call check(error, all_close(weights, weights_7pts_6order))
         if (allocated(error)) return

         !> Eightth-order accurate scheme.
         weights = central_findiff(order=8, nth=2)
         call check(error, all_close(weights, weights_9pts_8order))
         if (allocated(error)) return
      end block

      !------------------------------------
      !-----     THIRD DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_5pts_order2(5) = [-0.5_qp, 1.0_qp, 0.0_qp, -1.0_qp, 0.5_qp]
         real(qp), parameter :: weights_7pts_order4(7) = [0.125_qp, -1.0_qp, 13.0_qp/8.0_qp, 0.0_qp, &
                                                          -13.0_qp/8.0_qp, 1.0_qp, -0.125_qp]
         real(qp), parameter :: weights_9pts_order6(9) = [-7.0_qp/240.0_qp, 0.3_qp, -169.0_qp/120.0_qp, 61.0_qp/30.0_qp, 0.0_qp, &
                                                          -61.0_qp/30.0_qp, 169.0_qp/120.0_qp, -0.3_qp, 7.0_qp/240.0_qp]

         !> Second-order accurate scheme.
         weights = central_findiff(order=2, nth=3)
         call check(error, all_close(weights, weights_5pts_order2))
         if (allocated(error)) return

         !> Fourth-order accurate scheme.
         weights = central_findiff(order=4, nth=3)
         call check(error, all_close(weights, weights_7pts_order4))
         if (allocated(error)) return

         !> Sixth-order accurate scheme.
         weights = central_findiff(order=6, nth=3)
         call check(error, all_close(weights, weights_9pts_order6))
         if (allocated(error)) return
      end block
   end subroutine test_central_schemes

   subroutine test_forward_findiff(error)
      type(error_type), allocatable, intent(out) :: error
      real(qp), allocatable :: weights(:)

      !------------------------------------
      !-----     FIRST DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_2pts_1order(2) = [-1.0_qp, 1.0_qp]
         real(qp), parameter :: weights_3pts_2order(3) = [-1.5_qp, 2.0_qp, -0.5_qp]
         real(qp), parameter :: weights_4pts_3order(4) = [-11.0_qp/6.0_qp, 3.0_qp, -1.5_qp, 1.0_qp/3.0_qp]

         !> First-order accurate scheme.
         weights = forward_findiff(order=1, nth=1)
         call check(error, all_close(weights, weights_2pts_1order))
         if (allocated(error)) return

         !> Second-order accurate scheme.
         weights = forward_findiff(order=2, nth=1)
         call check(error, all_close(weights, weights_3pts_2order))

         !> Third-order accurate scheme.
         weights = forward_findiff(order=3, nth=1)
         call check(error, all_close(weights, weights_4pts_3order))
         if (allocated(error)) return
      end block

      !-------------------------------------
      !-----     SECOND DERIVATIVE     -----
      !-------------------------------------
      block
         real(qp), parameter :: weights_3pts_order1(3) = [1.0_qp, -2.0_qp, 1.0_qp]
         real(qp), parameter :: weights_4pts_order2(4) = [2.0_qp, -5.0_qp, 4.0_qp, -1.0_qp]
         real(qp), parameter :: weights_5pts_order3(5) = [35.0_qp/12.0_qp, -26.0_qp/3.0_qp, 19.0_qp/2.0_qp, &
                                                          -14.0_qp/3.0_qp, 11.0_qp/12.0_qp]

         !> First-order accurate scheme.
         weights = forward_findiff(order=1, nth=2)
         call check(error, all_close(weights, weights_3pts_order1))
         if (allocated(error)) return

         !> Second-order accurate scheme.
         weights = forward_findiff(order=2, nth=2)
         call check(error, all_close(weights, weights_4pts_order2))
         if (allocated(error)) return

         !> Third-order accurate scheme.
         weights = forward_findiff(order=3, nth=2)
         call check(error, all_close(weights, weights_5pts_order3))
         if (allocated(error)) return
      end block

      !------------------------------------
      !-----     THIRD DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_4pts_1order(4) = [-1.0_qp, 3.0_qp, -3.0_qp, 1.0_qp]
         real(qp), parameter :: weights_5pts_2order(5) = [-5.0_qp/2.0_qp, 9.0_qp, -12.0_qp, 7.0_qp, -1.5_qp]
         real(qp), parameter :: weights_6pts_3order(6) = [-17.0_qp/4.0_qp, 71.0_qp/4.0_qp, -59.0_qp/2.0_qp, &
                                                          49.0_qp/2.0_qp, -41.0_qp/4.0_qp, 7.0_qp/4.0_qp]

         !> First-order accurate scheme.
         weights = forward_findiff(order=1, nth=3)
         call check(error, all_close(weights, weights_4pts_1order))
         if (allocated(error)) return

         !> Second-order accurate scheme.
         weights = forward_findiff(order=2, nth=3)
         call check(error, all_close(weights, weights_5pts_2order))
         if (allocated(error)) return

         !> Third-order accurate scheme.
         weights = forward_findiff(order=3, nth=3)
         call check(error, all_close(weights, weights_6pts_3order))
         if (allocated(error)) return
      end block
   end subroutine test_forward_findiff

   subroutine test_backward_findiff(error)
      type(error_type), allocatable, intent(out) :: error
      real(qp), allocatable :: weights(:)

      !------------------------------------
      !-----     FIRST DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_2pts_1order(2) = [-1.0_qp, 1.0_qp]
         real(qp), parameter :: weights_3pts_2order(3) = [-1.5_qp, 2.0_qp, -0.5_qp]
         real(qp), parameter :: weights_4pts_3order(4) = [-11.0_qp/6.0_qp, 3.0_qp, -1.5_qp, 1.0_qp/3.0_qp]

         !> First-order accurate scheme.
         weights = backward_findiff(order=1, nth=1)
         call check(error, all_close(weights, -reverse(weights_2pts_1order)))
         if (allocated(error)) return

         !> Second-order accurate scheme.
         weights = backward_findiff(order=2, nth=1)
         call check(error, all_close(weights, -reverse(weights_3pts_2order)))

         !> Third-order accurate scheme.
         weights = backward_findiff(order=3, nth=1)
         call check(error, all_close(weights, -reverse(weights_4pts_3order)))
         if (allocated(error)) return
      end block

      !-------------------------------------
      !-----     SECOND DERIVATIVE     -----
      !-------------------------------------
      block
         real(qp), parameter :: weights_3pts_order1(3) = [1.0_qp, -2.0_qp, 1.0_qp]
         real(qp), parameter :: weights_4pts_order2(4) = [2.0_qp, -5.0_qp, 4.0_qp, -1.0_qp]
         real(qp), parameter :: weights_5pts_order3(5) = [35.0_qp/12.0_qp, -26.0_qp/3.0_qp, 19.0_qp/2.0_qp, &
                                                          -14.0_qp/3.0_qp, 11.0_qp/12.0_qp]

         !> First-order accurate scheme.
         weights = backward_findiff(order=1, nth=2)
         call check(error, all_close(weights, reverse(weights_3pts_order1)))
         if (allocated(error)) return

         !> Second-order accurate scheme.
         weights = backward_findiff(order=2, nth=2)
         call check(error, all_close(weights, reverse(weights_4pts_order2)))
         if (allocated(error)) return

         !> Third-order accurate scheme.
         weights = backward_findiff(order=3, nth=2)
         call check(error, all_close(weights, reverse(weights_5pts_order3)))
         if (allocated(error)) return
      end block

      !------------------------------------
      !-----     THIRD DERIVATIVE     -----
      !------------------------------------
      block
         real(qp), parameter :: weights_4pts_1order(4) = [-1.0_qp, 3.0_qp, -3.0_qp, 1.0_qp]
         real(qp), parameter :: weights_5pts_2order(5) = [-5.0_qp/2.0_qp, 9.0_qp, -12.0_qp, 7.0_qp, -1.5_qp]
         real(qp), parameter :: weights_6pts_3order(6) = [-17.0_qp/4.0_qp, 71.0_qp/4.0_qp, -59.0_qp/2.0_qp, &
                                                          49.0_qp/2.0_qp, -41.0_qp/4.0_qp, 7.0_qp/4.0_qp]

         !> First-order accurate scheme.
         weights = backward_findiff(order=1, nth=3)
         call check(error, all_close(weights, -reverse(weights_4pts_1order)))
         if (allocated(error)) return

         !> Second-order accurate scheme.
         weights = backward_findiff(order=2, nth=3)
         call check(error, all_close(weights, -reverse(weights_5pts_2order)))
         if (allocated(error)) return

         !> Third-order accurate scheme.
         weights = backward_findiff(order=3, nth=3)
         call check(error, all_close(weights, -reverse(weights_6pts_3order)))
         if (allocated(error)) return
      end block
   contains
      pure function reverse(x) result(y)
         real(qp), intent(in) :: x(:)
         real(qp), allocatable :: y(:)
         integer(ilp) :: i
         y = x(size(x):1:-1)
      end function reverse
   end subroutine test_backward_findiff

end module test_FinDiff_standard_schemes

program test_standard_schemes
   use, intrinsic :: iso_fortran_env, only: error_unit
   use testdrive, only: run_testsuite, new_testsuite, testsuite_type
   use test_FinDiff_standard_schemes, only: collect_test_standard_schemes
   implicit none
   integer :: stat, is
   type(testsuite_type), allocatable :: testsuites(:)
   character(len=*), parameter :: fmt = '("#", *(1x, a))'

   stat = 0

   testsuites = [new_testsuite("Standard schemes", collect_test_standard_schemes)]

   do is = 1, size(testsuites)
      write (error_unit, fmt) "Testing:", testsuites(is)%name
      call run_testsuite(testsuites(is)%collect, error_unit, stat)
   end do

   if (stat > 0) then
      write (error_unit, '(i0, 1x, a)') stat, "test(s) failed!"
      error stop
   end if
end program test_standard_schemes
