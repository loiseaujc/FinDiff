module stdlib_lapack_orthogonal_factors
  use stdlib_linalg_constants
  use stdlib_linalg_lapack_aux
  use stdlib_linalg_blas
  use stdlib_lapack_base
  implicit none

interface 
     pure module subroutine stdlib_stzrzf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_stzrzf

     pure module subroutine stdlib_dtzrzf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dtzrzf

     pure module subroutine stdlib_qtzrzf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qtzrzf


     pure module subroutine stdlib_ctzrzf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_ctzrzf

     pure module subroutine stdlib_ztzrzf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_ztzrzf

     pure module subroutine stdlib_wtzrzf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wtzrzf


end interface 


interface 
     pure module subroutine stdlib_cunmrz( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmrz

     pure module subroutine stdlib_zunmrz( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmrz

     pure module subroutine stdlib_wunmrz( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmrz


end interface 


interface 
     pure module subroutine stdlib_sormrz( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, lwork, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormrz

     pure module subroutine stdlib_dormrz( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, lwork, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormrz

     pure module subroutine stdlib_qormrz( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, lwork, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormrz


end interface 


interface 
     pure module subroutine stdlib_cunmr3( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, m, n
           complex(sp), intent(in) :: a(lda,*), tau(*)
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmr3

     pure module subroutine stdlib_zunmr3( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, m, n
           complex(dp), intent(in) :: a(lda,*), tau(*)
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmr3

     pure module subroutine stdlib_wunmr3( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, m, n
           complex(qp), intent(in) :: a(lda,*), tau(*)
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmr3


end interface 


interface 
     pure module subroutine stdlib_sormr3( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, m, n
           real(sp), intent(in) :: a(lda,*), tau(*)
           real(sp), intent(inout) :: c(ldc,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormr3

     pure module subroutine stdlib_dormr3( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, m, n
           real(dp), intent(in) :: a(lda,*), tau(*)
           real(dp), intent(inout) :: c(ldc,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormr3

     pure module subroutine stdlib_qormr3( side, trans, m, n, k, l, a, lda, tau, c, ldc,work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, l, lda, ldc, m, n
           real(qp), intent(in) :: a(lda,*), tau(*)
           real(qp), intent(inout) :: c(ldc,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormr3


end interface 


interface 
     pure module subroutine stdlib_slarz( side, m, n, l, v, incv, tau, c, ldc, work )
           character, intent(in) :: side
           integer(ilp), intent(in) :: incv, l, ldc, m, n
           real(sp), intent(in) :: tau
           real(sp), intent(inout) :: c(ldc,*)
           real(sp), intent(in) :: v(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_slarz

     pure module subroutine stdlib_dlarz( side, m, n, l, v, incv, tau, c, ldc, work )
           character, intent(in) :: side
           integer(ilp), intent(in) :: incv, l, ldc, m, n
           real(dp), intent(in) :: tau
           real(dp), intent(inout) :: c(ldc,*)
           real(dp), intent(in) :: v(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dlarz

     pure module subroutine stdlib_qlarz( side, m, n, l, v, incv, tau, c, ldc, work )
           character, intent(in) :: side
           integer(ilp), intent(in) :: incv, l, ldc, m, n
           real(qp), intent(in) :: tau
           real(qp), intent(inout) :: c(ldc,*)
           real(qp), intent(in) :: v(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qlarz


     pure module subroutine stdlib_clarz( side, m, n, l, v, incv, tau, c, ldc, work )
           character, intent(in) :: side
           integer(ilp), intent(in) :: incv, l, ldc, m, n
           complex(sp), intent(in) :: tau
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(in) :: v(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_clarz

     pure module subroutine stdlib_zlarz( side, m, n, l, v, incv, tau, c, ldc, work )
           character, intent(in) :: side
           integer(ilp), intent(in) :: incv, l, ldc, m, n
           complex(dp), intent(in) :: tau
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(in) :: v(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zlarz

     pure module subroutine stdlib_wlarz( side, m, n, l, v, incv, tau, c, ldc, work )
           character, intent(in) :: side
           integer(ilp), intent(in) :: incv, l, ldc, m, n
           complex(qp), intent(in) :: tau
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(in) :: v(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wlarz


end interface 


interface 
     pure module subroutine stdlib_slarzb( side, trans, direct, storev, m, n, k, l, v,ldv, t, ldt, c, &
               ldc, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, ldc, ldt, ldv, ldwork, m, n
           real(sp), intent(inout) :: c(ldc,*), t(ldt,*), v(ldv,*)
           real(sp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_slarzb

     pure module subroutine stdlib_dlarzb( side, trans, direct, storev, m, n, k, l, v,ldv, t, ldt, c, &
               ldc, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, ldc, ldt, ldv, ldwork, m, n
           real(dp), intent(inout) :: c(ldc,*), t(ldt,*), v(ldv,*)
           real(dp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_dlarzb

     pure module subroutine stdlib_qlarzb( side, trans, direct, storev, m, n, k, l, v,ldv, t, ldt, c, &
               ldc, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, ldc, ldt, ldv, ldwork, m, n
           real(qp), intent(inout) :: c(ldc,*), t(ldt,*), v(ldv,*)
           real(qp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_qlarzb


     pure module subroutine stdlib_clarzb( side, trans, direct, storev, m, n, k, l, v,ldv, t, ldt, c, &
               ldc, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, ldc, ldt, ldv, ldwork, m, n
           complex(sp), intent(inout) :: c(ldc,*), t(ldt,*), v(ldv,*)
           complex(sp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_clarzb

     pure module subroutine stdlib_zlarzb( side, trans, direct, storev, m, n, k, l, v,ldv, t, ldt, c, &
               ldc, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, ldc, ldt, ldv, ldwork, m, n
           complex(dp), intent(inout) :: c(ldc,*), t(ldt,*), v(ldv,*)
           complex(dp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_zlarzb

     pure module subroutine stdlib_wlarzb( side, trans, direct, storev, m, n, k, l, v,ldv, t, ldt, c, &
               ldc, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, ldc, ldt, ldv, ldwork, m, n
           complex(qp), intent(inout) :: c(ldc,*), t(ldt,*), v(ldv,*)
           complex(qp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_wlarzb


end interface 


interface 
     pure module subroutine stdlib_slarzt( direct, storev, n, k, v, ldv, tau, t, ldt )
           character, intent(in) :: direct, storev
           integer(ilp), intent(in) :: k, ldt, ldv, n
           real(sp), intent(out) :: t(ldt,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(inout) :: v(ldv,*)
     end subroutine stdlib_slarzt

     pure module subroutine stdlib_dlarzt( direct, storev, n, k, v, ldv, tau, t, ldt )
           character, intent(in) :: direct, storev
           integer(ilp), intent(in) :: k, ldt, ldv, n
           real(dp), intent(out) :: t(ldt,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(inout) :: v(ldv,*)
     end subroutine stdlib_dlarzt

     pure module subroutine stdlib_qlarzt( direct, storev, n, k, v, ldv, tau, t, ldt )
           character, intent(in) :: direct, storev
           integer(ilp), intent(in) :: k, ldt, ldv, n
           real(qp), intent(out) :: t(ldt,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(inout) :: v(ldv,*)
     end subroutine stdlib_qlarzt


     pure module subroutine stdlib_clarzt( direct, storev, n, k, v, ldv, tau, t, ldt )
           character, intent(in) :: direct, storev
           integer(ilp), intent(in) :: k, ldt, ldv, n
           complex(sp), intent(out) :: t(ldt,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(inout) :: v(ldv,*)
     end subroutine stdlib_clarzt

     pure module subroutine stdlib_zlarzt( direct, storev, n, k, v, ldv, tau, t, ldt )
           character, intent(in) :: direct, storev
           integer(ilp), intent(in) :: k, ldt, ldv, n
           complex(dp), intent(out) :: t(ldt,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(inout) :: v(ldv,*)
     end subroutine stdlib_zlarzt

     pure module subroutine stdlib_wlarzt( direct, storev, n, k, v, ldv, tau, t, ldt )
           character, intent(in) :: direct, storev
           integer(ilp), intent(in) :: k, ldt, ldv, n
           complex(qp), intent(out) :: t(ldt,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(inout) :: v(ldv,*)
     end subroutine stdlib_wlarzt


end interface 


interface 
     pure module subroutine stdlib_slatrz( m, n, l, a, lda, tau, work )
           integer(ilp), intent(in) :: l, lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_slatrz

     pure module subroutine stdlib_dlatrz( m, n, l, a, lda, tau, work )
           integer(ilp), intent(in) :: l, lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dlatrz

     pure module subroutine stdlib_qlatrz( m, n, l, a, lda, tau, work )
           integer(ilp), intent(in) :: l, lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qlatrz


     pure module subroutine stdlib_clatrz( m, n, l, a, lda, tau, work )
           integer(ilp), intent(in) :: l, lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_clatrz

     pure module subroutine stdlib_zlatrz( m, n, l, a, lda, tau, work )
           integer(ilp), intent(in) :: l, lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zlatrz

     pure module subroutine stdlib_wlatrz( m, n, l, a, lda, tau, work )
           integer(ilp), intent(in) :: l, lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wlatrz


end interface 


interface 
     pure module subroutine stdlib_sgeqr( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(*), work(*)
     end subroutine stdlib_sgeqr

     pure module subroutine stdlib_dgeqr( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(*), work(*)
     end subroutine stdlib_dgeqr

     pure module subroutine stdlib_qgeqr( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(*), work(*)
     end subroutine stdlib_qgeqr


     pure module subroutine stdlib_cgeqr( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(*), work(*)
     end subroutine stdlib_cgeqr

     pure module subroutine stdlib_zgeqr( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(*), work(*)
     end subroutine stdlib_zgeqr

     pure module subroutine stdlib_wgeqr( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(*), work(*)
     end subroutine stdlib_wgeqr


end interface 


interface 
     pure module subroutine stdlib_sgemqr( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           real(sp), intent(in) :: a(lda,*), t(*)
           real(sp), intent(inout) :: c(ldc,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgemqr

     pure module subroutine stdlib_dgemqr( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           real(dp), intent(in) :: a(lda,*), t(*)
           real(dp), intent(inout) :: c(ldc,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgemqr

     pure module subroutine stdlib_qgemqr( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           real(qp), intent(in) :: a(lda,*), t(*)
           real(qp), intent(inout) :: c(ldc,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgemqr


     pure module subroutine stdlib_cgemqr( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           complex(sp), intent(in) :: a(lda,*), t(*)
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgemqr

     pure module subroutine stdlib_zgemqr( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           complex(dp), intent(in) :: a(lda,*), t(*)
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgemqr

     pure module subroutine stdlib_wgemqr( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           complex(qp), intent(in) :: a(lda,*), t(*)
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgemqr


end interface 


interface 
     pure module subroutine stdlib_sgeqrf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeqrf

     pure module subroutine stdlib_dgeqrf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeqrf

     pure module subroutine stdlib_qgeqrf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeqrf


     pure module subroutine stdlib_cgeqrf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeqrf

     pure module subroutine stdlib_zgeqrf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeqrf

     pure module subroutine stdlib_wgeqrf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeqrf


end interface 


interface 
     pure module subroutine stdlib_sgeqr2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeqr2

     pure module subroutine stdlib_dgeqr2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeqr2

     pure module subroutine stdlib_qgeqr2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeqr2


     pure module subroutine stdlib_cgeqr2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeqr2

     pure module subroutine stdlib_zgeqr2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeqr2

     pure module subroutine stdlib_wgeqr2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeqr2


end interface 


interface 
     pure module subroutine stdlib_cungqr( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungqr

     pure module subroutine stdlib_zungqr( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungqr

     pure module subroutine stdlib_wungqr( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungqr


end interface 


interface 
     pure module subroutine stdlib_cung2r( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cung2r

     pure module subroutine stdlib_zung2r( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zung2r

     pure module subroutine stdlib_wung2r( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wung2r


end interface 


interface 
     pure module subroutine stdlib_cunmqr( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmqr

     pure module subroutine stdlib_zunmqr( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmqr

     pure module subroutine stdlib_wunmqr( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmqr


end interface 


interface 
     pure module subroutine stdlib_cunm2r( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunm2r

     pure module subroutine stdlib_zunm2r( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunm2r

     pure module subroutine stdlib_wunm2r( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunm2r


end interface 


interface 
     pure module subroutine stdlib_sorgqr( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgqr

     pure module subroutine stdlib_dorgqr( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgqr

     pure module subroutine stdlib_qorgqr( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgqr


end interface 


interface 
     pure module subroutine stdlib_sorg2r( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorg2r

     pure module subroutine stdlib_dorg2r( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorg2r

     pure module subroutine stdlib_qorg2r( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorg2r


end interface 


interface 
     pure module subroutine stdlib_sormqr( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormqr

     pure module subroutine stdlib_dormqr( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormqr

     pure module subroutine stdlib_qormqr( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormqr


end interface 


interface 
     pure module subroutine stdlib_sorm2r( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorm2r

     pure module subroutine stdlib_dorm2r( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorm2r

     pure module subroutine stdlib_qorm2r( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorm2r


end interface 


interface 
     pure module subroutine stdlib_sgeqrt( m, n, nb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_sgeqrt

     pure module subroutine stdlib_dgeqrt( m, n, nb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_dgeqrt

     pure module subroutine stdlib_qgeqrt( m, n, nb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_qgeqrt


     pure module subroutine stdlib_cgeqrt( m, n, nb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_cgeqrt

     pure module subroutine stdlib_zgeqrt( m, n, nb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_zgeqrt

     pure module subroutine stdlib_wgeqrt( m, n, nb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_wgeqrt


end interface 


interface 
     pure module subroutine stdlib_sgeqrt2( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_sgeqrt2

     pure module subroutine stdlib_dgeqrt2( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_dgeqrt2

     pure module subroutine stdlib_qgeqrt2( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_qgeqrt2


     pure module subroutine stdlib_cgeqrt2( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_cgeqrt2

     pure module subroutine stdlib_zgeqrt2( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_zgeqrt2

     pure module subroutine stdlib_wgeqrt2( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_wgeqrt2


end interface 


interface 
     pure recursive module subroutine stdlib_sgeqrt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_sgeqrt3

     pure recursive module subroutine stdlib_dgeqrt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_dgeqrt3

     pure recursive module subroutine stdlib_qgeqrt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_qgeqrt3


     pure recursive module subroutine stdlib_cgeqrt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_cgeqrt3

     pure recursive module subroutine stdlib_zgeqrt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_zgeqrt3

     pure recursive module subroutine stdlib_wgeqrt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_wgeqrt3


end interface 


interface 
     pure module subroutine stdlib_sgemqrt( side, trans, m, n, k, nb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, nb, ldt
           real(sp), intent(in) :: v(ldv,*), t(ldt,*)
           real(sp), intent(inout) :: c(ldc,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgemqrt

     pure module subroutine stdlib_dgemqrt( side, trans, m, n, k, nb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, nb, ldt
           real(dp), intent(in) :: v(ldv,*), t(ldt,*)
           real(dp), intent(inout) :: c(ldc,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgemqrt

     pure module subroutine stdlib_qgemqrt( side, trans, m, n, k, nb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, nb, ldt
           real(qp), intent(in) :: v(ldv,*), t(ldt,*)
           real(qp), intent(inout) :: c(ldc,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgemqrt


     pure module subroutine stdlib_cgemqrt( side, trans, m, n, k, nb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, nb, ldt
           complex(sp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgemqrt

     pure module subroutine stdlib_zgemqrt( side, trans, m, n, k, nb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, nb, ldt
           complex(dp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgemqrt

     pure module subroutine stdlib_wgemqrt( side, trans, m, n, k, nb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, nb, ldt
           complex(qp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgemqrt


end interface 


interface 
     module subroutine stdlib_sgeqrfp( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeqrfp

     module subroutine stdlib_dgeqrfp( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeqrfp

     module subroutine stdlib_qgeqrfp( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeqrfp


     module subroutine stdlib_cgeqrfp( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeqrfp

     module subroutine stdlib_zgeqrfp( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeqrfp

     module subroutine stdlib_wgeqrfp( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeqrfp


end interface 


interface 
     module subroutine stdlib_sgeqr2p( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeqr2p

     module subroutine stdlib_dgeqr2p( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeqr2p

     module subroutine stdlib_qgeqr2p( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeqr2p


     module subroutine stdlib_cgeqr2p( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeqr2p

     module subroutine stdlib_zgeqr2p( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeqr2p

     module subroutine stdlib_wgeqr2p( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeqr2p


end interface 


interface 
     pure module subroutine stdlib_sgeqp3( m, n, a, lda, jpvt, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           integer(ilp), intent(inout) :: jpvt(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeqp3

     pure module subroutine stdlib_dgeqp3( m, n, a, lda, jpvt, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           integer(ilp), intent(inout) :: jpvt(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeqp3

     pure module subroutine stdlib_qgeqp3( m, n, a, lda, jpvt, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           integer(ilp), intent(inout) :: jpvt(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeqp3


     pure module subroutine stdlib_cgeqp3( m, n, a, lda, jpvt, tau, work, lwork, rwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           integer(ilp), intent(inout) :: jpvt(*)
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeqp3

     pure module subroutine stdlib_zgeqp3( m, n, a, lda, jpvt, tau, work, lwork, rwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           integer(ilp), intent(inout) :: jpvt(*)
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeqp3

     pure module subroutine stdlib_wgeqp3( m, n, a, lda, jpvt, tau, work, lwork, rwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           integer(ilp), intent(inout) :: jpvt(*)
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeqp3


end interface 


interface 
     pure module subroutine stdlib_slaqp2( m, n, offset, a, lda, jpvt, tau, vn1, vn2,work )
           integer(ilp), intent(in) :: lda, m, n, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(sp), intent(inout) :: a(lda,*), vn1(*), vn2(*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_slaqp2

     pure module subroutine stdlib_dlaqp2( m, n, offset, a, lda, jpvt, tau, vn1, vn2,work )
           integer(ilp), intent(in) :: lda, m, n, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(dp), intent(inout) :: a(lda,*), vn1(*), vn2(*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dlaqp2

     pure module subroutine stdlib_qlaqp2( m, n, offset, a, lda, jpvt, tau, vn1, vn2,work )
           integer(ilp), intent(in) :: lda, m, n, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(qp), intent(inout) :: a(lda,*), vn1(*), vn2(*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qlaqp2


     pure module subroutine stdlib_claqp2( m, n, offset, a, lda, jpvt, tau, vn1, vn2,work )
           integer(ilp), intent(in) :: lda, m, n, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(sp), intent(inout) :: vn1(*), vn2(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_claqp2

     pure module subroutine stdlib_zlaqp2( m, n, offset, a, lda, jpvt, tau, vn1, vn2,work )
           integer(ilp), intent(in) :: lda, m, n, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(dp), intent(inout) :: vn1(*), vn2(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zlaqp2

     pure module subroutine stdlib_wlaqp2( m, n, offset, a, lda, jpvt, tau, vn1, vn2,work )
           integer(ilp), intent(in) :: lda, m, n, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(qp), intent(inout) :: vn1(*), vn2(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wlaqp2


end interface 


interface 
     pure module subroutine stdlib_slaqps( m, n, offset, nb, kb, a, lda, jpvt, tau, vn1,vn2, auxv, f, &
               ldf )
           integer(ilp), intent(out) :: kb
           integer(ilp), intent(in) :: lda, ldf, m, n, nb, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(sp), intent(inout) :: a(lda,*), auxv(*), f(ldf,*), vn1(*), vn2(*)
           real(sp), intent(out) :: tau(*)
     end subroutine stdlib_slaqps

     pure module subroutine stdlib_dlaqps( m, n, offset, nb, kb, a, lda, jpvt, tau, vn1,vn2, auxv, f, &
               ldf )
           integer(ilp), intent(out) :: kb
           integer(ilp), intent(in) :: lda, ldf, m, n, nb, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(dp), intent(inout) :: a(lda,*), auxv(*), f(ldf,*), vn1(*), vn2(*)
           real(dp), intent(out) :: tau(*)
     end subroutine stdlib_dlaqps

     pure module subroutine stdlib_qlaqps( m, n, offset, nb, kb, a, lda, jpvt, tau, vn1,vn2, auxv, f, &
               ldf )
           integer(ilp), intent(out) :: kb
           integer(ilp), intent(in) :: lda, ldf, m, n, nb, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(qp), intent(inout) :: a(lda,*), auxv(*), f(ldf,*), vn1(*), vn2(*)
           real(qp), intent(out) :: tau(*)
     end subroutine stdlib_qlaqps


     pure module subroutine stdlib_claqps( m, n, offset, nb, kb, a, lda, jpvt, tau, vn1,vn2, auxv, f, &
               ldf )
           integer(ilp), intent(out) :: kb
           integer(ilp), intent(in) :: lda, ldf, m, n, nb, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(sp), intent(inout) :: vn1(*), vn2(*)
           complex(sp), intent(inout) :: a(lda,*), auxv(*), f(ldf,*)
           complex(sp), intent(out) :: tau(*)
     end subroutine stdlib_claqps

     pure module subroutine stdlib_zlaqps( m, n, offset, nb, kb, a, lda, jpvt, tau, vn1,vn2, auxv, f, &
               ldf )
           integer(ilp), intent(out) :: kb
           integer(ilp), intent(in) :: lda, ldf, m, n, nb, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(dp), intent(inout) :: vn1(*), vn2(*)
           complex(dp), intent(inout) :: a(lda,*), auxv(*), f(ldf,*)
           complex(dp), intent(out) :: tau(*)
     end subroutine stdlib_zlaqps

     pure module subroutine stdlib_wlaqps( m, n, offset, nb, kb, a, lda, jpvt, tau, vn1,vn2, auxv, f, &
               ldf )
           integer(ilp), intent(out) :: kb
           integer(ilp), intent(in) :: lda, ldf, m, n, nb, offset
           integer(ilp), intent(inout) :: jpvt(*)
           real(qp), intent(inout) :: vn1(*), vn2(*)
           complex(qp), intent(inout) :: a(lda,*), auxv(*), f(ldf,*)
           complex(qp), intent(out) :: tau(*)
     end subroutine stdlib_wlaqps


end interface 


interface 
     pure module subroutine stdlib_slatsqr( m, n, mb, nb, a, lda, t, ldt, work,lwork, info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, ldt, lwork
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_slatsqr

     pure module subroutine stdlib_dlatsqr( m, n, mb, nb, a, lda, t, ldt, work,lwork, info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, ldt, lwork
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_dlatsqr

     pure module subroutine stdlib_qlatsqr( m, n, mb, nb, a, lda, t, ldt, work,lwork, info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, ldt, lwork
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_qlatsqr


     pure module subroutine stdlib_clatsqr( m, n, mb, nb, a, lda, t, ldt, work,lwork, info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, ldt, lwork
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_clatsqr

     pure module subroutine stdlib_zlatsqr( m, n, mb, nb, a, lda, t, ldt, work,lwork, info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, ldt, lwork
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_zlatsqr

     pure module subroutine stdlib_wlatsqr( m, n, mb, nb, a, lda, t, ldt, work,lwork, info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, ldt, lwork
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_wlatsqr


end interface 


interface 
     pure module subroutine stdlib_cungtsqr( m, n, mb, nb, a, lda, t, ldt, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: t(ldt,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungtsqr

     pure module subroutine stdlib_zungtsqr( m, n, mb, nb, a, lda, t, ldt, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: t(ldt,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungtsqr

     pure module subroutine stdlib_wungtsqr( m, n, mb, nb, a, lda, t, ldt, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: t(ldt,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungtsqr


end interface 


interface 
     pure module subroutine stdlib_cungtsqr_row( m, n, mb, nb, a, lda, t, ldt, work,lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: t(ldt,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungtsqr_row

     pure module subroutine stdlib_zungtsqr_row( m, n, mb, nb, a, lda, t, ldt, work,lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: t(ldt,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungtsqr_row

     pure module subroutine stdlib_wungtsqr_row( m, n, mb, nb, a, lda, t, ldt, work,lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: t(ldt,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungtsqr_row


end interface 


interface 
     pure module subroutine stdlib_sorgtsqr( m, n, mb, nb, a, lda, t, ldt, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: t(ldt,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgtsqr

     pure module subroutine stdlib_dorgtsqr( m, n, mb, nb, a, lda, t, ldt, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: t(ldt,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgtsqr

     pure module subroutine stdlib_qorgtsqr( m, n, mb, nb, a, lda, t, ldt, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: t(ldt,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgtsqr


end interface 


interface 
     pure module subroutine stdlib_sorgtsqr_row( m, n, mb, nb, a, lda, t, ldt, work,lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: t(ldt,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgtsqr_row

     pure module subroutine stdlib_dorgtsqr_row( m, n, mb, nb, a, lda, t, ldt, work,lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: t(ldt,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgtsqr_row

     pure module subroutine stdlib_qorgtsqr_row( m, n, mb, nb, a, lda, t, ldt, work,lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, mb, nb
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: t(ldt,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgtsqr_row


end interface 


interface 
     pure module subroutine stdlib_slarfb_gett( ident, m, n, k, t, ldt, a, lda, b, ldb,work, ldwork )
               
           character, intent(in) :: ident
           integer(ilp), intent(in) :: k, lda, ldb, ldt, ldwork, m, n
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(in) :: t(ldt,*)
           real(sp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_slarfb_gett

     pure module subroutine stdlib_dlarfb_gett( ident, m, n, k, t, ldt, a, lda, b, ldb,work, ldwork )
               
           character, intent(in) :: ident
           integer(ilp), intent(in) :: k, lda, ldb, ldt, ldwork, m, n
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(in) :: t(ldt,*)
           real(dp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_dlarfb_gett

     pure module subroutine stdlib_qlarfb_gett( ident, m, n, k, t, ldt, a, lda, b, ldb,work, ldwork )
               
           character, intent(in) :: ident
           integer(ilp), intent(in) :: k, lda, ldb, ldt, ldwork, m, n
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(in) :: t(ldt,*)
           real(qp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_qlarfb_gett


     pure module subroutine stdlib_clarfb_gett( ident, m, n, k, t, ldt, a, lda, b, ldb,work, ldwork )
               
           character, intent(in) :: ident
           integer(ilp), intent(in) :: k, lda, ldb, ldt, ldwork, m, n
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(in) :: t(ldt,*)
           complex(sp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_clarfb_gett

     pure module subroutine stdlib_zlarfb_gett( ident, m, n, k, t, ldt, a, lda, b, ldb,work, ldwork )
               
           character, intent(in) :: ident
           integer(ilp), intent(in) :: k, lda, ldb, ldt, ldwork, m, n
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(in) :: t(ldt,*)
           complex(dp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_zlarfb_gett

     pure module subroutine stdlib_wlarfb_gett( ident, m, n, k, t, ldt, a, lda, b, ldb,work, ldwork )
               
           character, intent(in) :: ident
           integer(ilp), intent(in) :: k, lda, ldb, ldt, ldwork, m, n
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(in) :: t(ldt,*)
           complex(qp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_wlarfb_gett


end interface 


interface 
     pure module subroutine stdlib_slamtsqr( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           real(sp), intent(in) :: a(lda,*), t(ldt,*)
           real(sp), intent(out) :: work(*)
           real(sp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_slamtsqr

     pure module subroutine stdlib_dlamtsqr( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           real(dp), intent(in) :: a(lda,*), t(ldt,*)
           real(dp), intent(out) :: work(*)
           real(dp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_dlamtsqr

     pure module subroutine stdlib_qlamtsqr( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           real(qp), intent(in) :: a(lda,*), t(ldt,*)
           real(qp), intent(out) :: work(*)
           real(qp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_qlamtsqr


     pure module subroutine stdlib_clamtsqr( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           complex(sp), intent(in) :: a(lda,*), t(ldt,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_clamtsqr

     pure module subroutine stdlib_zlamtsqr( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           complex(dp), intent(in) :: a(lda,*), t(ldt,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_zlamtsqr

     pure module subroutine stdlib_wlamtsqr( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           complex(qp), intent(in) :: a(lda,*), t(ldt,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_wlamtsqr


end interface 


interface 
     pure module subroutine stdlib_sgetsqrhrt( m, n, mb1, nb1, nb2, a, lda, t, ldt, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, nb1, nb2, mb1
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_sgetsqrhrt

     pure module subroutine stdlib_dgetsqrhrt( m, n, mb1, nb1, nb2, a, lda, t, ldt, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, nb1, nb2, mb1
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_dgetsqrhrt

     pure module subroutine stdlib_qgetsqrhrt( m, n, mb1, nb1, nb2, a, lda, t, ldt, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, nb1, nb2, mb1
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_qgetsqrhrt


     pure module subroutine stdlib_cgetsqrhrt( m, n, mb1, nb1, nb2, a, lda, t, ldt, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, nb1, nb2, mb1
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_cgetsqrhrt

     pure module subroutine stdlib_zgetsqrhrt( m, n, mb1, nb1, nb2, a, lda, t, ldt, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, nb1, nb2, mb1
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_zgetsqrhrt

     pure module subroutine stdlib_wgetsqrhrt( m, n, mb1, nb1, nb2, a, lda, t, ldt, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, lwork, m, n, nb1, nb2, mb1
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_wgetsqrhrt


end interface 


interface 
     pure module subroutine stdlib_cunhr_col( m, n, nb, a, lda, t, ldt, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: d(*), t(ldt,*)
     end subroutine stdlib_cunhr_col

     pure module subroutine stdlib_zunhr_col( m, n, nb, a, lda, t, ldt, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: d(*), t(ldt,*)
     end subroutine stdlib_zunhr_col

     pure module subroutine stdlib_wunhr_col( m, n, nb, a, lda, t, ldt, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: d(*), t(ldt,*)
     end subroutine stdlib_wunhr_col


end interface 


interface 
     pure module subroutine stdlib_sorhr_col( m, n, nb, a, lda, t, ldt, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: d(*), t(ldt,*)
     end subroutine stdlib_sorhr_col

     pure module subroutine stdlib_dorhr_col( m, n, nb, a, lda, t, ldt, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: d(*), t(ldt,*)
     end subroutine stdlib_dorhr_col

     pure module subroutine stdlib_qorhr_col( m, n, nb, a, lda, t, ldt, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, nb
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: d(*), t(ldt,*)
     end subroutine stdlib_qorhr_col


end interface 


interface 
     pure module subroutine stdlib_claunhr_col_getrfnp( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: d(*)
     end subroutine stdlib_claunhr_col_getrfnp

     pure module subroutine stdlib_zlaunhr_col_getrfnp( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: d(*)
     end subroutine stdlib_zlaunhr_col_getrfnp

     pure module subroutine stdlib_wlaunhr_col_getrfnp( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: d(*)
     end subroutine stdlib_wlaunhr_col_getrfnp


end interface 


interface 
     pure module subroutine stdlib_slaorhr_col_getrfnp( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: d(*)
     end subroutine stdlib_slaorhr_col_getrfnp

     pure module subroutine stdlib_dlaorhr_col_getrfnp( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: d(*)
     end subroutine stdlib_dlaorhr_col_getrfnp

     pure module subroutine stdlib_qlaorhr_col_getrfnp( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: d(*)
     end subroutine stdlib_qlaorhr_col_getrfnp


end interface 


interface 
     pure recursive module subroutine stdlib_claunhr_col_getrfnp2( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: d(*)
     end subroutine stdlib_claunhr_col_getrfnp2

     pure recursive module subroutine stdlib_zlaunhr_col_getrfnp2( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: d(*)
     end subroutine stdlib_zlaunhr_col_getrfnp2

     pure recursive module subroutine stdlib_wlaunhr_col_getrfnp2( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: d(*)
     end subroutine stdlib_wlaunhr_col_getrfnp2


end interface 


interface 
     pure recursive module subroutine stdlib_slaorhr_col_getrfnp2( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: d(*)
     end subroutine stdlib_slaorhr_col_getrfnp2

     pure recursive module subroutine stdlib_dlaorhr_col_getrfnp2( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: d(*)
     end subroutine stdlib_dlaorhr_col_getrfnp2

     pure recursive module subroutine stdlib_qlaorhr_col_getrfnp2( m, n, a, lda, d, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: d(*)
     end subroutine stdlib_qlaorhr_col_getrfnp2


end interface 


interface 
     pure module subroutine stdlib_stpqrt( m, n, l, nb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, nb
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_stpqrt

     pure module subroutine stdlib_dtpqrt( m, n, l, nb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, nb
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_dtpqrt

     pure module subroutine stdlib_qtpqrt( m, n, l, nb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, nb
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_qtpqrt


     pure module subroutine stdlib_ctpqrt( m, n, l, nb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, nb
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_ctpqrt

     pure module subroutine stdlib_ztpqrt( m, n, l, nb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, nb
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_ztpqrt

     pure module subroutine stdlib_wtpqrt( m, n, l, nb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, nb
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_wtpqrt


end interface 


interface 
     pure module subroutine stdlib_stpqrt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_stpqrt2

     pure module subroutine stdlib_dtpqrt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_dtpqrt2

     pure module subroutine stdlib_qtpqrt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_qtpqrt2


     pure module subroutine stdlib_ctpqrt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_ctpqrt2

     pure module subroutine stdlib_ztpqrt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_ztpqrt2

     pure module subroutine stdlib_wtpqrt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_wtpqrt2


end interface 


interface 
     pure module subroutine stdlib_stpmqrt( side, trans, m, n, k, l, nb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, nb, ldt
           real(sp), intent(in) :: v(ldv,*), t(ldt,*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_stpmqrt

     pure module subroutine stdlib_dtpmqrt( side, trans, m, n, k, l, nb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, nb, ldt
           real(dp), intent(in) :: v(ldv,*), t(ldt,*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dtpmqrt

     pure module subroutine stdlib_qtpmqrt( side, trans, m, n, k, l, nb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, nb, ldt
           real(qp), intent(in) :: v(ldv,*), t(ldt,*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qtpmqrt


     pure module subroutine stdlib_ctpmqrt( side, trans, m, n, k, l, nb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, nb, ldt
           complex(sp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctpmqrt

     pure module subroutine stdlib_ztpmqrt( side, trans, m, n, k, l, nb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, nb, ldt
           complex(dp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztpmqrt

     pure module subroutine stdlib_wtpmqrt( side, trans, m, n, k, l, nb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, nb, ldt
           complex(qp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtpmqrt


end interface 


interface 
     pure module subroutine stdlib_stprfb( side, trans, direct, storev, m, n, k, l,v, ldv, t, ldt, a, &
               lda, b, ldb, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, lda, ldb, ldt, ldv, ldwork, m, n
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(in) :: t(ldt,*), v(ldv,*)
           real(sp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_stprfb

     pure module subroutine stdlib_dtprfb( side, trans, direct, storev, m, n, k, l,v, ldv, t, ldt, a, &
               lda, b, ldb, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, lda, ldb, ldt, ldv, ldwork, m, n
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(in) :: t(ldt,*), v(ldv,*)
           real(dp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_dtprfb

     pure module subroutine stdlib_qtprfb( side, trans, direct, storev, m, n, k, l,v, ldv, t, ldt, a, &
               lda, b, ldb, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, lda, ldb, ldt, ldv, ldwork, m, n
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(in) :: t(ldt,*), v(ldv,*)
           real(qp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_qtprfb


     pure module subroutine stdlib_ctprfb( side, trans, direct, storev, m, n, k, l,v, ldv, t, ldt, a, &
               lda, b, ldb, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, lda, ldb, ldt, ldv, ldwork, m, n
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(in) :: t(ldt,*), v(ldv,*)
           complex(sp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_ctprfb

     pure module subroutine stdlib_ztprfb( side, trans, direct, storev, m, n, k, l,v, ldv, t, ldt, a, &
               lda, b, ldb, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, lda, ldb, ldt, ldv, ldwork, m, n
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(in) :: t(ldt,*), v(ldv,*)
           complex(dp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_ztprfb

     pure module subroutine stdlib_wtprfb( side, trans, direct, storev, m, n, k, l,v, ldv, t, ldt, a, &
               lda, b, ldb, work, ldwork )
           character, intent(in) :: direct, side, storev, trans
           integer(ilp), intent(in) :: k, l, lda, ldb, ldt, ldv, ldwork, m, n
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(in) :: t(ldt,*), v(ldv,*)
           complex(qp), intent(out) :: work(ldwork,*)
     end subroutine stdlib_wtprfb


end interface 


interface 
     pure module subroutine stdlib_sggqrf( n, m, p, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_sggqrf

     pure module subroutine stdlib_dggqrf( n, m, p, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_dggqrf

     pure module subroutine stdlib_qggqrf( n, m, p, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_qggqrf


     pure module subroutine stdlib_cggqrf( n, m, p, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_cggqrf

     pure module subroutine stdlib_zggqrf( n, m, p, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_zggqrf

     pure module subroutine stdlib_wggqrf( n, m, p, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_wggqrf


end interface 


interface 
     pure module subroutine stdlib_sgerqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgerqf

     pure module subroutine stdlib_dgerqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgerqf

     pure module subroutine stdlib_qgerqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgerqf


     pure module subroutine stdlib_cgerqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgerqf

     pure module subroutine stdlib_zgerqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgerqf

     pure module subroutine stdlib_wgerqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgerqf


end interface 


interface 
     pure module subroutine stdlib_sgerq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgerq2

     pure module subroutine stdlib_dgerq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgerq2

     pure module subroutine stdlib_qgerq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgerq2


     pure module subroutine stdlib_cgerq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgerq2

     pure module subroutine stdlib_zgerq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgerq2

     pure module subroutine stdlib_wgerq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgerq2


end interface 


interface 
     pure module subroutine stdlib_cungrq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungrq

     pure module subroutine stdlib_zungrq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungrq

     pure module subroutine stdlib_wungrq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungrq


end interface 


interface 
     pure module subroutine stdlib_cunmrq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmrq

     pure module subroutine stdlib_zunmrq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmrq

     pure module subroutine stdlib_wunmrq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmrq


end interface 


interface 
     pure module subroutine stdlib_cunmr2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmr2

     pure module subroutine stdlib_zunmr2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmr2

     pure module subroutine stdlib_wunmr2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmr2


end interface 


interface 
     pure module subroutine stdlib_cungr2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungr2

     pure module subroutine stdlib_zungr2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungr2

     pure module subroutine stdlib_wungr2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungr2


end interface 


interface 
     pure module subroutine stdlib_sorgrq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgrq

     pure module subroutine stdlib_dorgrq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgrq

     pure module subroutine stdlib_qorgrq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgrq


end interface 


interface 
     pure module subroutine stdlib_sormrq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormrq

     pure module subroutine stdlib_dormrq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormrq

     pure module subroutine stdlib_qormrq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormrq


end interface 


interface 
     pure module subroutine stdlib_sormr2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormr2

     pure module subroutine stdlib_dormr2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormr2

     pure module subroutine stdlib_qormr2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormr2


end interface 


interface 
     pure module subroutine stdlib_sorgr2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgr2

     pure module subroutine stdlib_dorgr2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgr2

     pure module subroutine stdlib_qorgr2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgr2


end interface 


interface 
     pure module subroutine stdlib_sggrqf( m, p, n, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_sggrqf

     pure module subroutine stdlib_dggrqf( m, p, n, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_dggrqf

     pure module subroutine stdlib_qggrqf( m, p, n, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_qggrqf


     pure module subroutine stdlib_cggrqf( m, p, n, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_cggrqf

     pure module subroutine stdlib_zggrqf( m, p, n, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_zggrqf

     pure module subroutine stdlib_wggrqf( m, p, n, a, lda, taua, b, ldb, taub, work,lwork, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, m, n, p
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: taua(*), taub(*), work(*)
     end subroutine stdlib_wggrqf


end interface 


interface 
     pure module subroutine stdlib_sgelq( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(*), work(*)
     end subroutine stdlib_sgelq

     pure module subroutine stdlib_dgelq( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(*), work(*)
     end subroutine stdlib_dgelq

     pure module subroutine stdlib_qgelq( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(*), work(*)
     end subroutine stdlib_qgelq


     pure module subroutine stdlib_cgelq( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(*), work(*)
     end subroutine stdlib_cgelq

     pure module subroutine stdlib_zgelq( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(*), work(*)
     end subroutine stdlib_zgelq

     pure module subroutine stdlib_wgelq( m, n, a, lda, t, tsize, work, lwork,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, tsize, lwork
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(*), work(*)
     end subroutine stdlib_wgelq


end interface 


interface 
     pure module subroutine stdlib_sgemlq( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           real(sp), intent(in) :: a(lda,*), t(*)
           real(sp), intent(inout) :: c(ldc,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgemlq

     pure module subroutine stdlib_dgemlq( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           real(dp), intent(in) :: a(lda,*), t(*)
           real(dp), intent(inout) :: c(ldc,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgemlq

     pure module subroutine stdlib_qgemlq( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           real(qp), intent(in) :: a(lda,*), t(*)
           real(qp), intent(inout) :: c(ldc,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgemlq


     pure module subroutine stdlib_cgemlq( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           complex(sp), intent(in) :: a(lda,*), t(*)
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgemlq

     pure module subroutine stdlib_zgemlq( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           complex(dp), intent(in) :: a(lda,*), t(*)
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgemlq

     pure module subroutine stdlib_wgemlq( side, trans, m, n, k, a, lda, t, tsize,c, ldc, work, lwork, &
               info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, tsize, lwork, ldc
           complex(qp), intent(in) :: a(lda,*), t(*)
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgemlq


end interface 


interface 
     pure module subroutine stdlib_sgelqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgelqf

     pure module subroutine stdlib_dgelqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgelqf

     pure module subroutine stdlib_qgelqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgelqf


     pure module subroutine stdlib_cgelqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgelqf

     pure module subroutine stdlib_zgelqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgelqf

     pure module subroutine stdlib_wgelqf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgelqf


end interface 


interface 
     pure module subroutine stdlib_sgelq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgelq2

     pure module subroutine stdlib_dgelq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgelq2

     pure module subroutine stdlib_qgelq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgelq2


     pure module subroutine stdlib_cgelq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgelq2

     pure module subroutine stdlib_zgelq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgelq2

     pure module subroutine stdlib_wgelq2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgelq2


end interface 


interface 
     pure module subroutine stdlib_cunglq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunglq

     pure module subroutine stdlib_zunglq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunglq

     pure module subroutine stdlib_wunglq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunglq


end interface 


interface 
     pure module subroutine stdlib_cungl2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungl2

     pure module subroutine stdlib_zungl2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungl2

     pure module subroutine stdlib_wungl2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungl2


end interface 


interface 
     pure module subroutine stdlib_cunmlq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmlq

     pure module subroutine stdlib_zunmlq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmlq

     pure module subroutine stdlib_wunmlq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmlq


end interface 


interface 
     pure module subroutine stdlib_cunml2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunml2

     pure module subroutine stdlib_zunml2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunml2

     pure module subroutine stdlib_wunml2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunml2


end interface 


interface 
     pure module subroutine stdlib_sorglq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorglq

     pure module subroutine stdlib_dorglq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorglq

     pure module subroutine stdlib_qorglq( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorglq


end interface 


interface 
     pure module subroutine stdlib_sorgl2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgl2

     pure module subroutine stdlib_dorgl2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgl2

     pure module subroutine stdlib_qorgl2( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgl2


end interface 


interface 
     pure module subroutine stdlib_sormlq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormlq

     pure module subroutine stdlib_dormlq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormlq

     pure module subroutine stdlib_qormlq( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormlq


end interface 


interface 
     pure module subroutine stdlib_sorml2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorml2

     pure module subroutine stdlib_dorml2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorml2

     pure module subroutine stdlib_qorml2( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorml2


end interface 


interface 
     pure module subroutine stdlib_sgelqt( m, n, mb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, mb
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_sgelqt

     pure module subroutine stdlib_dgelqt( m, n, mb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, mb
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_dgelqt

     pure module subroutine stdlib_qgelqt( m, n, mb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, mb
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_qgelqt


     pure module subroutine stdlib_cgelqt( m, n, mb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, mb
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_cgelqt

     pure module subroutine stdlib_zgelqt( m, n, mb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, mb
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_zgelqt

     pure module subroutine stdlib_wgelqt( m, n, mb, a, lda, t, ldt, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldt, m, n, mb
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_wgelqt


end interface 


interface 
     pure recursive module subroutine stdlib_sgelqt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_sgelqt3

     pure recursive module subroutine stdlib_dgelqt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_dgelqt3

     pure recursive module subroutine stdlib_qgelqt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_qgelqt3


     pure recursive module subroutine stdlib_cgelqt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_cgelqt3

     pure recursive module subroutine stdlib_zgelqt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_zgelqt3

     pure recursive module subroutine stdlib_wgelqt3( m, n, a, lda, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, ldt
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_wgelqt3


end interface 


interface 
     pure module subroutine stdlib_sgemlqt( side, trans, m, n, k, mb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, mb, ldt
           real(sp), intent(in) :: v(ldv,*), t(ldt,*)
           real(sp), intent(inout) :: c(ldc,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgemlqt

     pure module subroutine stdlib_dgemlqt( side, trans, m, n, k, mb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, mb, ldt
           real(dp), intent(in) :: v(ldv,*), t(ldt,*)
           real(dp), intent(inout) :: c(ldc,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgemlqt

     pure module subroutine stdlib_qgemlqt( side, trans, m, n, k, mb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, mb, ldt
           real(qp), intent(in) :: v(ldv,*), t(ldt,*)
           real(qp), intent(inout) :: c(ldc,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgemlqt


     pure module subroutine stdlib_cgemlqt( side, trans, m, n, k, mb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, mb, ldt
           complex(sp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgemlqt

     pure module subroutine stdlib_zgemlqt( side, trans, m, n, k, mb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, mb, ldt
           complex(dp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgemlqt

     pure module subroutine stdlib_wgemlqt( side, trans, m, n, k, mb, v, ldv, t, ldt,c, ldc, work, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, ldc, m, n, mb, ldt
           complex(qp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgemlqt


end interface 


interface 
     pure module subroutine stdlib_slaswlq( m, n, mb, nb, a, lda, t, ldt, work, lwork,info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, lwork, ldt
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_slaswlq

     pure module subroutine stdlib_dlaswlq( m, n, mb, nb, a, lda, t, ldt, work, lwork,info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, lwork, ldt
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_dlaswlq

     pure module subroutine stdlib_qlaswlq( m, n, mb, nb, a, lda, t, ldt, work, lwork,info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, lwork, ldt
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_qlaswlq


     pure module subroutine stdlib_claswlq( m, n, mb, nb, a, lda, t, ldt, work, lwork,info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, lwork, ldt
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_claswlq

     pure module subroutine stdlib_zlaswlq( m, n, mb, nb, a, lda, t, ldt, work, lwork,info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, lwork, ldt
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_zlaswlq

     pure module subroutine stdlib_wlaswlq( m, n, mb, nb, a, lda, t, ldt, work, lwork,info)
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, mb, nb, lwork, ldt
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*), t(ldt,*)
     end subroutine stdlib_wlaswlq


end interface 


interface 
     pure module subroutine stdlib_slamswlq( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           real(sp), intent(in) :: a(lda,*), t(ldt,*)
           real(sp), intent(out) :: work(*)
           real(sp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_slamswlq

     pure module subroutine stdlib_dlamswlq( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           real(dp), intent(in) :: a(lda,*), t(ldt,*)
           real(dp), intent(out) :: work(*)
           real(dp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_dlamswlq

     pure module subroutine stdlib_qlamswlq( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           real(qp), intent(in) :: a(lda,*), t(ldt,*)
           real(qp), intent(out) :: work(*)
           real(qp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_qlamswlq


     pure module subroutine stdlib_clamswlq( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           complex(sp), intent(in) :: a(lda,*), t(ldt,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_clamswlq

     pure module subroutine stdlib_zlamswlq( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           complex(dp), intent(in) :: a(lda,*), t(ldt,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_zlamswlq

     pure module subroutine stdlib_wlamswlq( side, trans, m, n, k, mb, nb, a, lda, t,ldt, c, ldc, work, &
               lwork, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n, k, mb, nb, ldt, lwork, ldc
           complex(qp), intent(in) :: a(lda,*), t(ldt,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: c(ldc,*)
     end subroutine stdlib_wlamswlq


end interface 


interface 
     pure module subroutine stdlib_stplqt( m, n, l, mb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, mb
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_stplqt

     pure module subroutine stdlib_dtplqt( m, n, l, mb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, mb
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_dtplqt

     pure module subroutine stdlib_qtplqt( m, n, l, mb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, mb
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_qtplqt


     pure module subroutine stdlib_ctplqt( m, n, l, mb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, mb
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_ctplqt

     pure module subroutine stdlib_ztplqt( m, n, l, mb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, mb
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_ztplqt

     pure module subroutine stdlib_wtplqt( m, n, l, mb, a, lda, b, ldb, t, ldt, work,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l, mb
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: t(ldt,*), work(*)
     end subroutine stdlib_wtplqt


end interface 


interface 
     pure module subroutine stdlib_stplqt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_stplqt2

     pure module subroutine stdlib_dtplqt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_dtplqt2

     pure module subroutine stdlib_qtplqt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_qtplqt2


     pure module subroutine stdlib_ctplqt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: t(ldt,*)
     end subroutine stdlib_ctplqt2

     pure module subroutine stdlib_ztplqt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: t(ldt,*)
     end subroutine stdlib_ztplqt2

     pure module subroutine stdlib_wtplqt2( m, n, l, a, lda, b, ldb, t, ldt, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldt, n, m, l
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: t(ldt,*)
     end subroutine stdlib_wtplqt2


end interface 


interface 
     pure module subroutine stdlib_stpmlqt( side, trans, m, n, k, l, mb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, mb, ldt
           real(sp), intent(in) :: v(ldv,*), t(ldt,*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_stpmlqt

     pure module subroutine stdlib_dtpmlqt( side, trans, m, n, k, l, mb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, mb, ldt
           real(dp), intent(in) :: v(ldv,*), t(ldt,*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dtpmlqt

     pure module subroutine stdlib_qtpmlqt( side, trans, m, n, k, l, mb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, mb, ldt
           real(qp), intent(in) :: v(ldv,*), t(ldt,*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qtpmlqt


     pure module subroutine stdlib_ctpmlqt( side, trans, m, n, k, l, mb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, mb, ldt
           complex(sp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctpmlqt

     pure module subroutine stdlib_ztpmlqt( side, trans, m, n, k, l, mb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, mb, ldt
           complex(dp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztpmlqt

     pure module subroutine stdlib_wtpmlqt( side, trans, m, n, k, l, mb, v, ldv, t, ldt,a, lda, b, ldb, &
               work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, ldv, lda, ldb, m, n, l, mb, ldt
           complex(qp), intent(in) :: v(ldv,*), t(ldt,*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtpmlqt


end interface 


interface 
     pure module subroutine stdlib_sgeqlf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeqlf

     pure module subroutine stdlib_dgeqlf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeqlf

     pure module subroutine stdlib_qgeqlf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeqlf


     pure module subroutine stdlib_cgeqlf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeqlf

     pure module subroutine stdlib_zgeqlf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeqlf

     pure module subroutine stdlib_wgeqlf( m, n, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeqlf


end interface 


interface 
     pure module subroutine stdlib_sgeql2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_sgeql2

     pure module subroutine stdlib_dgeql2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_dgeql2

     pure module subroutine stdlib_qgeql2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_qgeql2


     pure module subroutine stdlib_cgeql2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_cgeql2

     pure module subroutine stdlib_zgeql2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_zgeql2

     pure module subroutine stdlib_wgeql2( m, n, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: tau(*), work(*)
     end subroutine stdlib_wgeql2


end interface 


interface 
     pure module subroutine stdlib_cungql( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cungql

     pure module subroutine stdlib_zungql( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zungql

     pure module subroutine stdlib_wungql( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wungql


end interface 


interface 
     pure module subroutine stdlib_cunmql( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunmql

     pure module subroutine stdlib_zunmql( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunmql

     pure module subroutine stdlib_wunmql( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunmql


end interface 


interface 
     pure module subroutine stdlib_cung2l( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cung2l

     pure module subroutine stdlib_zung2l( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zung2l

     pure module subroutine stdlib_wung2l( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wung2l


end interface 


interface 
     pure module subroutine stdlib_cunm2l( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(sp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(sp), intent(in) :: tau(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunm2l

     pure module subroutine stdlib_zunm2l( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(dp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(dp), intent(in) :: tau(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunm2l

     pure module subroutine stdlib_wunm2l( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           complex(qp), intent(inout) :: a(lda,*), c(ldc,*)
           complex(qp), intent(in) :: tau(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunm2l


end interface 


interface 
     pure module subroutine stdlib_sorgql( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorgql

     pure module subroutine stdlib_dorgql( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorgql

     pure module subroutine stdlib_qorgql( m, n, k, a, lda, tau, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, lwork, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorgql


end interface 


interface 
     pure module subroutine stdlib_sormql( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sormql

     pure module subroutine stdlib_dormql( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dormql

     pure module subroutine stdlib_qormql( side, trans, m, n, k, a, lda, tau, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, lwork, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qormql


end interface 


interface 
     pure module subroutine stdlib_sorg2l( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorg2l

     pure module subroutine stdlib_dorg2l( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorg2l

     pure module subroutine stdlib_qorg2l( m, n, k, a, lda, tau, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, m, n
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorg2l


end interface 


interface 
     pure module subroutine stdlib_sorm2l( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(sp), intent(inout) :: a(lda,*), c(ldc,*)
           real(sp), intent(in) :: tau(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sorm2l

     pure module subroutine stdlib_dorm2l( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(dp), intent(inout) :: a(lda,*), c(ldc,*)
           real(dp), intent(in) :: tau(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dorm2l

     pure module subroutine stdlib_qorm2l( side, trans, m, n, k, a, lda, tau, c, ldc,work, info )
           character, intent(in) :: side, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: k, lda, ldc, m, n
           real(qp), intent(inout) :: a(lda,*), c(ldc,*)
           real(qp), intent(in) :: tau(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qorm2l


end interface 


interface 
     pure module subroutine stdlib_cunm22( side, trans, m, n, n1, n2, q, ldq, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(in) :: m, n, n1, n2, ldq, ldc, lwork
           integer(ilp), intent(out) :: info
           complex(sp), intent(in) :: q(ldq,*)
           complex(sp), intent(inout) :: c(ldc,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cunm22

     pure module subroutine stdlib_zunm22( side, trans, m, n, n1, n2, q, ldq, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(in) :: m, n, n1, n2, ldq, ldc, lwork
           integer(ilp), intent(out) :: info
           complex(dp), intent(in) :: q(ldq,*)
           complex(dp), intent(inout) :: c(ldc,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zunm22

     pure module subroutine stdlib_wunm22( side, trans, m, n, n1, n2, q, ldq, c, ldc,work, lwork, info )
               
           character, intent(in) :: side, trans
           integer(ilp), intent(in) :: m, n, n1, n2, ldq, ldc, lwork
           integer(ilp), intent(out) :: info
           complex(qp), intent(in) :: q(ldq,*)
           complex(qp), intent(inout) :: c(ldc,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wunm22


end interface 

end module stdlib_lapack_orthogonal_factors
