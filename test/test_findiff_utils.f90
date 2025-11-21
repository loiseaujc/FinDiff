module test_FinDiff_utils
   use FinDiff
   use FinDiff_utils, only: constrained_quadprog
   use stdlib_linalg, only: hermitian, norm
   use testdrive, only: new_unittest, unittest_type, error_type, check
   implicit none
   private

   public :: collect_test_utils

contains

   !> Collect all exported unit tests
   subroutine collect_test_utils(testsuite)
      !> Collection of tests
      type(unittest_type), allocatable, intent(out) :: testsuite(:)
      testsuite = [new_unittest("Quadratic Programming", test_quadprog)]
   end subroutine collect_test_utils

   subroutine test_quadprog(error)
      type(error_type), allocatable, intent(out) :: error
      integer(ilp), parameter :: m = 5, n = 4, p = 3
      !> Least-squares cost.
      real(qp) :: A(m, n), b(m)
      !> Corresponding quadratic form.
      real(qp) :: Q(n, n), r(n)
      !> Equality constraints.
      real(qp) :: C(p, n), d(p)
      !> Solution.
      real(qp) :: x(n), x_true(n)

      !> Least-squares cost.
      A(1, :) = [1.0_qp, 1.0_qp, 1.0_qp, 1.0_qp]
      A(2, :) = [1.0_qp, 3.0_qp, 1.0_qp, 1.0_qp]
      A(3, :) = [1.0_qp, -1.0_qp, 3.0_qp, 1.0_qp]
      A(4, :) = [1.0_qp, 1.0_qp, 1.0_qp, 3.0_qp]
      A(5, :) = [1.0_qp, 1.0_qp, 1.0_qp, -1.0_qp]

      b = [2.0_qp, 1.0_qp, 6.0_qp, 3.0_qp, 1.0_qp]

      !> Equality constraints.
      C(1, :) = [1.0_qp, 1.0_qp, 1.0_qp, -1.0_qp]
      C(2, :) = [1.0_qp, -1.0_qp, 1.0_qp, 1.0_qp]
      C(3, :) = [1.0_qp, 1.0_qp, -1.0_qp, 1.0_qp]

      d = [1.0_qp, 3.0_qp, -1.0_qp]

      !> True solution.
      x_true = [0.5_qp, -0.5_qp, 1.5_qp, 0.5_qp]

      !> Quadratic cost.
      Q = matmul(transpose(A), A)
      r = matmul(transpose(A), b)

      !> Compute solution.
      x = constrained_quadprog(Q, r, C, d)

      !> Check error.
      call check(error, norm(x - x_true, 2) <= n*epsilon(1.0_qp))
      if (allocated(error)) return
   end subroutine test_quadprog

end module test_FinDiff_utils

program test_utils
   use, intrinsic :: iso_fortran_env, only: error_unit
   use testdrive, only: run_testsuite, new_testsuite, testsuite_type
   use test_FinDiff_utils, only: collect_test_utils
   implicit none
   integer :: stat, is
   type(testsuite_type), allocatable :: testsuites(:)
   character(len=*), parameter :: fmt = '("#", *(1x, a))'

   stat = 0

   testsuites = [new_testsuite("Utilities", collect_test_utils)]

   do is = 1, size(testsuites)
      write (error_unit, fmt) "Testing:", testsuites(is)%name
      call run_testsuite(testsuites(is)%collect, error_unit, stat)
   end do

   if (stat > 0) then
      write (error_unit, '(i0, 1x, a)') stat, "test(s) failed!"
      error stop
   end if
end program test_utils
