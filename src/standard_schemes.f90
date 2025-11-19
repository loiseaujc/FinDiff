submodule(FinDiff) standard_schemes
   implicit none(type, external)
contains
   module procedure taylor_optimized_findiff
   real(qp), allocatable :: A(:, :), b(:)
   !> Assertions.
   call assert(assertion=nth > 0, &
               description="The order of the derivative needs to be positive.")
   A = transpose(vandermonde(real(stencil, kind=qp)))
   allocate (b(size(A, 1)), source=0.0_qp); b(nth + 1) = factorial(nth)
   !> Finite-difference weights.
   weights = solve(A, b)
   end procedure taylor_optimized_findiff

   module procedure central_findiff
   integer(ilp) :: i, n, nth_
   !> Order of the derivative.
   nth_ = optval(nth, 1)
   !> Number of points in the stencil.
   n = order + 1
   !> Finite-difference weights
   weights = taylor_optimized_findiff([(i, i=(-n + 1)/2, (n - 1)/2)], nth_)
   !> Ensure machine-precision (anti-)symmetry.
   weights = merge(weights + weights(n:1:-1), weights - weights(n:1:-1), mod(nth_, 2) == 0)/2
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
end submodule standard_schemes
