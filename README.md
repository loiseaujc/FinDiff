![](img/findiff_logo.png)

---

Modern Fortran utility to generate optimized finite-differences schemes

### Status

[![Language](https://img.shields.io/badge/-Fortran-734f96?logo=fortran&logoColor=white)](https://github.com/topics/fortran)
[![GitHub release](https://img.shields.io/github/release/loiseaujc/findiff.svg)](https://github.com/loiseaujc/findiff/releases/latest)
[![Build Status](https://github.com/loiseaujc/findiff/actions/workflows/CI-CD.yml/badge.svg)](https://github.com/loiseaujc/findiff/actions)
[![codecov](https://codecov.io/gh/loiseaujc/findiff/branch/main/graph/badge.svg)](https://codecov.io/gh/loiseaujc/findiff)
[![last-commit](https://img.shields.io/github/last-commit/loiseaujc/findiff)](https://github.com/loiseaujc/findiff/commits/main)

### Description

`FinDiff` is small Fortran utility package to generate optimized (dispersion-relation-preserving) finite difference schemes for regular stencils. Along with the standard central, forward and backward finite difference schemes optimized in the sense of Taylor, it can also compute optimized central finite difference schemes for the first and second derivatives.

### Building FinDiff

`FinDiff` can be built with the [Fortran Package Manager](https://github.com/fortran-lang/fpm) `fpm` using the provided `fpm.toml` like so:

```bash
fpm build --release
```

Only quadrapule precision (`real128`) is currently supported. To use `FinDiff` within your `fpm` project, add the following line to your `fpm.toml` file:

```toml
[dependencies]
FinDiff = {git="https://github.com/loiseaujc/FinDiff.git"}
```

### Example

In 1993, [Tam & Webb](https://eclass.upatras.gr/modules/document/file.php/MECH1137/Y%CE%A0%CE%9F%CE%9B%CE%9F%CE%93%CE%99%CE%A3%CE%A4%CE%99%CE%9A%CE%97_%CE%9C%CE%97%CE%A7_%CE%A1%CE%95%CE%A5%CE%A3%CE%A4/%CE%92%CE%BF%CE%B7%CE%B8%CE%B7%CE%BC%CE%B1%CF%84%CE%B1/Papers_4Finite_Differences/Tam_Web.DPR.pdf) proposed *dispersion-relation-preserving* (DRP) finite difference schemes. They illustrated their approach by deriving a 7 points-DRP scheme which is fourth-order accurate while also minimizing the dispersion error

$$
\int_{-\frac{\pi}{2}}^{\frac{\pi}{2}} \vert \sum_{k=-m}^{m} w_k e^{i k \alpha} - i \alpha \vert^2 \mathrm{d}\alpha,
$$

where $\alpha$ is the reduced wavenumber of the wave. The following code snippet illustrates how to compute the corresponding finite difference stencil.

```fortran
program tam_webb
    use FinDiff
    implicit none (type, external)
    integer, parameter :: npts = 7, order = 4, nth = 1
    real(qp), parameter :: pi = 4 * atan(1.0_qp)
    real(qp), parameter :: alpha_max = pi/2
    real(qp), allocatable :: weights(:)

    !> Tam & Webb DRP scheme.
    weights = central_drp_findiff(npts=npts, order=order, nth=nth, alpha_max=alpha_max)
    print *, weights
end program tam_webb
```

### References

- K. Kumari, R. Bhattacharya and D. A. Donzis. *A unified approach for deriving optimal finite differences.* Journal of Computational Physics, vol. 399, 2019. [[PDF](https://arxiv.org/pdf/1908.02890)]
- C. K. W. Tam and J. C. Webb. *Dispersion-Relation-Preserving Finite Difference Schemes for Computational Acoustics.* Journal of Computational Physics, vol. 107, 1993. [[PDF](https://eclass.upatras.gr/modules/document/file.php/MECH1137/Y%CE%A0%CE%9F%CE%9B%CE%9F%CE%93%CE%99%CE%A3%CE%A4%CE%99%CE%9A%CE%97_%CE%9C%CE%97%CE%A7_%CE%A1%CE%95%CE%A5%CE%A3%CE%A4/%CE%92%CE%BF%CE%B7%CE%B8%CE%B7%CE%BC%CE%B1%CF%84%CE%B1/Papers_4Finite_Differences/Tam_Web.DPR.pdf)]
