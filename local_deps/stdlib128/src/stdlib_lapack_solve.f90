module stdlib_lapack_solve
  use stdlib_linalg_constants
  use stdlib_linalg_lapack_aux
  use stdlib_linalg_blas
  use stdlib_lapack_base
  implicit none

interface 
     pure module subroutine stdlib_slacn2( n, v, x, isgn, est, kase, isave )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: est
           integer(ilp), intent(out) :: isgn(*)
           integer(ilp), intent(inout) :: isave(3_ilp)
           real(sp), intent(out) :: v(*)
           real(sp), intent(inout) :: x(*)
     end subroutine stdlib_slacn2

     pure module subroutine stdlib_dlacn2( n, v, x, isgn, est, kase, isave )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: est
           integer(ilp), intent(out) :: isgn(*)
           integer(ilp), intent(inout) :: isave(3_ilp)
           real(dp), intent(out) :: v(*)
           real(dp), intent(inout) :: x(*)
     end subroutine stdlib_dlacn2

     pure module subroutine stdlib_qlacn2( n, v, x, isgn, est, kase, isave )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: est
           integer(ilp), intent(out) :: isgn(*)
           integer(ilp), intent(inout) :: isave(3_ilp)
           real(qp), intent(out) :: v(*)
           real(qp), intent(inout) :: x(*)
     end subroutine stdlib_qlacn2


     pure module subroutine stdlib_clacn2( n, v, x, est, kase, isave )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: est
           integer(ilp), intent(inout) :: isave(3_ilp)
           complex(sp), intent(out) :: v(*)
           complex(sp), intent(inout) :: x(*)
     end subroutine stdlib_clacn2

     pure module subroutine stdlib_zlacn2( n, v, x, est, kase, isave )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: est
           integer(ilp), intent(inout) :: isave(3_ilp)
           complex(dp), intent(out) :: v(*)
           complex(dp), intent(inout) :: x(*)
     end subroutine stdlib_zlacn2

     pure module subroutine stdlib_wlacn2( n, v, x, est, kase, isave )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: est
           integer(ilp), intent(inout) :: isave(3_ilp)
           complex(qp), intent(out) :: v(*)
           complex(qp), intent(inout) :: x(*)
     end subroutine stdlib_wlacn2


end interface 


interface 
     module subroutine stdlib_slacon( n, v, x, isgn, est, kase )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: est
           integer(ilp), intent(out) :: isgn(*)
           real(sp), intent(out) :: v(*)
           real(sp), intent(inout) :: x(*)
     end subroutine stdlib_slacon

     module subroutine stdlib_dlacon( n, v, x, isgn, est, kase )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: est
           integer(ilp), intent(out) :: isgn(*)
           real(dp), intent(out) :: v(*)
           real(dp), intent(inout) :: x(*)
     end subroutine stdlib_dlacon

     module subroutine stdlib_qlacon( n, v, x, isgn, est, kase )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: est
           integer(ilp), intent(out) :: isgn(*)
           real(qp), intent(out) :: v(*)
           real(qp), intent(inout) :: x(*)
     end subroutine stdlib_qlacon


     module subroutine stdlib_clacon( n, v, x, est, kase )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: est
           complex(sp), intent(out) :: v(n)
           complex(sp), intent(inout) :: x(n)
     end subroutine stdlib_clacon

     module subroutine stdlib_zlacon( n, v, x, est, kase )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: est
           complex(dp), intent(out) :: v(n)
           complex(dp), intent(inout) :: x(n)
     end subroutine stdlib_zlacon

     module subroutine stdlib_wlacon( n, v, x, est, kase )
           integer(ilp), intent(inout) :: kase
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: est
           complex(qp), intent(out) :: v(n)
           complex(qp), intent(inout) :: x(n)
     end subroutine stdlib_wlacon


end interface 


interface 
     pure module subroutine stdlib_sla_lin_berr( n, nz, nrhs, res, ayb, berr )
           integer(ilp), intent(in) :: n, nz, nrhs
           real(sp), intent(in) :: ayb(n,nrhs)
           real(sp), intent(out) :: berr(nrhs)
           real(sp), intent(in) :: res(n,nrhs)
     end subroutine stdlib_sla_lin_berr

     pure module subroutine stdlib_dla_lin_berr ( n, nz, nrhs, res, ayb, berr )
           integer(ilp), intent(in) :: n, nz, nrhs
           real(dp), intent(in) :: ayb(n,nrhs)
           real(dp), intent(out) :: berr(nrhs)
           real(dp), intent(in) :: res(n,nrhs)
     end subroutine stdlib_dla_lin_berr

     pure module subroutine stdlib_qla_lin_berr ( n, nz, nrhs, res, ayb, berr )
           integer(ilp), intent(in) :: n, nz, nrhs
           real(qp), intent(in) :: ayb(n,nrhs)
           real(qp), intent(out) :: berr(nrhs)
           real(qp), intent(in) :: res(n,nrhs)
     end subroutine stdlib_qla_lin_berr


     pure module subroutine stdlib_cla_lin_berr( n, nz, nrhs, res, ayb, berr )
           integer(ilp), intent(in) :: n, nz, nrhs
           real(sp), intent(in) :: ayb(n,nrhs)
           real(sp), intent(out) :: berr(nrhs)
           complex(sp), intent(in) :: res(n,nrhs)
     end subroutine stdlib_cla_lin_berr

     pure module subroutine stdlib_zla_lin_berr( n, nz, nrhs, res, ayb, berr )
           integer(ilp), intent(in) :: n, nz, nrhs
           real(dp), intent(in) :: ayb(n,nrhs)
           real(dp), intent(out) :: berr(nrhs)
           complex(dp), intent(in) :: res(n,nrhs)
     end subroutine stdlib_zla_lin_berr

     pure module subroutine stdlib_wla_lin_berr( n, nz, nrhs, res, ayb, berr )
           integer(ilp), intent(in) :: n, nz, nrhs
           real(qp), intent(in) :: ayb(n,nrhs)
           real(qp), intent(out) :: berr(nrhs)
           complex(qp), intent(in) :: res(n,nrhs)
     end subroutine stdlib_wla_lin_berr


end interface 


interface 
     module subroutine stdlib_strcon( norm, uplo, diag, n, a, lda, rcond, work,iwork, info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_strcon

     module subroutine stdlib_dtrcon( norm, uplo, diag, n, a, lda, rcond, work,iwork, info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dtrcon

     module subroutine stdlib_qtrcon( norm, uplo, diag, n, a, lda, rcond, work,iwork, info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qtrcon


     module subroutine stdlib_ctrcon( norm, uplo, diag, n, a, lda, rcond, work,rwork, info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctrcon

     module subroutine stdlib_ztrcon( norm, uplo, diag, n, a, lda, rcond, work,rwork, info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztrcon

     module subroutine stdlib_wtrcon( norm, uplo, diag, n, a, lda, rcond, work,rwork, info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtrcon


end interface 


interface 
     pure module subroutine stdlib_strtrs( uplo, trans, diag, n, nrhs, a, lda, b, ldb,info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_strtrs

     pure module subroutine stdlib_dtrtrs( uplo, trans, diag, n, nrhs, a, lda, b, ldb,info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dtrtrs

     pure module subroutine stdlib_qtrtrs( uplo, trans, diag, n, nrhs, a, lda, b, ldb,info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qtrtrs


     pure module subroutine stdlib_ctrtrs( uplo, trans, diag, n, nrhs, a, lda, b, ldb,info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ctrtrs

     pure module subroutine stdlib_ztrtrs( uplo, trans, diag, n, nrhs, a, lda, b, ldb,info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ztrtrs

     pure module subroutine stdlib_wtrtrs( uplo, trans, diag, n, nrhs, a, lda, b, ldb,info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wtrtrs


end interface 


interface 
     pure module subroutine stdlib_slatrs( uplo, trans, diag, normin, n, a, lda, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: scale
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_slatrs

     pure module subroutine stdlib_dlatrs( uplo, trans, diag, normin, n, a, lda, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: scale
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_dlatrs

     pure module subroutine stdlib_qlatrs( uplo, trans, diag, normin, n, a, lda, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: scale
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_qlatrs


     pure module subroutine stdlib_clatrs( uplo, trans, diag, normin, n, a, lda, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: scale
           real(sp), intent(inout) :: cnorm(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: x(*)
     end subroutine stdlib_clatrs

     pure module subroutine stdlib_zlatrs( uplo, trans, diag, normin, n, a, lda, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: scale
           real(dp), intent(inout) :: cnorm(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: x(*)
     end subroutine stdlib_zlatrs

     pure module subroutine stdlib_wlatrs( uplo, trans, diag, normin, n, a, lda, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: scale
           real(qp), intent(inout) :: cnorm(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: x(*)
     end subroutine stdlib_wlatrs


end interface 


interface 
     pure module subroutine stdlib_strtri( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_strtri

     pure module subroutine stdlib_dtrtri( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dtrtri

     pure module subroutine stdlib_qtrtri( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qtrtri


     pure module subroutine stdlib_ctrtri( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_ctrtri

     pure module subroutine stdlib_ztrtri( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_ztrtri

     pure module subroutine stdlib_wtrtri( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wtrtri


end interface 


interface 
     pure module subroutine stdlib_strti2( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_strti2

     pure module subroutine stdlib_dtrti2( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dtrti2

     pure module subroutine stdlib_qtrti2( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qtrti2


     pure module subroutine stdlib_ctrti2( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_ctrti2

     pure module subroutine stdlib_ztrti2( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_ztrti2

     pure module subroutine stdlib_wtrti2( uplo, diag, n, a, lda, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wtrti2


end interface 


interface 
     pure module subroutine stdlib_strrfs( uplo, trans, diag, n, nrhs, a, lda, b, ldb, x,ldx, ferr, berr,&
                work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*), b(ldb,*), x(ldx,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_strrfs

     pure module subroutine stdlib_dtrrfs( uplo, trans, diag, n, nrhs, a, lda, b, ldb, x,ldx, ferr, berr,&
                work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*), b(ldb,*), x(ldx,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_dtrrfs

     pure module subroutine stdlib_qtrrfs( uplo, trans, diag, n, nrhs, a, lda, b, ldb, x,ldx, ferr, berr,&
                work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*), b(ldb,*), x(ldx,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_qtrrfs


     pure module subroutine stdlib_ctrrfs( uplo, trans, diag, n, nrhs, a, lda, b, ldb, x,ldx, ferr, berr,&
                work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), b(ldb,*), x(ldx,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctrrfs

     pure module subroutine stdlib_ztrrfs( uplo, trans, diag, n, nrhs, a, lda, b, ldb, x,ldx, ferr, berr,&
                work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), b(ldb,*), x(ldx,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztrrfs

     pure module subroutine stdlib_wtrrfs( uplo, trans, diag, n, nrhs, a, lda, b, ldb, x,ldx, ferr, berr,&
                work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), b(ldb,*), x(ldx,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtrrfs


end interface 


interface 
     pure module subroutine stdlib_slauum( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_slauum

     pure module subroutine stdlib_dlauum( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dlauum

     pure module subroutine stdlib_qlauum( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qlauum


     pure module subroutine stdlib_clauum( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_clauum

     pure module subroutine stdlib_zlauum( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zlauum

     pure module subroutine stdlib_wlauum( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wlauum


end interface 


interface 
     pure module subroutine stdlib_slauu2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_slauu2

     pure module subroutine stdlib_dlauu2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dlauu2

     pure module subroutine stdlib_qlauu2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qlauu2


     pure module subroutine stdlib_clauu2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_clauu2

     pure module subroutine stdlib_zlauu2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zlauu2

     pure module subroutine stdlib_wlauu2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wlauu2


end interface 


interface 
     module subroutine stdlib_stpcon( norm, uplo, diag, n, ap, rcond, work, iwork,info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ap(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_stpcon

     module subroutine stdlib_dtpcon( norm, uplo, diag, n, ap, rcond, work, iwork,info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ap(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dtpcon

     module subroutine stdlib_qtpcon( norm, uplo, diag, n, ap, rcond, work, iwork,info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ap(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qtpcon


     module subroutine stdlib_ctpcon( norm, uplo, diag, n, ap, rcond, work, rwork,info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctpcon

     module subroutine stdlib_ztpcon( norm, uplo, diag, n, ap, rcond, work, rwork,info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztpcon

     module subroutine stdlib_wtpcon( norm, uplo, diag, n, ap, rcond, work, rwork,info )
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtpcon


end interface 


interface 
     pure module subroutine stdlib_stptrs( uplo, trans, diag, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(in) :: ap(*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_stptrs

     pure module subroutine stdlib_dtptrs( uplo, trans, diag, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(in) :: ap(*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dtptrs

     pure module subroutine stdlib_qtptrs( uplo, trans, diag, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(in) :: ap(*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qtptrs


     pure module subroutine stdlib_ctptrs( uplo, trans, diag, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ctptrs

     pure module subroutine stdlib_ztptrs( uplo, trans, diag, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ztptrs

     pure module subroutine stdlib_wtptrs( uplo, trans, diag, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wtptrs


end interface 


interface 
     pure module subroutine stdlib_slatps( uplo, trans, diag, normin, n, ap, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(out) :: scale
           real(sp), intent(in) :: ap(*)
           real(sp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_slatps

     pure module subroutine stdlib_dlatps( uplo, trans, diag, normin, n, ap, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(out) :: scale
           real(dp), intent(in) :: ap(*)
           real(dp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_dlatps

     pure module subroutine stdlib_qlatps( uplo, trans, diag, normin, n, ap, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(out) :: scale
           real(qp), intent(in) :: ap(*)
           real(qp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_qlatps


     pure module subroutine stdlib_clatps( uplo, trans, diag, normin, n, ap, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(out) :: scale
           real(sp), intent(inout) :: cnorm(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(inout) :: x(*)
     end subroutine stdlib_clatps

     pure module subroutine stdlib_zlatps( uplo, trans, diag, normin, n, ap, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(out) :: scale
           real(dp), intent(inout) :: cnorm(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(inout) :: x(*)
     end subroutine stdlib_zlatps

     pure module subroutine stdlib_wlatps( uplo, trans, diag, normin, n, ap, x, scale,cnorm, info )
               
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(out) :: scale
           real(qp), intent(inout) :: cnorm(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(inout) :: x(*)
     end subroutine stdlib_wlatps


end interface 


interface 
     pure module subroutine stdlib_stptri( uplo, diag, n, ap, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: ap(*)
     end subroutine stdlib_stptri

     pure module subroutine stdlib_dtptri( uplo, diag, n, ap, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: ap(*)
     end subroutine stdlib_dtptri

     pure module subroutine stdlib_qtptri( uplo, diag, n, ap, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: ap(*)
     end subroutine stdlib_qtptri


     pure module subroutine stdlib_ctptri( uplo, diag, n, ap, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_ctptri

     pure module subroutine stdlib_ztptri( uplo, diag, n, ap, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_ztptri

     pure module subroutine stdlib_wtptri( uplo, diag, n, ap, info )
           character, intent(in) :: diag, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_wtptri


end interface 


interface 
     pure module subroutine stdlib_stprfs( uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx,ferr, berr, &
               work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ap(*), b(ldb,*), x(ldx,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_stprfs

     pure module subroutine stdlib_dtprfs( uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx,ferr, berr, &
               work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ap(*), b(ldb,*), x(ldx,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_dtprfs

     pure module subroutine stdlib_qtprfs( uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx,ferr, berr, &
               work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ap(*), b(ldb,*), x(ldx,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_qtprfs


     pure module subroutine stdlib_ctprfs( uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx,ferr, berr, &
               work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: ap(*), b(ldb,*), x(ldx,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctprfs

     pure module subroutine stdlib_ztprfs( uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx,ferr, berr, &
               work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: ap(*), b(ldb,*), x(ldx,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztprfs

     pure module subroutine stdlib_wtprfs( uplo, trans, diag, n, nrhs, ap, b, ldb, x, ldx,ferr, berr, &
               work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: ap(*), b(ldb,*), x(ldx,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtprfs


end interface 


interface 
     pure module subroutine stdlib_stftri( transr, uplo, diag, n, a, info )
           character, intent(in) :: transr, uplo, diag
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_stftri

     pure module subroutine stdlib_dtftri( transr, uplo, diag, n, a, info )
           character, intent(in) :: transr, uplo, diag
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_dtftri

     pure module subroutine stdlib_qtftri( transr, uplo, diag, n, a, info )
           character, intent(in) :: transr, uplo, diag
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_qtftri


     pure module subroutine stdlib_ctftri( transr, uplo, diag, n, a, info )
           character, intent(in) :: transr, uplo, diag
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(sp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_ctftri

     pure module subroutine stdlib_ztftri( transr, uplo, diag, n, a, info )
           character, intent(in) :: transr, uplo, diag
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(dp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_ztftri

     pure module subroutine stdlib_wtftri( transr, uplo, diag, n, a, info )
           character, intent(in) :: transr, uplo, diag
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(qp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_wtftri


end interface 


interface 
     module subroutine stdlib_stbcon( norm, uplo, diag, n, kd, ab, ldab, rcond, work,iwork, info )
               
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_stbcon

     module subroutine stdlib_dtbcon( norm, uplo, diag, n, kd, ab, ldab, rcond, work,iwork, info )
               
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dtbcon

     module subroutine stdlib_qtbcon( norm, uplo, diag, n, kd, ab, ldab, rcond, work,iwork, info )
               
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qtbcon


     module subroutine stdlib_ctbcon( norm, uplo, diag, n, kd, ab, ldab, rcond, work,rwork, info )
               
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctbcon

     module subroutine stdlib_ztbcon( norm, uplo, diag, n, kd, ab, ldab, rcond, work,rwork, info )
               
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztbcon

     module subroutine stdlib_wtbcon( norm, uplo, diag, n, kd, ab, ldab, rcond, work,rwork, info )
               
           character, intent(in) :: diag, norm, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtbcon


end interface 


interface 
     pure module subroutine stdlib_stbtrs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, info )
               
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_stbtrs

     pure module subroutine stdlib_dtbtrs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, info )
               
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dtbtrs

     pure module subroutine stdlib_qtbtrs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, info )
               
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qtbtrs


     pure module subroutine stdlib_ctbtrs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, info )
               
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ctbtrs

     pure module subroutine stdlib_ztbtrs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, info )
               
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ztbtrs

     pure module subroutine stdlib_wtbtrs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, info )
               
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wtbtrs


end interface 


interface 
     pure module subroutine stdlib_slatbs( uplo, trans, diag, normin, n, kd, ab, ldab, x,scale, cnorm, &
               info )
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(out) :: scale
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_slatbs

     pure module subroutine stdlib_dlatbs( uplo, trans, diag, normin, n, kd, ab, ldab, x,scale, cnorm, &
               info )
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(out) :: scale
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_dlatbs

     pure module subroutine stdlib_qlatbs( uplo, trans, diag, normin, n, kd, ab, ldab, x,scale, cnorm, &
               info )
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(out) :: scale
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(inout) :: cnorm(*), x(*)
     end subroutine stdlib_qlatbs


     pure module subroutine stdlib_clatbs( uplo, trans, diag, normin, n, kd, ab, ldab, x,scale, cnorm, &
               info )
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(out) :: scale
           real(sp), intent(inout) :: cnorm(*)
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(inout) :: x(*)
     end subroutine stdlib_clatbs

     pure module subroutine stdlib_zlatbs( uplo, trans, diag, normin, n, kd, ab, ldab, x,scale, cnorm, &
               info )
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(out) :: scale
           real(dp), intent(inout) :: cnorm(*)
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(inout) :: x(*)
     end subroutine stdlib_zlatbs

     pure module subroutine stdlib_wlatbs( uplo, trans, diag, normin, n, kd, ab, ldab, x,scale, cnorm, &
               info )
           character, intent(in) :: diag, normin, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(out) :: scale
           real(qp), intent(inout) :: cnorm(*)
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(inout) :: x(*)
     end subroutine stdlib_wlatbs


end interface 


interface 
     pure module subroutine stdlib_stbrfs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, x, ldx, ferr,&
                berr, work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ab(ldab,*), b(ldb,*), x(ldx,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_stbrfs

     pure module subroutine stdlib_dtbrfs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, x, ldx, ferr,&
                berr, work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ab(ldab,*), b(ldb,*), x(ldx,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_dtbrfs

     pure module subroutine stdlib_qtbrfs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, x, ldx, ferr,&
                berr, work, iwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ab(ldab,*), b(ldb,*), x(ldx,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
     end subroutine stdlib_qtbrfs


     pure module subroutine stdlib_ctbrfs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, x, ldx, ferr,&
                berr, work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: ab(ldab,*), b(ldb,*), x(ldx,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_ctbrfs

     pure module subroutine stdlib_ztbrfs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, x, ldx, ferr,&
                berr, work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: ab(ldab,*), b(ldb,*), x(ldx,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_ztbrfs

     pure module subroutine stdlib_wtbrfs( uplo, trans, diag, n, kd, nrhs, ab, ldab, b,ldb, x, ldx, ferr,&
                berr, work, rwork, info )
           character, intent(in) :: diag, trans, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: ab(ldab,*), b(ldb,*), x(ldx,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wtbrfs


end interface 


interface 
     pure module subroutine stdlib_sgecon( norm, n, a, lda, anorm, rcond, work, iwork,info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgecon

     pure module subroutine stdlib_dgecon( norm, n, a, lda, anorm, rcond, work, iwork,info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgecon

     pure module subroutine stdlib_qgecon( norm, n, a, lda, anorm, rcond, work, iwork,info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgecon


     pure module subroutine stdlib_cgecon( norm, n, a, lda, anorm, rcond, work, rwork,info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgecon

     pure module subroutine stdlib_zgecon( norm, n, a, lda, anorm, rcond, work, rwork,info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgecon

     pure module subroutine stdlib_wgecon( norm, n, a, lda, anorm, rcond, work, rwork,info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgecon


end interface 


interface 
     pure module subroutine stdlib_sgetrf( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_sgetrf

     pure module subroutine stdlib_dgetrf( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dgetrf

     pure module subroutine stdlib_qgetrf( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qgetrf


     pure module subroutine stdlib_cgetrf( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cgetrf

     pure module subroutine stdlib_zgetrf( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zgetrf

     pure module subroutine stdlib_wgetrf( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wgetrf


end interface 


interface 
     pure recursive module subroutine stdlib_sgetrf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_sgetrf2

     pure recursive module subroutine stdlib_dgetrf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dgetrf2

     pure recursive module subroutine stdlib_qgetrf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qgetrf2


     pure recursive module subroutine stdlib_cgetrf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cgetrf2

     pure recursive module subroutine stdlib_zgetrf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zgetrf2

     pure recursive module subroutine stdlib_wgetrf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wgetrf2


end interface 


interface 
     pure module subroutine stdlib_sgetf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_sgetf2

     pure module subroutine stdlib_dgetf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dgetf2

     pure module subroutine stdlib_qgetf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qgetf2


     pure module subroutine stdlib_cgetf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cgetf2

     pure module subroutine stdlib_zgetf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zgetf2

     pure module subroutine stdlib_wgetf2( m, n, a, lda, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wgetf2


end interface 


interface 
     pure module subroutine stdlib_sgetrs( trans, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_sgetrs

     pure module subroutine stdlib_dgetrs( trans, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dgetrs

     pure module subroutine stdlib_qgetrs( trans, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qgetrs


     pure module subroutine stdlib_cgetrs( trans, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_cgetrs

     pure module subroutine stdlib_zgetrs( trans, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zgetrs

     pure module subroutine stdlib_wgetrs( trans, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wgetrs


end interface 


interface 
     pure module subroutine stdlib_sgetri( n, a, lda, ipiv, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgetri

     pure module subroutine stdlib_dgetri( n, a, lda, ipiv, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgetri

     pure module subroutine stdlib_qgetri( n, a, lda, ipiv, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgetri


     pure module subroutine stdlib_cgetri( n, a, lda, ipiv, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgetri

     pure module subroutine stdlib_zgetri( n, a, lda, ipiv, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgetri

     pure module subroutine stdlib_wgetri( n, a, lda, ipiv, work, lwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgetri


end interface 


interface 
     pure module subroutine stdlib_sgerfs( trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_sgerfs

     pure module subroutine stdlib_dgerfs( trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dgerfs

     pure module subroutine stdlib_qgerfs( trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qgerfs


     pure module subroutine stdlib_cgerfs( trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cgerfs

     pure module subroutine stdlib_zgerfs( trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zgerfs

     pure module subroutine stdlib_wgerfs( trans, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wgerfs


end interface 


interface 
     pure module subroutine stdlib_sgeequ( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: c(*), r(*)
     end subroutine stdlib_sgeequ

     pure module subroutine stdlib_dgeequ( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: c(*), r(*)
     end subroutine stdlib_dgeequ

     pure module subroutine stdlib_qgeequ( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: c(*), r(*)
     end subroutine stdlib_qgeequ


     pure module subroutine stdlib_cgeequ( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(out) :: c(*), r(*)
           complex(sp), intent(in) :: a(lda,*)
     end subroutine stdlib_cgeequ

     pure module subroutine stdlib_zgeequ( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(out) :: c(*), r(*)
           complex(dp), intent(in) :: a(lda,*)
     end subroutine stdlib_zgeequ

     pure module subroutine stdlib_wgeequ( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(out) :: c(*), r(*)
           complex(qp), intent(in) :: a(lda,*)
     end subroutine stdlib_wgeequ


end interface 


interface 
     pure module subroutine stdlib_sgeequb( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: c(*), r(*)
     end subroutine stdlib_sgeequb

     pure module subroutine stdlib_dgeequb( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: c(*), r(*)
     end subroutine stdlib_dgeequb

     pure module subroutine stdlib_qgeequb( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: c(*), r(*)
     end subroutine stdlib_qgeequb


     pure module subroutine stdlib_cgeequb( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(out) :: c(*), r(*)
           complex(sp), intent(in) :: a(lda,*)
     end subroutine stdlib_cgeequb

     pure module subroutine stdlib_zgeequb( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(out) :: c(*), r(*)
           complex(dp), intent(in) :: a(lda,*)
     end subroutine stdlib_zgeequb

     pure module subroutine stdlib_wgeequb( m, n, a, lda, r, c, rowcnd, colcnd, amax,info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(out) :: c(*), r(*)
           complex(qp), intent(in) :: a(lda,*)
     end subroutine stdlib_wgeequb


end interface 


interface 
     pure module subroutine stdlib_slaqge( m, n, a, lda, r, c, rowcnd, colcnd, amax,equed )
           character, intent(out) :: equed
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(in) :: amax, colcnd, rowcnd
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: c(*), r(*)
     end subroutine stdlib_slaqge

     pure module subroutine stdlib_dlaqge( m, n, a, lda, r, c, rowcnd, colcnd, amax,equed )
           character, intent(out) :: equed
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(in) :: amax, colcnd, rowcnd
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: c(*), r(*)
     end subroutine stdlib_dlaqge

     pure module subroutine stdlib_qlaqge( m, n, a, lda, r, c, rowcnd, colcnd, amax,equed )
           character, intent(out) :: equed
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(in) :: amax, colcnd, rowcnd
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: c(*), r(*)
     end subroutine stdlib_qlaqge


     pure module subroutine stdlib_claqge( m, n, a, lda, r, c, rowcnd, colcnd, amax,equed )
           character, intent(out) :: equed
           integer(ilp), intent(in) :: lda, m, n
           real(sp), intent(in) :: amax, colcnd, rowcnd
           real(sp), intent(in) :: c(*), r(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_claqge

     pure module subroutine stdlib_zlaqge( m, n, a, lda, r, c, rowcnd, colcnd, amax,equed )
           character, intent(out) :: equed
           integer(ilp), intent(in) :: lda, m, n
           real(dp), intent(in) :: amax, colcnd, rowcnd
           real(dp), intent(in) :: c(*), r(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zlaqge

     pure module subroutine stdlib_wlaqge( m, n, a, lda, r, c, rowcnd, colcnd, amax,equed )
           character, intent(out) :: equed
           integer(ilp), intent(in) :: lda, m, n
           real(qp), intent(in) :: amax, colcnd, rowcnd
           real(qp), intent(in) :: c(*), r(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wlaqge


end interface 


interface 
     pure module subroutine stdlib_slaswp( n, a, lda, k1, k2, ipiv, incx )
           integer(ilp), intent(in) :: incx, k1, k2, lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_slaswp

     pure module subroutine stdlib_dlaswp( n, a, lda, k1, k2, ipiv, incx )
           integer(ilp), intent(in) :: incx, k1, k2, lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dlaswp

     pure module subroutine stdlib_qlaswp( n, a, lda, k1, k2, ipiv, incx )
           integer(ilp), intent(in) :: incx, k1, k2, lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qlaswp


     pure module subroutine stdlib_claswp( n, a, lda, k1, k2, ipiv, incx )
           integer(ilp), intent(in) :: incx, k1, k2, lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_claswp

     pure module subroutine stdlib_zlaswp( n, a, lda, k1, k2, ipiv, incx )
           integer(ilp), intent(in) :: incx, k1, k2, lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zlaswp

     pure module subroutine stdlib_wlaswp( n, a, lda, k1, k2, ipiv, incx )
           integer(ilp), intent(in) :: incx, k1, k2, lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wlaswp


end interface 


interface 
     pure module subroutine stdlib_sgetc2( n, a, lda, ipiv, jpiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*), jpiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_sgetc2

     pure module subroutine stdlib_dgetc2( n, a, lda, ipiv, jpiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*), jpiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dgetc2

     pure module subroutine stdlib_qgetc2( n, a, lda, ipiv, jpiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*), jpiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qgetc2


     pure module subroutine stdlib_cgetc2( n, a, lda, ipiv, jpiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*), jpiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cgetc2

     pure module subroutine stdlib_zgetc2( n, a, lda, ipiv, jpiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*), jpiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zgetc2

     pure module subroutine stdlib_wgetc2( n, a, lda, ipiv, jpiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*), jpiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wgetc2


end interface 


interface 
     pure module subroutine stdlib_sgesc2( n, a, lda, rhs, ipiv, jpiv, scale )
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: scale
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: rhs(*)
     end subroutine stdlib_sgesc2

     pure module subroutine stdlib_dgesc2( n, a, lda, rhs, ipiv, jpiv, scale )
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: scale
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: rhs(*)
     end subroutine stdlib_dgesc2

     pure module subroutine stdlib_qgesc2( n, a, lda, rhs, ipiv, jpiv, scale )
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: scale
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: rhs(*)
     end subroutine stdlib_qgesc2


     pure module subroutine stdlib_cgesc2( n, a, lda, rhs, ipiv, jpiv, scale )
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: scale
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: rhs(*)
     end subroutine stdlib_cgesc2

     pure module subroutine stdlib_zgesc2( n, a, lda, rhs, ipiv, jpiv, scale )
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: scale
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: rhs(*)
     end subroutine stdlib_zgesc2

     pure module subroutine stdlib_wgesc2( n, a, lda, rhs, ipiv, jpiv, scale )
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: scale
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: rhs(*)
     end subroutine stdlib_wgesc2


end interface 


interface 
     pure module subroutine stdlib_slatdf( ijob, n, z, ldz, rhs, rdsum, rdscal, ipiv,jpiv )
           integer(ilp), intent(in) :: ijob, ldz, n
           real(sp), intent(inout) :: rdscal, rdsum
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           real(sp), intent(inout) :: rhs(*), z(ldz,*)
     end subroutine stdlib_slatdf

     pure module subroutine stdlib_dlatdf( ijob, n, z, ldz, rhs, rdsum, rdscal, ipiv,jpiv )
           integer(ilp), intent(in) :: ijob, ldz, n
           real(dp), intent(inout) :: rdscal, rdsum
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           real(dp), intent(inout) :: rhs(*), z(ldz,*)
     end subroutine stdlib_dlatdf

     pure module subroutine stdlib_qlatdf( ijob, n, z, ldz, rhs, rdsum, rdscal, ipiv,jpiv )
           integer(ilp), intent(in) :: ijob, ldz, n
           real(qp), intent(inout) :: rdscal, rdsum
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           real(qp), intent(inout) :: rhs(*), z(ldz,*)
     end subroutine stdlib_qlatdf


     pure module subroutine stdlib_clatdf( ijob, n, z, ldz, rhs, rdsum, rdscal, ipiv,jpiv )
           integer(ilp), intent(in) :: ijob, ldz, n
           real(sp), intent(inout) :: rdscal, rdsum
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           complex(sp), intent(inout) :: rhs(*), z(ldz,*)
     end subroutine stdlib_clatdf

     pure module subroutine stdlib_zlatdf( ijob, n, z, ldz, rhs, rdsum, rdscal, ipiv,jpiv )
           integer(ilp), intent(in) :: ijob, ldz, n
           real(dp), intent(inout) :: rdscal, rdsum
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           complex(dp), intent(inout) :: rhs(*), z(ldz,*)
     end subroutine stdlib_zlatdf

     pure module subroutine stdlib_wlatdf( ijob, n, z, ldz, rhs, rdsum, rdscal, ipiv,jpiv )
           integer(ilp), intent(in) :: ijob, ldz, n
           real(qp), intent(inout) :: rdscal, rdsum
           integer(ilp), intent(in) :: ipiv(*), jpiv(*)
           complex(qp), intent(inout) :: rhs(*), z(ldz,*)
     end subroutine stdlib_wlatdf


end interface 


interface 
     real(sp) module function stdlib_sla_gercond( trans, n, a, lda, af, ldaf, ipiv,cmode, c, info, work, &
               iwork )
           character, intent(in) :: trans
           integer(ilp), intent(in) :: n, lda, ldaf, cmode
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*), af(ldaf,*), c(*)
           real(sp), intent(out) :: work(*)
     end function stdlib_sla_gercond

     real(dp) module function stdlib_dla_gercond( trans, n, a, lda, af,ldaf, ipiv, cmode, c,info, work, &
               iwork )
           character, intent(in) :: trans
           integer(ilp), intent(in) :: n, lda, ldaf, cmode
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*), af(ldaf,*), c(*)
           real(dp), intent(out) :: work(*)
     end function stdlib_dla_gercond

     real(qp) module function stdlib_qla_gercond( trans, n, a, lda, af,ldaf, ipiv, cmode, c,info, work, &
               iwork )
           character, intent(in) :: trans
           integer(ilp), intent(in) :: n, lda, ldaf, cmode
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*), af(ldaf,*), c(*)
           real(qp), intent(out) :: work(*)
     end function stdlib_qla_gercond


end interface 


interface 
     pure module subroutine stdlib_sgbcon( norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond,work, iwork, &
               info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgbcon

     pure module subroutine stdlib_dgbcon( norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond,work, iwork, &
               info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgbcon

     pure module subroutine stdlib_qgbcon( norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond,work, iwork, &
               info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgbcon


     pure module subroutine stdlib_cgbcon( norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond,work, rwork, &
               info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgbcon

     pure module subroutine stdlib_zgbcon( norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond,work, rwork, &
               info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgbcon

     pure module subroutine stdlib_wgbcon( norm, n, kl, ku, ab, ldab, ipiv, anorm, rcond,work, rwork, &
               info )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgbcon


end interface 


interface 
     pure module subroutine stdlib_sgbtrf( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_sgbtrf

     pure module subroutine stdlib_dgbtrf( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_dgbtrf

     pure module subroutine stdlib_qgbtrf( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_qgbtrf


     pure module subroutine stdlib_cgbtrf( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_cgbtrf

     pure module subroutine stdlib_zgbtrf( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_zgbtrf

     pure module subroutine stdlib_wgbtrf( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_wgbtrf


end interface 


interface 
     pure module subroutine stdlib_sgbtf2( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_sgbtf2

     pure module subroutine stdlib_dgbtf2( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_dgbtf2

     pure module subroutine stdlib_qgbtf2( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_qgbtf2


     pure module subroutine stdlib_cgbtf2( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_cgbtf2

     pure module subroutine stdlib_zgbtf2( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_zgbtf2

     pure module subroutine stdlib_wgbtf2( m, n, kl, ku, ab, ldab, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_wgbtf2


end interface 


interface 
     pure module subroutine stdlib_sgbtrs( trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_sgbtrs

     pure module subroutine stdlib_dgbtrs( trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dgbtrs

     pure module subroutine stdlib_qgbtrs( trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qgbtrs


     pure module subroutine stdlib_cgbtrs( trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_cgbtrs

     pure module subroutine stdlib_zgbtrs( trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zgbtrs

     pure module subroutine stdlib_wgbtrs( trans, n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wgbtrs


end interface 


interface 
     pure module subroutine stdlib_sgbrfs( trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, iwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_sgbrfs

     pure module subroutine stdlib_dgbrfs( trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, iwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dgbrfs

     pure module subroutine stdlib_qgbrfs( trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, iwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qgbrfs


     pure module subroutine stdlib_cgbrfs( trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, rwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cgbrfs

     pure module subroutine stdlib_zgbrfs( trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, rwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zgbrfs

     pure module subroutine stdlib_wgbrfs( trans, n, kl, ku, nrhs, ab, ldab, afb, ldafb,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, rwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wgbrfs


end interface 


interface 
     pure module subroutine stdlib_sgbequ( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(out) :: c(*), r(*)
     end subroutine stdlib_sgbequ

     pure module subroutine stdlib_dgbequ( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(out) :: c(*), r(*)
     end subroutine stdlib_dgbequ

     pure module subroutine stdlib_qgbequ( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(out) :: c(*), r(*)
     end subroutine stdlib_qgbequ


     pure module subroutine stdlib_cgbequ( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(out) :: c(*), r(*)
           complex(sp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_cgbequ

     pure module subroutine stdlib_zgbequ( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(out) :: c(*), r(*)
           complex(dp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_zgbequ

     pure module subroutine stdlib_wgbequ( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(out) :: c(*), r(*)
           complex(qp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_wgbequ


end interface 


interface 
     pure module subroutine stdlib_sgbequb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(out) :: c(*), r(*)
     end subroutine stdlib_sgbequb

     pure module subroutine stdlib_dgbequb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(out) :: c(*), r(*)
     end subroutine stdlib_dgbequb

     pure module subroutine stdlib_qgbequb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(out) :: c(*), r(*)
     end subroutine stdlib_qgbequb


     pure module subroutine stdlib_cgbequb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(sp), intent(out) :: amax, colcnd, rowcnd
           real(sp), intent(out) :: c(*), r(*)
           complex(sp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_cgbequb

     pure module subroutine stdlib_zgbequb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(dp), intent(out) :: amax, colcnd, rowcnd
           real(dp), intent(out) :: c(*), r(*)
           complex(dp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_zgbequb

     pure module subroutine stdlib_wgbequb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(qp), intent(out) :: amax, colcnd, rowcnd
           real(qp), intent(out) :: c(*), r(*)
           complex(qp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_wgbequb


end interface 


interface 
     pure module subroutine stdlib_slaqgb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, equed )
               
           character, intent(out) :: equed
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(sp), intent(in) :: amax, colcnd, rowcnd
           real(sp), intent(inout) :: ab(ldab,*)
           real(sp), intent(in) :: c(*), r(*)
     end subroutine stdlib_slaqgb

     pure module subroutine stdlib_dlaqgb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, equed )
               
           character, intent(out) :: equed
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(dp), intent(in) :: amax, colcnd, rowcnd
           real(dp), intent(inout) :: ab(ldab,*)
           real(dp), intent(in) :: c(*), r(*)
     end subroutine stdlib_dlaqgb

     pure module subroutine stdlib_qlaqgb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, equed )
               
           character, intent(out) :: equed
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(qp), intent(in) :: amax, colcnd, rowcnd
           real(qp), intent(inout) :: ab(ldab,*)
           real(qp), intent(in) :: c(*), r(*)
     end subroutine stdlib_qlaqgb


     pure module subroutine stdlib_claqgb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, equed )
               
           character, intent(out) :: equed
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(sp), intent(in) :: amax, colcnd, rowcnd
           real(sp), intent(in) :: c(*), r(*)
           complex(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_claqgb

     pure module subroutine stdlib_zlaqgb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, equed )
               
           character, intent(out) :: equed
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(dp), intent(in) :: amax, colcnd, rowcnd
           real(dp), intent(in) :: c(*), r(*)
           complex(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_zlaqgb

     pure module subroutine stdlib_wlaqgb( m, n, kl, ku, ab, ldab, r, c, rowcnd, colcnd,amax, equed )
               
           character, intent(out) :: equed
           integer(ilp), intent(in) :: kl, ku, ldab, m, n
           real(qp), intent(in) :: amax, colcnd, rowcnd
           real(qp), intent(in) :: c(*), r(*)
           complex(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_wlaqgb


end interface 


interface 
     real(sp) module function stdlib_sla_gbrcond( trans, n, kl, ku, ab, ldab, afb, ldafb,ipiv, cmode, c, &
               info, work, iwork )
           character, intent(in) :: trans
           integer(ilp), intent(in) :: n, ldab, ldafb, kl, ku, cmode
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: iwork(*)
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: ab(ldab,*), afb(ldafb,*), c(*)
           real(sp), intent(out) :: work(*)
     end function stdlib_sla_gbrcond

     real(dp) module function stdlib_dla_gbrcond( trans, n, kl, ku, ab, ldab,afb, ldafb, ipiv, cmode, c,&
               info, work, iwork )
           character, intent(in) :: trans
           integer(ilp), intent(in) :: n, ldab, ldafb, kl, ku, cmode
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: iwork(*)
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: ab(ldab,*), afb(ldafb,*), c(*)
           real(dp), intent(out) :: work(*)
     end function stdlib_dla_gbrcond

     real(qp) module function stdlib_qla_gbrcond( trans, n, kl, ku, ab, ldab,afb, ldafb, ipiv, cmode, c,&
               info, work, iwork )
           character, intent(in) :: trans
           integer(ilp), intent(in) :: n, ldab, ldafb, kl, ku, cmode
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: iwork(*)
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: ab(ldab,*), afb(ldafb,*), c(*)
           real(qp), intent(out) :: work(*)
     end function stdlib_qla_gbrcond


end interface 


interface 
     pure real(sp) module function stdlib_sla_gbrpvgrw( n, kl, ku, ncols, ab, ldab, afb,ldafb )
           integer(ilp), intent(in) :: n, kl, ku, ncols, ldab, ldafb
           real(sp), intent(in) :: ab(ldab,*), afb(ldafb,*)
     end function stdlib_sla_gbrpvgrw

     pure real(dp) module function stdlib_dla_gbrpvgrw( n, kl, ku, ncols, ab,ldab, afb, ldafb )
           integer(ilp), intent(in) :: n, kl, ku, ncols, ldab, ldafb
           real(dp), intent(in) :: ab(ldab,*), afb(ldafb,*)
     end function stdlib_dla_gbrpvgrw

     pure real(qp) module function stdlib_qla_gbrpvgrw( n, kl, ku, ncols, ab,ldab, afb, ldafb )
           integer(ilp), intent(in) :: n, kl, ku, ncols, ldab, ldafb
           real(qp), intent(in) :: ab(ldab,*), afb(ldafb,*)
     end function stdlib_qla_gbrpvgrw


     pure real(sp) module function stdlib_cla_gbrpvgrw( n, kl, ku, ncols, ab, ldab, afb,ldafb )
           integer(ilp), intent(in) :: n, kl, ku, ncols, ldab, ldafb
           complex(sp), intent(in) :: ab(ldab,*), afb(ldafb,*)
     end function stdlib_cla_gbrpvgrw

     pure real(dp) module function stdlib_zla_gbrpvgrw( n, kl, ku, ncols, ab,ldab, afb, ldafb )
           integer(ilp), intent(in) :: n, kl, ku, ncols, ldab, ldafb
           complex(dp), intent(in) :: ab(ldab,*), afb(ldafb,*)
     end function stdlib_zla_gbrpvgrw

     pure real(qp) module function stdlib_wla_gbrpvgrw( n, kl, ku, ncols, ab,ldab, afb, ldafb )
           integer(ilp), intent(in) :: n, kl, ku, ncols, ldab, ldafb
           complex(qp), intent(in) :: ab(ldab,*), afb(ldafb,*)
     end function stdlib_wla_gbrpvgrw


end interface 


interface 
     pure module subroutine stdlib_sgtcon( norm, n, dl, d, du, du2, ipiv, anorm, rcond,work, iwork, info &
               )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: d(*), dl(*), du(*), du2(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sgtcon

     pure module subroutine stdlib_dgtcon( norm, n, dl, d, du, du2, ipiv, anorm, rcond,work, iwork, info &
               )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: d(*), dl(*), du(*), du2(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dgtcon

     pure module subroutine stdlib_qgtcon( norm, n, dl, d, du, du2, ipiv, anorm, rcond,work, iwork, info &
               )
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: d(*), dl(*), du(*), du2(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qgtcon


     pure module subroutine stdlib_cgtcon( norm, n, dl, d, du, du2, ipiv, anorm, rcond,work, info )
               
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: d(*), dl(*), du(*), du2(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cgtcon

     pure module subroutine stdlib_zgtcon( norm, n, dl, d, du, du2, ipiv, anorm, rcond,work, info )
               
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: d(*), dl(*), du(*), du2(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zgtcon

     pure module subroutine stdlib_wgtcon( norm, n, dl, d, du, du2, ipiv, anorm, rcond,work, info )
               
           character, intent(in) :: norm
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: d(*), dl(*), du(*), du2(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wgtcon


end interface 


interface 
     pure module subroutine stdlib_sgttrf( n, dl, d, du, du2, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: d(*), dl(*), du(*)
           real(sp), intent(out) :: du2(*)
     end subroutine stdlib_sgttrf

     pure module subroutine stdlib_dgttrf( n, dl, d, du, du2, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: d(*), dl(*), du(*)
           real(dp), intent(out) :: du2(*)
     end subroutine stdlib_dgttrf

     pure module subroutine stdlib_qgttrf( n, dl, d, du, du2, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: d(*), dl(*), du(*)
           real(qp), intent(out) :: du2(*)
     end subroutine stdlib_qgttrf


     pure module subroutine stdlib_cgttrf( n, dl, d, du, du2, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: d(*), dl(*), du(*)
           complex(sp), intent(out) :: du2(*)
     end subroutine stdlib_cgttrf

     pure module subroutine stdlib_zgttrf( n, dl, d, du, du2, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: d(*), dl(*), du(*)
           complex(dp), intent(out) :: du2(*)
     end subroutine stdlib_zgttrf

     pure module subroutine stdlib_wgttrf( n, dl, d, du, du2, ipiv, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: d(*), dl(*), du(*)
           complex(qp), intent(out) :: du2(*)
     end subroutine stdlib_wgttrf


end interface 


interface 
     pure module subroutine stdlib_sgttrs( trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: b(ldb,*)
           real(sp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_sgttrs

     pure module subroutine stdlib_dgttrs( trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: b(ldb,*)
           real(dp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_dgttrs

     pure module subroutine stdlib_qgttrs( trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: b(ldb,*)
           real(qp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_qgttrs


     pure module subroutine stdlib_cgttrs( trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: b(ldb,*)
           complex(sp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_cgttrs

     pure module subroutine stdlib_zgttrs( trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: b(ldb,*)
           complex(dp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_zgttrs

     pure module subroutine stdlib_wgttrs( trans, n, nrhs, dl, d, du, du2, ipiv, b, ldb,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: b(ldb,*)
           complex(qp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_wgttrs


end interface 


interface 
     pure module subroutine stdlib_sgtts2( itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb )
           integer(ilp), intent(in) :: itrans, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: b(ldb,*)
           real(sp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_sgtts2

     pure module subroutine stdlib_dgtts2( itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb )
           integer(ilp), intent(in) :: itrans, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: b(ldb,*)
           real(dp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_dgtts2

     pure module subroutine stdlib_qgtts2( itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb )
           integer(ilp), intent(in) :: itrans, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: b(ldb,*)
           real(qp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_qgtts2


     pure module subroutine stdlib_cgtts2( itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb )
           integer(ilp), intent(in) :: itrans, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: b(ldb,*)
           complex(sp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_cgtts2

     pure module subroutine stdlib_zgtts2( itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb )
           integer(ilp), intent(in) :: itrans, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: b(ldb,*)
           complex(dp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_zgtts2

     pure module subroutine stdlib_wgtts2( itrans, n, nrhs, dl, d, du, du2, ipiv, b, ldb )
           integer(ilp), intent(in) :: itrans, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: b(ldb,*)
           complex(qp), intent(in) :: d(*), dl(*), du(*), du2(*)
     end subroutine stdlib_wgtts2


end interface 


interface 
     pure module subroutine stdlib_sgtrfs( trans, n, nrhs, dl, d, du, dlf, df, duf, du2,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, iwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: b(ldb,*), d(*), df(*), dl(*), dlf(*), du(*), du2(*), duf(*)
                     
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_sgtrfs

     pure module subroutine stdlib_dgtrfs( trans, n, nrhs, dl, d, du, dlf, df, duf, du2,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, iwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: b(ldb,*), d(*), df(*), dl(*), dlf(*), du(*), du2(*), duf(*)
                     
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dgtrfs

     pure module subroutine stdlib_qgtrfs( trans, n, nrhs, dl, d, du, dlf, df, duf, du2,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, iwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: b(ldb,*), d(*), df(*), dl(*), dlf(*), du(*), du2(*), duf(*)
                     
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qgtrfs


     pure module subroutine stdlib_cgtrfs( trans, n, nrhs, dl, d, du, dlf, df, duf, du2,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, rwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: b(ldb,*), d(*), df(*), dl(*), dlf(*), du(*), du2(*), duf(*)
                     
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cgtrfs

     pure module subroutine stdlib_zgtrfs( trans, n, nrhs, dl, d, du, dlf, df, duf, du2,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, rwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: b(ldb,*), d(*), df(*), dl(*), dlf(*), du(*), du2(*), duf(*)
                     
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zgtrfs

     pure module subroutine stdlib_wgtrfs( trans, n, nrhs, dl, d, du, dlf, df, duf, du2,ipiv, b, ldb, x, &
               ldx, ferr, berr, work, rwork,info )
           character, intent(in) :: trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: b(ldb,*), d(*), df(*), dl(*), dlf(*), du(*), du2(*), duf(*)
                     
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wgtrfs


end interface 


interface 
     pure module subroutine stdlib_sgesv( n, nrhs, a, lda, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_sgesv

     pure module subroutine stdlib_dgesv( n, nrhs, a, lda, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_dgesv

     pure module subroutine stdlib_qgesv( n, nrhs, a, lda, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_qgesv


     pure module subroutine stdlib_cgesv( n, nrhs, a, lda, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_cgesv

     pure module subroutine stdlib_zgesv( n, nrhs, a, lda, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_zgesv

     pure module subroutine stdlib_wgesv( n, nrhs, a, lda, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_wgesv


end interface 


interface 
     module subroutine stdlib_sgesvx( fact, trans, n, nrhs, a, lda, af, ldaf, ipiv,equed, r, c, b, ldb, &
               x, ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*), c(*), r(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_sgesvx

     module subroutine stdlib_dgesvx( fact, trans, n, nrhs, a, lda, af, ldaf, ipiv,equed, r, c, b, ldb, &
               x, ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*), c(*), r(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dgesvx

     module subroutine stdlib_qgesvx( fact, trans, n, nrhs, a, lda, af, ldaf, ipiv,equed, r, c, b, ldb, &
               x, ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*), c(*), r(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qgesvx


     module subroutine stdlib_cgesvx( fact, trans, n, nrhs, a, lda, af, ldaf, ipiv,equed, r, c, b, ldb, &
               x, ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(inout) :: c(*), r(*)
           complex(sp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cgesvx

     module subroutine stdlib_zgesvx( fact, trans, n, nrhs, a, lda, af, ldaf, ipiv,equed, r, c, b, ldb, &
               x, ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(inout) :: c(*), r(*)
           complex(dp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zgesvx

     module subroutine stdlib_wgesvx( fact, trans, n, nrhs, a, lda, af, ldaf, ipiv,equed, r, c, b, ldb, &
               x, ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(inout) :: c(*), r(*)
           complex(qp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wgesvx


end interface 


interface 
     pure module subroutine stdlib_sgbsv( n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_sgbsv

     pure module subroutine stdlib_dgbsv( n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_dgbsv

     pure module subroutine stdlib_qgbsv( n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_qgbsv


     pure module subroutine stdlib_cgbsv( n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_cgbsv

     pure module subroutine stdlib_zgbsv( n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_zgbsv

     pure module subroutine stdlib_wgbsv( n, kl, ku, nrhs, ab, ldab, ipiv, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_wgbsv


end interface 


interface 
     module subroutine stdlib_sgbsvx( fact, trans, n, kl, ku, nrhs, ab, ldab, afb,ldafb, ipiv, equed, r, &
               c, b, ldb, x, ldx,rcond, ferr, berr, work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*), c(*), r(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_sgbsvx

     module subroutine stdlib_dgbsvx( fact, trans, n, kl, ku, nrhs, ab, ldab, afb,ldafb, ipiv, equed, r, &
               c, b, ldb, x, ldx,rcond, ferr, berr, work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*), c(*), r(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dgbsvx

     module subroutine stdlib_qgbsvx( fact, trans, n, kl, ku, nrhs, ab, ldab, afb,ldafb, ipiv, equed, r, &
               c, b, ldb, x, ldx,rcond, ferr, berr, work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*), c(*), r(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qgbsvx


     module subroutine stdlib_cgbsvx( fact, trans, n, kl, ku, nrhs, ab, ldab, afb,ldafb, ipiv, equed, r, &
               c, b, ldb, x, ldx,rcond, ferr, berr, work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(inout) :: c(*), r(*)
           complex(sp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cgbsvx

     module subroutine stdlib_zgbsvx( fact, trans, n, kl, ku, nrhs, ab, ldab, afb,ldafb, ipiv, equed, r, &
               c, b, ldb, x, ldx,rcond, ferr, berr, work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(inout) :: c(*), r(*)
           complex(dp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zgbsvx

     module subroutine stdlib_wgbsvx( fact, trans, n, kl, ku, nrhs, ab, ldab, afb,ldafb, ipiv, equed, r, &
               c, b, ldb, x, ldx,rcond, ferr, berr, work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kl, ku, ldab, ldafb, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(inout) :: c(*), r(*)
           complex(qp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wgbsvx


end interface 


interface 
     pure module subroutine stdlib_sgtsv( n, nrhs, dl, d, du, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(inout) :: b(ldb,*), d(*), dl(*), du(*)
     end subroutine stdlib_sgtsv

     pure module subroutine stdlib_dgtsv( n, nrhs, dl, d, du, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(inout) :: b(ldb,*), d(*), dl(*), du(*)
     end subroutine stdlib_dgtsv

     pure module subroutine stdlib_qgtsv( n, nrhs, dl, d, du, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(inout) :: b(ldb,*), d(*), dl(*), du(*)
     end subroutine stdlib_qgtsv


     pure module subroutine stdlib_cgtsv( n, nrhs, dl, d, du, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(sp), intent(inout) :: b(ldb,*), d(*), dl(*), du(*)
     end subroutine stdlib_cgtsv

     pure module subroutine stdlib_zgtsv( n, nrhs, dl, d, du, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(dp), intent(inout) :: b(ldb,*), d(*), dl(*), du(*)
     end subroutine stdlib_zgtsv

     pure module subroutine stdlib_wgtsv( n, nrhs, dl, d, du, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(qp), intent(inout) :: b(ldb,*), d(*), dl(*), du(*)
     end subroutine stdlib_wgtsv


end interface 


interface 
     pure module subroutine stdlib_sgtsvx( fact, trans, n, nrhs, dl, d, du, dlf, df, duf,du2, ipiv, b, &
               ldb, x, ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: b(ldb,*), d(*), dl(*), du(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
           real(sp), intent(inout) :: df(*), dlf(*), du2(*), duf(*)
     end subroutine stdlib_sgtsvx

     pure module subroutine stdlib_dgtsvx( fact, trans, n, nrhs, dl, d, du, dlf, df, duf,du2, ipiv, b, &
               ldb, x, ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: b(ldb,*), d(*), dl(*), du(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
           real(dp), intent(inout) :: df(*), dlf(*), du2(*), duf(*)
     end subroutine stdlib_dgtsvx

     pure module subroutine stdlib_qgtsvx( fact, trans, n, nrhs, dl, d, du, dlf, df, duf,du2, ipiv, b, &
               ldb, x, ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: b(ldb,*), d(*), dl(*), du(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
           real(qp), intent(inout) :: df(*), dlf(*), du2(*), duf(*)
     end subroutine stdlib_qgtsvx


     pure module subroutine stdlib_cgtsvx( fact, trans, n, nrhs, dl, d, du, dlf, df, duf,du2, ipiv, b, &
               ldb, x, ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: b(ldb,*), d(*), dl(*), du(*)
           complex(sp), intent(inout) :: df(*), dlf(*), du2(*), duf(*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cgtsvx

     pure module subroutine stdlib_zgtsvx( fact, trans, n, nrhs, dl, d, du, dlf, df, duf,du2, ipiv, b, &
               ldb, x, ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: b(ldb,*), d(*), dl(*), du(*)
           complex(dp), intent(inout) :: df(*), dlf(*), du2(*), duf(*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zgtsvx

     pure module subroutine stdlib_wgtsvx( fact, trans, n, nrhs, dl, d, du, dlf, df, duf,du2, ipiv, b, &
               ldb, x, ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(in) :: fact, trans
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: b(ldb,*), d(*), dl(*), du(*)
           complex(qp), intent(inout) :: df(*), dlf(*), du2(*), duf(*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wgtsvx


end interface 


interface 
     pure module subroutine stdlib_spocon( uplo, n, a, lda, anorm, rcond, work, iwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_spocon

     pure module subroutine stdlib_dpocon( uplo, n, a, lda, anorm, rcond, work, iwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dpocon

     pure module subroutine stdlib_qpocon( uplo, n, a, lda, anorm, rcond, work, iwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qpocon


     pure module subroutine stdlib_cpocon( uplo, n, a, lda, anorm, rcond, work, rwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cpocon

     pure module subroutine stdlib_zpocon( uplo, n, a, lda, anorm, rcond, work, rwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zpocon

     pure module subroutine stdlib_wpocon( uplo, n, a, lda, anorm, rcond, work, rwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wpocon


end interface 


interface 
     pure module subroutine stdlib_spotrf( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_spotrf

     pure module subroutine stdlib_dpotrf( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dpotrf

     pure module subroutine stdlib_qpotrf( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qpotrf


     pure module subroutine stdlib_cpotrf( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cpotrf

     pure module subroutine stdlib_zpotrf( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zpotrf

     pure module subroutine stdlib_wpotrf( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wpotrf


end interface 


interface 
     pure recursive module subroutine stdlib_spotrf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_spotrf2

     pure recursive module subroutine stdlib_dpotrf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dpotrf2

     pure recursive module subroutine stdlib_qpotrf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qpotrf2


     pure recursive module subroutine stdlib_cpotrf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cpotrf2

     pure recursive module subroutine stdlib_zpotrf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zpotrf2

     pure recursive module subroutine stdlib_wpotrf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wpotrf2


end interface 


interface 
     pure module subroutine stdlib_spotf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_spotf2

     pure module subroutine stdlib_dpotf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dpotf2

     pure module subroutine stdlib_qpotf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qpotf2


     pure module subroutine stdlib_cpotf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cpotf2

     pure module subroutine stdlib_zpotf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zpotf2

     pure module subroutine stdlib_wpotf2( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wpotf2


end interface 


interface 
     pure module subroutine stdlib_spstrf( uplo, n, a, lda, piv, rank, tol, work, info )
           real(sp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_spstrf

     pure module subroutine stdlib_dpstrf( uplo, n, a, lda, piv, rank, tol, work, info )
           real(dp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_dpstrf

     pure module subroutine stdlib_qpstrf( uplo, n, a, lda, piv, rank, tol, work, info )
           real(qp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_qpstrf


     pure module subroutine stdlib_cpstrf( uplo, n, a, lda, piv, rank, tol, work, info )
           real(sp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           complex(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_cpstrf

     pure module subroutine stdlib_zpstrf( uplo, n, a, lda, piv, rank, tol, work, info )
           real(dp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           complex(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_zpstrf

     pure module subroutine stdlib_wpstrf( uplo, n, a, lda, piv, rank, tol, work, info )
           real(qp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           complex(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_wpstrf


end interface 


interface 
     pure module subroutine stdlib_spstf2( uplo, n, a, lda, piv, rank, tol, work, info )
           real(sp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_spstf2

     pure module subroutine stdlib_dpstf2( uplo, n, a, lda, piv, rank, tol, work, info )
           real(dp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_dpstf2

     pure module subroutine stdlib_qpstf2( uplo, n, a, lda, piv, rank, tol, work, info )
           real(qp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_qpstf2


     pure module subroutine stdlib_cpstf2( uplo, n, a, lda, piv, rank, tol, work, info )
           real(sp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           complex(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_cpstf2

     pure module subroutine stdlib_zpstf2( uplo, n, a, lda, piv, rank, tol, work, info )
           real(dp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           complex(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_zpstf2

     pure module subroutine stdlib_wpstf2( uplo, n, a, lda, piv, rank, tol, work, info )
           real(qp), intent(in) :: tol
           integer(ilp), intent(out) :: info, rank
           integer(ilp), intent(in) :: lda, n
           character, intent(in) :: uplo
           complex(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(2_ilp*n)
           integer(ilp), intent(out) :: piv(n)
     end subroutine stdlib_wpstf2


end interface 


interface 
     pure module subroutine stdlib_spotrs( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_spotrs

     pure module subroutine stdlib_dpotrs( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dpotrs

     pure module subroutine stdlib_qpotrs( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qpotrs


     pure module subroutine stdlib_cpotrs( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_cpotrs

     pure module subroutine stdlib_zpotrs( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zpotrs

     pure module subroutine stdlib_wpotrs( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wpotrs


end interface 


interface 
     pure module subroutine stdlib_spotri( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_spotri

     pure module subroutine stdlib_dpotri( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dpotri

     pure module subroutine stdlib_qpotri( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qpotri


     pure module subroutine stdlib_cpotri( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_cpotri

     pure module subroutine stdlib_zpotri( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zpotri

     pure module subroutine stdlib_wpotri( uplo, n, a, lda, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wpotri


end interface 


interface 
     pure module subroutine stdlib_sporfs( uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x,ldx, ferr, berr, &
               work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_sporfs

     pure module subroutine stdlib_dporfs( uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x,ldx, ferr, berr, &
               work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dporfs

     pure module subroutine stdlib_qporfs( uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x,ldx, ferr, berr, &
               work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qporfs


     pure module subroutine stdlib_cporfs( uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x,ldx, ferr, berr, &
               work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cporfs

     pure module subroutine stdlib_zporfs( uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x,ldx, ferr, berr, &
               work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zporfs

     pure module subroutine stdlib_wporfs( uplo, n, nrhs, a, lda, af, ldaf, b, ldb, x,ldx, ferr, berr, &
               work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wporfs


end interface 


interface 
     pure module subroutine stdlib_spoequ( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_spoequ

     pure module subroutine stdlib_dpoequ( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_dpoequ

     pure module subroutine stdlib_qpoequ( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_qpoequ


     pure module subroutine stdlib_cpoequ( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(out) :: s(*)
           complex(sp), intent(in) :: a(lda,*)
     end subroutine stdlib_cpoequ

     pure module subroutine stdlib_zpoequ( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(out) :: s(*)
           complex(dp), intent(in) :: a(lda,*)
     end subroutine stdlib_zpoequ

     pure module subroutine stdlib_wpoequ( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(out) :: s(*)
           complex(qp), intent(in) :: a(lda,*)
     end subroutine stdlib_wpoequ


end interface 


interface 
     pure module subroutine stdlib_spoequb( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_spoequb

     pure module subroutine stdlib_dpoequb( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_dpoequb

     pure module subroutine stdlib_qpoequb( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_qpoequb


     pure module subroutine stdlib_cpoequb( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           complex(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_cpoequb

     pure module subroutine stdlib_zpoequb( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           complex(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_zpoequb

     pure module subroutine stdlib_wpoequb( n, a, lda, s, scond, amax, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           complex(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_wpoequb


end interface 


interface 
     pure module subroutine stdlib_claqhe( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(in) :: s(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_claqhe

     pure module subroutine stdlib_zlaqhe( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(in) :: s(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zlaqhe

     pure module subroutine stdlib_wlaqhe( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(in) :: s(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wlaqhe


end interface 


interface 
     real(sp) module function stdlib_sla_porcond( uplo, n, a, lda, af, ldaf, cmode, c,info, work, iwork )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, ldaf, cmode
           integer(ilp), intent(out) :: info
           real(sp), intent(in) :: a(lda,*), af(ldaf,*), c(*)
           real(sp), intent(out) :: work(*)
           integer(ilp), intent(out) :: iwork(*)
     end function stdlib_sla_porcond

     real(dp) module function stdlib_dla_porcond( uplo, n, a, lda, af, ldaf,cmode, c, info, work,iwork )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, ldaf, cmode
           integer(ilp), intent(out) :: info
           real(dp), intent(in) :: a(lda,*), af(ldaf,*), c(*)
           real(dp), intent(out) :: work(*)
           integer(ilp), intent(out) :: iwork(*)
     end function stdlib_dla_porcond

     real(qp) module function stdlib_qla_porcond( uplo, n, a, lda, af, ldaf,cmode, c, info, work,iwork )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, ldaf, cmode
           integer(ilp), intent(out) :: info
           real(qp), intent(in) :: a(lda,*), af(ldaf,*), c(*)
           real(qp), intent(out) :: work(*)
           integer(ilp), intent(out) :: iwork(*)
     end function stdlib_qla_porcond


end interface 


interface 
     real(sp) module function stdlib_sla_porpvgrw( uplo, ncols, a, lda, af, ldaf, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: ncols, lda, ldaf
           real(sp), intent(in) :: a(lda,*), af(ldaf,*)
           real(sp), intent(out) :: work(*)
     end function stdlib_sla_porpvgrw

     real(dp) module function stdlib_dla_porpvgrw( uplo, ncols, a, lda, af,ldaf, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: ncols, lda, ldaf
           real(dp), intent(in) :: a(lda,*), af(ldaf,*)
           real(dp), intent(out) :: work(*)
     end function stdlib_dla_porpvgrw

     real(qp) module function stdlib_qla_porpvgrw( uplo, ncols, a, lda, af,ldaf, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: ncols, lda, ldaf
           real(qp), intent(in) :: a(lda,*), af(ldaf,*)
           real(qp), intent(out) :: work(*)
     end function stdlib_qla_porpvgrw


     real(sp) module function stdlib_cla_porpvgrw( uplo, ncols, a, lda, af, ldaf, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: ncols, lda, ldaf
           complex(sp), intent(in) :: a(lda,*), af(ldaf,*)
           real(sp), intent(out) :: work(*)
     end function stdlib_cla_porpvgrw

     real(dp) module function stdlib_zla_porpvgrw( uplo, ncols, a, lda, af,ldaf, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: ncols, lda, ldaf
           complex(dp), intent(in) :: a(lda,*), af(ldaf,*)
           real(dp), intent(out) :: work(*)
     end function stdlib_zla_porpvgrw

     real(qp) module function stdlib_wla_porpvgrw( uplo, ncols, a, lda, af,ldaf, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: ncols, lda, ldaf
           complex(qp), intent(in) :: a(lda,*), af(ldaf,*)
           real(qp), intent(out) :: work(*)
     end function stdlib_wla_porpvgrw


end interface 


interface 
     pure module subroutine stdlib_sppcon( uplo, n, ap, anorm, rcond, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ap(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sppcon

     pure module subroutine stdlib_dppcon( uplo, n, ap, anorm, rcond, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ap(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dppcon

     pure module subroutine stdlib_qppcon( uplo, n, ap, anorm, rcond, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ap(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qppcon


     pure module subroutine stdlib_cppcon( uplo, n, ap, anorm, rcond, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cppcon

     pure module subroutine stdlib_zppcon( uplo, n, ap, anorm, rcond, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zppcon

     pure module subroutine stdlib_wppcon( uplo, n, ap, anorm, rcond, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wppcon


end interface 


interface 
     pure module subroutine stdlib_spptrf( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: ap(*)
     end subroutine stdlib_spptrf

     pure module subroutine stdlib_dpptrf( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: ap(*)
     end subroutine stdlib_dpptrf

     pure module subroutine stdlib_qpptrf( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: ap(*)
     end subroutine stdlib_qpptrf


     pure module subroutine stdlib_cpptrf( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_cpptrf

     pure module subroutine stdlib_zpptrf( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_zpptrf

     pure module subroutine stdlib_wpptrf( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_wpptrf


end interface 


interface 
     pure module subroutine stdlib_spptrs( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(in) :: ap(*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_spptrs

     pure module subroutine stdlib_dpptrs( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(in) :: ap(*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dpptrs

     pure module subroutine stdlib_qpptrs( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(in) :: ap(*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qpptrs


     pure module subroutine stdlib_cpptrs( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_cpptrs

     pure module subroutine stdlib_zpptrs( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zpptrs

     pure module subroutine stdlib_wpptrs( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wpptrs


end interface 


interface 
     pure module subroutine stdlib_spptri( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: ap(*)
     end subroutine stdlib_spptri

     pure module subroutine stdlib_dpptri( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: ap(*)
     end subroutine stdlib_dpptri

     pure module subroutine stdlib_qpptri( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: ap(*)
     end subroutine stdlib_qpptri


     pure module subroutine stdlib_cpptri( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_cpptri

     pure module subroutine stdlib_zpptri( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_zpptri

     pure module subroutine stdlib_wpptri( uplo, n, ap, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_wpptri


end interface 


interface 
     pure module subroutine stdlib_spprfs( uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr,berr, work, &
               iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: afp(*), ap(*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_spprfs

     pure module subroutine stdlib_dpprfs( uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr,berr, work, &
               iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: afp(*), ap(*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dpprfs

     pure module subroutine stdlib_qpprfs( uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr,berr, work, &
               iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: afp(*), ap(*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qpprfs


     pure module subroutine stdlib_cpprfs( uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr,berr, work, &
               rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cpprfs

     pure module subroutine stdlib_zpprfs( uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr,berr, work, &
               rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zpprfs

     pure module subroutine stdlib_wpprfs( uplo, n, nrhs, ap, afp, b, ldb, x, ldx, ferr,berr, work, &
               rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wpprfs


end interface 


interface 
     pure module subroutine stdlib_sppequ( uplo, n, ap, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(in) :: ap(*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_sppequ

     pure module subroutine stdlib_dppequ( uplo, n, ap, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(in) :: ap(*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_dppequ

     pure module subroutine stdlib_qppequ( uplo, n, ap, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(in) :: ap(*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_qppequ


     pure module subroutine stdlib_cppequ( uplo, n, ap, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(out) :: s(*)
           complex(sp), intent(in) :: ap(*)
     end subroutine stdlib_cppequ

     pure module subroutine stdlib_zppequ( uplo, n, ap, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(out) :: s(*)
           complex(dp), intent(in) :: ap(*)
     end subroutine stdlib_zppequ

     pure module subroutine stdlib_wppequ( uplo, n, ap, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(out) :: s(*)
           complex(qp), intent(in) :: ap(*)
     end subroutine stdlib_wppequ


end interface 


interface 
     pure module subroutine stdlib_claqhp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(in) :: s(*)
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_claqhp

     pure module subroutine stdlib_zlaqhp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(in) :: s(*)
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_zlaqhp

     pure module subroutine stdlib_wlaqhp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(in) :: s(*)
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_wlaqhp


end interface 


interface 
     pure module subroutine stdlib_spftrf( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: info
           real(sp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_spftrf

     pure module subroutine stdlib_dpftrf( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: info
           real(dp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_dpftrf

     pure module subroutine stdlib_qpftrf( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: info
           real(qp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_qpftrf


     pure module subroutine stdlib_cpftrf( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: info
           complex(sp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_cpftrf

     pure module subroutine stdlib_zpftrf( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: info
           complex(dp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_zpftrf

     pure module subroutine stdlib_wpftrf( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: info
           complex(qp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_wpftrf


end interface 


interface 
     pure module subroutine stdlib_spftrs( transr, uplo, n, nrhs, a, b, ldb, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(in) :: a(0_ilp:*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_spftrs

     pure module subroutine stdlib_dpftrs( transr, uplo, n, nrhs, a, b, ldb, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(in) :: a(0_ilp:*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dpftrs

     pure module subroutine stdlib_qpftrs( transr, uplo, n, nrhs, a, b, ldb, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(in) :: a(0_ilp:*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qpftrs


     pure module subroutine stdlib_cpftrs( transr, uplo, n, nrhs, a, b, ldb, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(sp), intent(in) :: a(0_ilp:*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_cpftrs

     pure module subroutine stdlib_zpftrs( transr, uplo, n, nrhs, a, b, ldb, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(dp), intent(in) :: a(0_ilp:*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zpftrs

     pure module subroutine stdlib_wpftrs( transr, uplo, n, nrhs, a, b, ldb, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(qp), intent(in) :: a(0_ilp:*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wpftrs


end interface 


interface 
     pure module subroutine stdlib_spftri( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_spftri

     pure module subroutine stdlib_dpftri( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_dpftri

     pure module subroutine stdlib_qpftri( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_qpftri


     pure module subroutine stdlib_cpftri( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(sp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_cpftri

     pure module subroutine stdlib_zpftri( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(dp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_zpftri

     pure module subroutine stdlib_wpftri( transr, uplo, n, a, info )
           character, intent(in) :: transr, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           complex(qp), intent(inout) :: a(0_ilp:*)
     end subroutine stdlib_wpftri


end interface 


interface 
     pure module subroutine stdlib_spbcon( uplo, n, kd, ab, ldab, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_spbcon

     pure module subroutine stdlib_dpbcon( uplo, n, kd, ab, ldab, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dpbcon

     pure module subroutine stdlib_qpbcon( uplo, n, kd, ab, ldab, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qpbcon


     pure module subroutine stdlib_cpbcon( uplo, n, kd, ab, ldab, anorm, rcond, work,rwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cpbcon

     pure module subroutine stdlib_zpbcon( uplo, n, kd, ab, ldab, anorm, rcond, work,rwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zpbcon

     pure module subroutine stdlib_wpbcon( uplo, n, kd, ab, ldab, anorm, rcond, work,rwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wpbcon


end interface 


interface 
     pure module subroutine stdlib_spbtrf( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_spbtrf

     pure module subroutine stdlib_dpbtrf( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_dpbtrf

     pure module subroutine stdlib_qpbtrf( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_qpbtrf


     pure module subroutine stdlib_cpbtrf( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           complex(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_cpbtrf

     pure module subroutine stdlib_zpbtrf( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           complex(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_zpbtrf

     pure module subroutine stdlib_wpbtrf( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           complex(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_wpbtrf


end interface 


interface 
     pure module subroutine stdlib_spbtf2( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_spbtf2

     pure module subroutine stdlib_dpbtf2( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_dpbtf2

     pure module subroutine stdlib_qpbtf2( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_qpbtf2


     pure module subroutine stdlib_cpbtf2( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           complex(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_cpbtf2

     pure module subroutine stdlib_zpbtf2( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           complex(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_zpbtf2

     pure module subroutine stdlib_wpbtf2( uplo, n, kd, ab, ldab, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           complex(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_wpbtf2


end interface 


interface 
     pure module subroutine stdlib_spbtrs( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_spbtrs

     pure module subroutine stdlib_dpbtrs( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dpbtrs

     pure module subroutine stdlib_qpbtrs( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qpbtrs


     pure module subroutine stdlib_cpbtrs( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(sp), intent(in) :: ab(ldab,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_cpbtrs

     pure module subroutine stdlib_zpbtrs( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(dp), intent(in) :: ab(ldab,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zpbtrs

     pure module subroutine stdlib_wpbtrs( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(qp), intent(in) :: ab(ldab,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wpbtrs


end interface 


interface 
     pure module subroutine stdlib_spbrfs( uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b,ldb, x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_spbrfs

     pure module subroutine stdlib_dpbrfs( uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b,ldb, x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dpbrfs

     pure module subroutine stdlib_qpbrfs( uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b,ldb, x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qpbrfs


     pure module subroutine stdlib_cpbrfs( uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b,ldb, x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cpbrfs

     pure module subroutine stdlib_zpbrfs( uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b,ldb, x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zpbrfs

     pure module subroutine stdlib_wpbrfs( uplo, n, kd, nrhs, ab, ldab, afb, ldafb, b,ldb, x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wpbrfs


end interface 


interface 
     pure module subroutine stdlib_spbequ( uplo, n, kd, ab, ldab, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(in) :: ab(ldab,*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_spbequ

     pure module subroutine stdlib_dpbequ( uplo, n, kd, ab, ldab, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(in) :: ab(ldab,*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_dpbequ

     pure module subroutine stdlib_qpbequ( uplo, n, kd, ab, ldab, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(in) :: ab(ldab,*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_qpbequ


     pure module subroutine stdlib_cpbequ( uplo, n, kd, ab, ldab, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(out) :: amax, scond
           real(sp), intent(out) :: s(*)
           complex(sp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_cpbequ

     pure module subroutine stdlib_zpbequ( uplo, n, kd, ab, ldab, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(out) :: amax, scond
           real(dp), intent(out) :: s(*)
           complex(dp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_zpbequ

     pure module subroutine stdlib_wpbequ( uplo, n, kd, ab, ldab, s, scond, amax, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(out) :: amax, scond
           real(qp), intent(out) :: s(*)
           complex(qp), intent(in) :: ab(ldab,*)
     end subroutine stdlib_wpbequ


end interface 


interface 
     pure module subroutine stdlib_claqhb( uplo, n, kd, ab, ldab, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: kd, ldab, n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(out) :: s(*)
           complex(sp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_claqhb

     pure module subroutine stdlib_zlaqhb( uplo, n, kd, ab, ldab, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: kd, ldab, n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(out) :: s(*)
           complex(dp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_zlaqhb

     pure module subroutine stdlib_wlaqhb( uplo, n, kd, ab, ldab, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: kd, ldab, n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(out) :: s(*)
           complex(qp), intent(inout) :: ab(ldab,*)
     end subroutine stdlib_wlaqhb


end interface 


interface 
     pure module subroutine stdlib_sptcon( n, d, e, anorm, rcond, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           real(sp), intent(in) :: d(*), e(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sptcon

     pure module subroutine stdlib_dptcon( n, d, e, anorm, rcond, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           real(dp), intent(in) :: d(*), e(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dptcon

     pure module subroutine stdlib_qptcon( n, d, e, anorm, rcond, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           real(qp), intent(in) :: d(*), e(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qptcon


     pure module subroutine stdlib_cptcon( n, d, e, anorm, rcond, rwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           real(sp), intent(in) :: d(*)
           real(sp), intent(out) :: rwork(*)
           complex(sp), intent(in) :: e(*)
     end subroutine stdlib_cptcon

     pure module subroutine stdlib_zptcon( n, d, e, anorm, rcond, rwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           real(dp), intent(in) :: d(*)
           real(dp), intent(out) :: rwork(*)
           complex(dp), intent(in) :: e(*)
     end subroutine stdlib_zptcon

     pure module subroutine stdlib_wptcon( n, d, e, anorm, rcond, rwork, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           real(qp), intent(in) :: d(*)
           real(qp), intent(out) :: rwork(*)
           complex(qp), intent(in) :: e(*)
     end subroutine stdlib_wptcon


end interface 


interface 
     pure module subroutine stdlib_spttrf( n, d, e, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: d(*), e(*)
     end subroutine stdlib_spttrf

     pure module subroutine stdlib_dpttrf( n, d, e, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: d(*), e(*)
     end subroutine stdlib_dpttrf

     pure module subroutine stdlib_qpttrf( n, d, e, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: d(*), e(*)
     end subroutine stdlib_qpttrf


     pure module subroutine stdlib_cpttrf( n, d, e, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(inout) :: d(*)
           complex(sp), intent(inout) :: e(*)
     end subroutine stdlib_cpttrf

     pure module subroutine stdlib_zpttrf( n, d, e, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(inout) :: d(*)
           complex(dp), intent(inout) :: e(*)
     end subroutine stdlib_zpttrf

     pure module subroutine stdlib_wpttrf( n, d, e, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(inout) :: d(*)
           complex(qp), intent(inout) :: e(*)
     end subroutine stdlib_wpttrf


end interface 


interface 
     pure module subroutine stdlib_spttrs( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(inout) :: b(ldb,*)
           real(sp), intent(in) :: d(*), e(*)
     end subroutine stdlib_spttrs

     pure module subroutine stdlib_dpttrs( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(inout) :: b(ldb,*)
           real(dp), intent(in) :: d(*), e(*)
     end subroutine stdlib_dpttrs

     pure module subroutine stdlib_qpttrs( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(inout) :: b(ldb,*)
           real(qp), intent(in) :: d(*), e(*)
     end subroutine stdlib_qpttrs


     pure module subroutine stdlib_cpttrs( uplo, n, nrhs, d, e, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(in) :: d(*)
           complex(sp), intent(inout) :: b(ldb,*)
           complex(sp), intent(in) :: e(*)
     end subroutine stdlib_cpttrs

     pure module subroutine stdlib_zpttrs( uplo, n, nrhs, d, e, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(in) :: d(*)
           complex(dp), intent(inout) :: b(ldb,*)
           complex(dp), intent(in) :: e(*)
     end subroutine stdlib_zpttrs

     pure module subroutine stdlib_wpttrs( uplo, n, nrhs, d, e, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(in) :: d(*)
           complex(qp), intent(inout) :: b(ldb,*)
           complex(qp), intent(in) :: e(*)
     end subroutine stdlib_wpttrs


end interface 


interface 
     pure module subroutine stdlib_sptts2( n, nrhs, d, e, b, ldb )
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(inout) :: b(ldb,*)
           real(sp), intent(in) :: d(*), e(*)
     end subroutine stdlib_sptts2

     pure module subroutine stdlib_dptts2( n, nrhs, d, e, b, ldb )
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(inout) :: b(ldb,*)
           real(dp), intent(in) :: d(*), e(*)
     end subroutine stdlib_dptts2

     pure module subroutine stdlib_qptts2( n, nrhs, d, e, b, ldb )
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(inout) :: b(ldb,*)
           real(qp), intent(in) :: d(*), e(*)
     end subroutine stdlib_qptts2


     pure module subroutine stdlib_cptts2( iuplo, n, nrhs, d, e, b, ldb )
           integer(ilp), intent(in) :: iuplo, ldb, n, nrhs
           real(sp), intent(in) :: d(*)
           complex(sp), intent(inout) :: b(ldb,*)
           complex(sp), intent(in) :: e(*)
     end subroutine stdlib_cptts2

     pure module subroutine stdlib_zptts2( iuplo, n, nrhs, d, e, b, ldb )
           integer(ilp), intent(in) :: iuplo, ldb, n, nrhs
           real(dp), intent(in) :: d(*)
           complex(dp), intent(inout) :: b(ldb,*)
           complex(dp), intent(in) :: e(*)
     end subroutine stdlib_zptts2

     pure module subroutine stdlib_wptts2( iuplo, n, nrhs, d, e, b, ldb )
           integer(ilp), intent(in) :: iuplo, ldb, n, nrhs
           real(qp), intent(in) :: d(*)
           complex(qp), intent(inout) :: b(ldb,*)
           complex(qp), intent(in) :: e(*)
     end subroutine stdlib_wptts2


end interface 


interface 
     pure module subroutine stdlib_sptrfs( n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr,berr, work, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(in) :: b(ldb,*), d(*), df(*), e(*), ef(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_sptrfs

     pure module subroutine stdlib_dptrfs( n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr,berr, work, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(in) :: b(ldb,*), d(*), df(*), e(*), ef(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dptrfs

     pure module subroutine stdlib_qptrfs( n, nrhs, d, e, df, ef, b, ldb, x, ldx, ferr,berr, work, info )
               
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(in) :: b(ldb,*), d(*), df(*), e(*), ef(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qptrfs


     pure module subroutine stdlib_cptrfs( uplo, n, nrhs, d, e, df, ef, b, ldb, x, ldx,ferr, berr, work, &
               rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(in) :: d(*), df(*)
           complex(sp), intent(in) :: b(ldb,*), e(*), ef(*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cptrfs

     pure module subroutine stdlib_zptrfs( uplo, n, nrhs, d, e, df, ef, b, ldb, x, ldx,ferr, berr, work, &
               rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(in) :: d(*), df(*)
           complex(dp), intent(in) :: b(ldb,*), e(*), ef(*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zptrfs

     pure module subroutine stdlib_wptrfs( uplo, n, nrhs, d, e, df, ef, b, ldb, x, ldx,ferr, berr, work, &
               rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(in) :: d(*), df(*)
           complex(qp), intent(in) :: b(ldb,*), e(*), ef(*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wptrfs


end interface 


interface 
     pure module subroutine stdlib_slaqsp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(inout) :: ap(*)
           real(sp), intent(in) :: s(*)
     end subroutine stdlib_slaqsp

     pure module subroutine stdlib_dlaqsp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(inout) :: ap(*)
           real(dp), intent(in) :: s(*)
     end subroutine stdlib_dlaqsp

     pure module subroutine stdlib_qlaqsp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(inout) :: ap(*)
           real(qp), intent(in) :: s(*)
     end subroutine stdlib_qlaqsp


     pure module subroutine stdlib_claqsp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(in) :: s(*)
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_claqsp

     pure module subroutine stdlib_zlaqsp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(in) :: s(*)
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_zlaqsp

     pure module subroutine stdlib_wlaqsp( uplo, n, ap, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(in) :: s(*)
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_wlaqsp


end interface 


interface 
     pure module subroutine stdlib_ssycon( uplo, n, a, lda, ipiv, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssycon

     pure module subroutine stdlib_dsycon( uplo, n, a, lda, ipiv, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsycon

     pure module subroutine stdlib_qsycon( uplo, n, a, lda, ipiv, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsycon


     pure module subroutine stdlib_csycon( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csycon

     pure module subroutine stdlib_zsycon( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsycon

     pure module subroutine stdlib_wsycon( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsycon


end interface 


interface 
     pure module subroutine stdlib_ssytrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytrf

     pure module subroutine stdlib_dsytrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytrf

     pure module subroutine stdlib_qsytrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytrf


     pure module subroutine stdlib_csytrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytrf

     pure module subroutine stdlib_zsytrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytrf

     pure module subroutine stdlib_wsytrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytrf


end interface 


interface 
     pure module subroutine stdlib_slasyf( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: w(ldw,*)
     end subroutine stdlib_slasyf

     pure module subroutine stdlib_dlasyf( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: w(ldw,*)
     end subroutine stdlib_dlasyf

     pure module subroutine stdlib_qlasyf( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: w(ldw,*)
     end subroutine stdlib_qlasyf


     pure module subroutine stdlib_clasyf( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: w(ldw,*)
     end subroutine stdlib_clasyf

     pure module subroutine stdlib_zlasyf( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: w(ldw,*)
     end subroutine stdlib_zlasyf

     pure module subroutine stdlib_wlasyf( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: w(ldw,*)
     end subroutine stdlib_wlasyf


end interface 


interface 
     pure module subroutine stdlib_ssytf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_ssytf2

     pure module subroutine stdlib_dsytf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dsytf2

     pure module subroutine stdlib_qsytf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qsytf2


     pure module subroutine stdlib_csytf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_csytf2

     pure module subroutine stdlib_zsytf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zsytf2

     pure module subroutine stdlib_wsytf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wsytf2


end interface 


interface 
     pure module subroutine stdlib_ssytrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ssytrs

     pure module subroutine stdlib_dsytrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dsytrs

     pure module subroutine stdlib_qsytrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qsytrs


     pure module subroutine stdlib_csytrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_csytrs

     pure module subroutine stdlib_zsytrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zsytrs

     pure module subroutine stdlib_wsytrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wsytrs


end interface 


interface 
     pure module subroutine stdlib_ssytri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytri

     pure module subroutine stdlib_dsytri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytri

     pure module subroutine stdlib_qsytri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytri


     pure module subroutine stdlib_csytri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytri

     pure module subroutine stdlib_zsytri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytri

     pure module subroutine stdlib_wsytri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytri


end interface 


interface 
     pure module subroutine stdlib_ssyrfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_ssyrfs

     pure module subroutine stdlib_dsyrfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dsyrfs

     pure module subroutine stdlib_qsyrfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qsyrfs


     pure module subroutine stdlib_csyrfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_csyrfs

     pure module subroutine stdlib_zsyrfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zsyrfs

     pure module subroutine stdlib_wsyrfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wsyrfs


end interface 


interface 
     pure module subroutine stdlib_ssyequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: s(*), work(*)
     end subroutine stdlib_ssyequb

     pure module subroutine stdlib_dsyequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: s(*), work(*)
     end subroutine stdlib_dsyequb

     pure module subroutine stdlib_qsyequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: s(*), work(*)
     end subroutine stdlib_qsyequb


     pure module subroutine stdlib_csyequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_csyequb

     pure module subroutine stdlib_zsyequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_zsyequb

     pure module subroutine stdlib_wsyequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_wsyequb


end interface 


interface 
     pure module subroutine stdlib_ssyconv( uplo, way, n, a, lda, ipiv, e, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: e(*)
     end subroutine stdlib_ssyconv

     pure module subroutine stdlib_dsyconv( uplo, way, n, a, lda, ipiv, e, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: e(*)
     end subroutine stdlib_dsyconv

     pure module subroutine stdlib_qsyconv( uplo, way, n, a, lda, ipiv, e, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: e(*)
     end subroutine stdlib_qsyconv


     pure module subroutine stdlib_csyconv( uplo, way, n, a, lda, ipiv, e, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: e(*)
     end subroutine stdlib_csyconv

     pure module subroutine stdlib_zsyconv( uplo, way, n, a, lda, ipiv, e, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: e(*)
     end subroutine stdlib_zsyconv

     pure module subroutine stdlib_wsyconv( uplo, way, n, a, lda, ipiv, e, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: e(*)
     end subroutine stdlib_wsyconv


end interface 


interface 
     pure module subroutine stdlib_ssytrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytrs2

     pure module subroutine stdlib_dsytrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytrs2

     pure module subroutine stdlib_qsytrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytrs2


     pure module subroutine stdlib_csytrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytrs2

     pure module subroutine stdlib_zsytrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytrs2

     pure module subroutine stdlib_wsytrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytrs2


end interface 


interface 
     pure module subroutine stdlib_ssytrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: a(lda,*), e(*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ssytrs_3

     pure module subroutine stdlib_dsytrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: a(lda,*), e(*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dsytrs_3

     pure module subroutine stdlib_qsytrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: a(lda,*), e(*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qsytrs_3


     pure module subroutine stdlib_csytrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*), e(*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_csytrs_3

     pure module subroutine stdlib_zsytrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*), e(*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zsytrs_3

     pure module subroutine stdlib_wsytrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*), e(*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wsytrs_3


end interface 


interface 
     pure module subroutine stdlib_ssyswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           real(sp), intent(inout) :: a(lda,n)
     end subroutine stdlib_ssyswapr

     pure module subroutine stdlib_dsyswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           real(dp), intent(inout) :: a(lda,n)
     end subroutine stdlib_dsyswapr

     pure module subroutine stdlib_qsyswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           real(qp), intent(inout) :: a(lda,n)
     end subroutine stdlib_qsyswapr


     pure module subroutine stdlib_csyswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           complex(sp), intent(inout) :: a(lda,n)
     end subroutine stdlib_csyswapr

     pure module subroutine stdlib_zsyswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           complex(dp), intent(inout) :: a(lda,n)
     end subroutine stdlib_zsyswapr

     pure module subroutine stdlib_wsyswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           complex(qp), intent(inout) :: a(lda,n)
     end subroutine stdlib_wsyswapr


end interface 


interface 
     real(sp) module function stdlib_cla_herpvgrw( uplo, n, info, a, lda, af, ldaf, ipiv,work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, info, lda, ldaf
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*), af(ldaf,*)
           real(sp), intent(out) :: work(*)
     end function stdlib_cla_herpvgrw

     real(dp) module function stdlib_zla_herpvgrw( uplo, n, info, a, lda, af,ldaf, ipiv, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, info, lda, ldaf
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*), af(ldaf,*)
           real(dp), intent(out) :: work(*)
     end function stdlib_zla_herpvgrw

     real(qp) module function stdlib_wla_herpvgrw( uplo, n, info, a, lda, af,ldaf, ipiv, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, info, lda, ldaf
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*), af(ldaf,*)
           real(qp), intent(out) :: work(*)
     end function stdlib_wla_herpvgrw


end interface 


interface 
     pure module subroutine stdlib_sspcon( uplo, n, ap, ipiv, anorm, rcond, work, iwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: ap(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_sspcon

     pure module subroutine stdlib_dspcon( uplo, n, ap, ipiv, anorm, rcond, work, iwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: ap(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dspcon

     pure module subroutine stdlib_qspcon( uplo, n, ap, ipiv, anorm, rcond, work, iwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: ap(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qspcon


     pure module subroutine stdlib_cspcon( uplo, n, ap, ipiv, anorm, rcond, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_cspcon

     pure module subroutine stdlib_zspcon( uplo, n, ap, ipiv, anorm, rcond, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zspcon

     pure module subroutine stdlib_wspcon( uplo, n, ap, ipiv, anorm, rcond, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wspcon


end interface 


interface 
     pure module subroutine stdlib_ssptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: ap(*)
     end subroutine stdlib_ssptrf

     pure module subroutine stdlib_dsptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: ap(*)
     end subroutine stdlib_dsptrf

     pure module subroutine stdlib_qsptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: ap(*)
     end subroutine stdlib_qsptrf


     pure module subroutine stdlib_csptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_csptrf

     pure module subroutine stdlib_zsptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_zsptrf

     pure module subroutine stdlib_wsptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_wsptrf


end interface 


interface 
     pure module subroutine stdlib_ssptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: ap(*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ssptrs

     pure module subroutine stdlib_dsptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: ap(*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dsptrs

     pure module subroutine stdlib_qsptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: ap(*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qsptrs


     pure module subroutine stdlib_csptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_csptrs

     pure module subroutine stdlib_zsptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zsptrs

     pure module subroutine stdlib_wsptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wsptrs


end interface 


interface 
     pure module subroutine stdlib_ssptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: ap(*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssptri

     pure module subroutine stdlib_dsptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: ap(*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsptri

     pure module subroutine stdlib_qsptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: ap(*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsptri


     pure module subroutine stdlib_csptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: ap(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csptri

     pure module subroutine stdlib_zsptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: ap(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsptri

     pure module subroutine stdlib_wsptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: ap(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsptri


end interface 


interface 
     pure module subroutine stdlib_ssprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: afp(*), ap(*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*)
           real(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_ssprfs

     pure module subroutine stdlib_dsprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: afp(*), ap(*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*)
           real(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_dsprfs

     pure module subroutine stdlib_qsprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                iwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: afp(*), ap(*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*)
           real(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_qsprfs


     pure module subroutine stdlib_csprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_csprfs

     pure module subroutine stdlib_zsprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zsprfs

     pure module subroutine stdlib_wsprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wsprfs


end interface 


interface 
     pure module subroutine stdlib_ssycon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssycon_rook

     pure module subroutine stdlib_dsycon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsycon_rook

     pure module subroutine stdlib_qsycon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,iwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsycon_rook


     pure module subroutine stdlib_csycon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csycon_rook

     pure module subroutine stdlib_zsycon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsycon_rook

     pure module subroutine stdlib_wsycon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsycon_rook


end interface 


interface 
     pure module subroutine stdlib_ssytrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytrf_rook

     pure module subroutine stdlib_dsytrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytrf_rook

     pure module subroutine stdlib_qsytrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytrf_rook


     pure module subroutine stdlib_csytrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytrf_rook

     pure module subroutine stdlib_zsytrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytrf_rook

     pure module subroutine stdlib_wsytrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytrf_rook


end interface 


interface 
     pure module subroutine stdlib_slasyf_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: w(ldw,*)
     end subroutine stdlib_slasyf_rook

     pure module subroutine stdlib_dlasyf_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: w(ldw,*)
     end subroutine stdlib_dlasyf_rook

     pure module subroutine stdlib_qlasyf_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: w(ldw,*)
     end subroutine stdlib_qlasyf_rook


     pure module subroutine stdlib_clasyf_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: w(ldw,*)
     end subroutine stdlib_clasyf_rook

     pure module subroutine stdlib_zlasyf_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: w(ldw,*)
     end subroutine stdlib_zlasyf_rook

     pure module subroutine stdlib_wlasyf_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: w(ldw,*)
     end subroutine stdlib_wlasyf_rook


end interface 


interface 
     pure module subroutine stdlib_ssytf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_ssytf2_rook

     pure module subroutine stdlib_dsytf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_dsytf2_rook

     pure module subroutine stdlib_qsytf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_qsytf2_rook


     pure module subroutine stdlib_csytf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_csytf2_rook

     pure module subroutine stdlib_zsytf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zsytf2_rook

     pure module subroutine stdlib_wsytf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wsytf2_rook


end interface 


interface 
     pure module subroutine stdlib_ssytrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_ssytrs_rook

     pure module subroutine stdlib_dsytrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_dsytrs_rook

     pure module subroutine stdlib_qsytrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_qsytrs_rook


     pure module subroutine stdlib_csytrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_csytrs_rook

     pure module subroutine stdlib_zsytrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zsytrs_rook

     pure module subroutine stdlib_wsytrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_wsytrs_rook


end interface 


interface 
     pure module subroutine stdlib_ssytri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytri_rook

     pure module subroutine stdlib_dsytri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytri_rook

     pure module subroutine stdlib_qsytri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytri_rook


     pure module subroutine stdlib_csytri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytri_rook

     pure module subroutine stdlib_zsytri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytri_rook

     pure module subroutine stdlib_wsytri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytri_rook


end interface 


interface 
     pure module subroutine stdlib_ssytrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: e(*), work(*)
     end subroutine stdlib_ssytrf_rk

     pure module subroutine stdlib_dsytrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: e(*), work(*)
     end subroutine stdlib_dsytrf_rk

     pure module subroutine stdlib_qsytrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: e(*), work(*)
     end subroutine stdlib_qsytrf_rk


     pure module subroutine stdlib_csytrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: e(*), work(*)
     end subroutine stdlib_csytrf_rk

     pure module subroutine stdlib_zsytrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: e(*), work(*)
     end subroutine stdlib_zsytrf_rk

     pure module subroutine stdlib_wsytrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: e(*), work(*)
     end subroutine stdlib_wsytrf_rk


end interface 


interface 
     pure module subroutine stdlib_slasyf_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: e(*), w(ldw,*)
     end subroutine stdlib_slasyf_rk

     pure module subroutine stdlib_dlasyf_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: e(*), w(ldw,*)
     end subroutine stdlib_dlasyf_rk

     pure module subroutine stdlib_qlasyf_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: e(*), w(ldw,*)
     end subroutine stdlib_qlasyf_rk


     pure module subroutine stdlib_clasyf_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: e(*), w(ldw,*)
     end subroutine stdlib_clasyf_rk

     pure module subroutine stdlib_zlasyf_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: e(*), w(ldw,*)
     end subroutine stdlib_zlasyf_rk

     pure module subroutine stdlib_wlasyf_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: e(*), w(ldw,*)
     end subroutine stdlib_wlasyf_rk


end interface 


interface 
     pure module subroutine stdlib_ssytf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: e(*)
     end subroutine stdlib_ssytf2_rk

     pure module subroutine stdlib_dsytf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: e(*)
     end subroutine stdlib_dsytf2_rk

     pure module subroutine stdlib_qsytf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: e(*)
     end subroutine stdlib_qsytf2_rk


     pure module subroutine stdlib_csytf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: e(*)
     end subroutine stdlib_csytf2_rk

     pure module subroutine stdlib_zsytf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: e(*)
     end subroutine stdlib_zsytf2_rk

     pure module subroutine stdlib_wsytf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: e(*)
     end subroutine stdlib_wsytf2_rk


end interface 


interface 
     pure module subroutine stdlib_ssyconvf( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_ssyconvf

     pure module subroutine stdlib_dsyconvf( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_dsyconvf

     pure module subroutine stdlib_qsyconvf( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_qsyconvf


     pure module subroutine stdlib_csyconvf( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(inout) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_csyconvf

     pure module subroutine stdlib_zsyconvf( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(inout) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_zsyconvf

     pure module subroutine stdlib_wsyconvf( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(inout) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_wsyconvf


end interface 


interface 
     pure module subroutine stdlib_ssyconvf_rook( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_ssyconvf_rook

     pure module subroutine stdlib_dsyconvf_rook( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_dsyconvf_rook

     pure module subroutine stdlib_qsyconvf_rook( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_qsyconvf_rook


     pure module subroutine stdlib_csyconvf_rook( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_csyconvf_rook

     pure module subroutine stdlib_zsyconvf_rook( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_zsyconvf_rook

     pure module subroutine stdlib_wsyconvf_rook( uplo, way, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo, way
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), e(*)
     end subroutine stdlib_wsyconvf_rook


end interface 


interface 
     pure module subroutine stdlib_ssytrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytrf_aa

     pure module subroutine stdlib_dsytrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytrf_aa

     pure module subroutine stdlib_qsytrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytrf_aa


     pure module subroutine stdlib_csytrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytrf_aa

     pure module subroutine stdlib_zsytrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytrf_aa

     pure module subroutine stdlib_wsytrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytrf_aa


end interface 


interface 
     pure module subroutine stdlib_slasyf_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), h(ldh,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_slasyf_aa

     pure module subroutine stdlib_dlasyf_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), h(ldh,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dlasyf_aa

     pure module subroutine stdlib_qlasyf_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), h(ldh,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qlasyf_aa


     pure module subroutine stdlib_clasyf_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), h(ldh,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_clasyf_aa

     pure module subroutine stdlib_zlasyf_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), h(ldh,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zlasyf_aa

     pure module subroutine stdlib_wlasyf_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), h(ldh,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wlasyf_aa


end interface 


interface 
     pure module subroutine stdlib_ssytrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(in) :: a(lda,*)
           real(sp), intent(inout) :: b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssytrs_aa

     pure module subroutine stdlib_dsytrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(in) :: a(lda,*)
           real(dp), intent(inout) :: b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsytrs_aa

     pure module subroutine stdlib_qsytrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(in) :: a(lda,*)
           real(qp), intent(inout) :: b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsytrs_aa


     pure module subroutine stdlib_csytrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csytrs_aa

     pure module subroutine stdlib_zsytrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsytrs_aa

     pure module subroutine stdlib_wsytrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsytrs_aa


end interface 


interface 
     pure module subroutine stdlib_checon( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_checon

     pure module subroutine stdlib_zhecon( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhecon

     pure module subroutine stdlib_whecon( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whecon


end interface 


interface 
     pure module subroutine stdlib_chetrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetrf

     pure module subroutine stdlib_zhetrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetrf

     pure module subroutine stdlib_whetrf( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetrf


end interface 


interface 
     pure module subroutine stdlib_clahef( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: w(ldw,*)
     end subroutine stdlib_clahef

     pure module subroutine stdlib_zlahef( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: w(ldw,*)
     end subroutine stdlib_zlahef

     pure module subroutine stdlib_wlahef( uplo, n, nb, kb, a, lda, ipiv, w, ldw, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: w(ldw,*)
     end subroutine stdlib_wlahef


end interface 


interface 
     pure module subroutine stdlib_chetf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_chetf2

     pure module subroutine stdlib_zhetf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zhetf2

     pure module subroutine stdlib_whetf2( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_whetf2


end interface 


interface 
     pure module subroutine stdlib_chetrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_chetrs

     pure module subroutine stdlib_zhetrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zhetrs

     pure module subroutine stdlib_whetrs( uplo, n, nrhs, a, lda, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_whetrs


end interface 


interface 
     pure module subroutine stdlib_chetri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetri

     pure module subroutine stdlib_zhetri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetri

     pure module subroutine stdlib_whetri( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetri


end interface 


interface 
     pure module subroutine stdlib_cherfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_cherfs

     pure module subroutine stdlib_zherfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zherfs

     pure module subroutine stdlib_wherfs( uplo, n, nrhs, a, lda, af, ldaf, ipiv, b, ldb,x, ldx, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_wherfs


end interface 


interface 
     pure module subroutine stdlib_cheequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
           real(sp), intent(out) :: s(*)
     end subroutine stdlib_cheequb

     pure module subroutine stdlib_zheequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
           real(dp), intent(out) :: s(*)
     end subroutine stdlib_zheequb

     pure module subroutine stdlib_wheequb( uplo, n, a, lda, s, scond, amax, work, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(out) :: amax, scond
           character, intent(in) :: uplo
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
           real(qp), intent(out) :: s(*)
     end subroutine stdlib_wheequb


end interface 


interface 
     pure module subroutine stdlib_chetrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetrs2

     pure module subroutine stdlib_zhetrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetrs2

     pure module subroutine stdlib_whetrs2( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetrs2


end interface 


interface 
     pure module subroutine stdlib_chetrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*), e(*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_chetrs_3

     pure module subroutine stdlib_zhetrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*), e(*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zhetrs_3

     pure module subroutine stdlib_whetrs_3( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*), e(*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_whetrs_3


end interface 


interface 
     pure module subroutine stdlib_cheswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           complex(sp), intent(inout) :: a(lda,n)
     end subroutine stdlib_cheswapr

     pure module subroutine stdlib_zheswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           complex(dp), intent(inout) :: a(lda,n)
     end subroutine stdlib_zheswapr

     pure module subroutine stdlib_wheswapr( uplo, n, a, lda, i1, i2)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: i1, i2, lda, n
           complex(qp), intent(inout) :: a(lda,n)
     end subroutine stdlib_wheswapr


end interface 


interface 
     pure module subroutine stdlib_chpcon( uplo, n, ap, ipiv, anorm, rcond, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chpcon

     pure module subroutine stdlib_zhpcon( uplo, n, ap, ipiv, anorm, rcond, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhpcon

     pure module subroutine stdlib_whpcon( uplo, n, ap, ipiv, anorm, rcond, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whpcon


end interface 


interface 
     pure module subroutine stdlib_chptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ap(*)
     end subroutine stdlib_chptrf

     pure module subroutine stdlib_zhptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ap(*)
     end subroutine stdlib_zhptrf

     pure module subroutine stdlib_whptrf( uplo, n, ap, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ap(*)
     end subroutine stdlib_whptrf


end interface 


interface 
     pure module subroutine stdlib_chptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: ap(*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_chptrs

     pure module subroutine stdlib_zhptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: ap(*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zhptrs

     pure module subroutine stdlib_whptrs( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: ap(*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_whptrs


end interface 


interface 
     pure module subroutine stdlib_chptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: ap(*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chptri

     pure module subroutine stdlib_zhptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: ap(*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhptri

     pure module subroutine stdlib_whptri( uplo, n, ap, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: ap(*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whptri


end interface 


interface 
     pure module subroutine stdlib_chprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
           complex(sp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_chprfs

     pure module subroutine stdlib_zhprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
           complex(dp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_zhprfs

     pure module subroutine stdlib_whprfs( uplo, n, nrhs, ap, afp, ipiv, b, ldb, x, ldx,ferr, berr, work,&
                rwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: afp(*), ap(*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
           complex(qp), intent(inout) :: x(ldx,*)
     end subroutine stdlib_whprfs


end interface 


interface 
     pure module subroutine stdlib_checon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: anorm
           real(sp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_checon_rook

     pure module subroutine stdlib_zhecon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: anorm
           real(dp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhecon_rook

     pure module subroutine stdlib_whecon_rook( uplo, n, a, lda, ipiv, anorm, rcond, work,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: anorm
           real(qp), intent(out) :: rcond
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whecon_rook


end interface 


interface 
     pure module subroutine stdlib_chetrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetrf_rook

     pure module subroutine stdlib_zhetrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetrf_rook

     pure module subroutine stdlib_whetrf_rook( uplo, n, a, lda, ipiv, work, lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetrf_rook


end interface 


interface 
     pure module subroutine stdlib_clahef_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: w(ldw,*)
     end subroutine stdlib_clahef_rook

     pure module subroutine stdlib_zlahef_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: w(ldw,*)
     end subroutine stdlib_zlahef_rook

     pure module subroutine stdlib_wlahef_rook( uplo, n, nb, kb, a, lda, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: w(ldw,*)
     end subroutine stdlib_wlahef_rook


end interface 


interface 
     pure module subroutine stdlib_chetf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_chetf2_rook

     pure module subroutine stdlib_zhetf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zhetf2_rook

     pure module subroutine stdlib_whetf2_rook( uplo, n, a, lda, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_whetf2_rook


end interface 


interface 
     pure module subroutine stdlib_chetrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_chetrs_rook

     pure module subroutine stdlib_zhetrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_zhetrs_rook

     pure module subroutine stdlib_whetrs_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
     end subroutine stdlib_whetrs_rook


end interface 


interface 
     pure module subroutine stdlib_chetri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetri_rook

     pure module subroutine stdlib_zhetri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetri_rook

     pure module subroutine stdlib_whetri_rook( uplo, n, a, lda, ipiv, work, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetri_rook


end interface 


interface 
     pure module subroutine stdlib_chetrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: e(*), work(*)
     end subroutine stdlib_chetrf_rk

     pure module subroutine stdlib_zhetrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: e(*), work(*)
     end subroutine stdlib_zhetrf_rk

     pure module subroutine stdlib_whetrf_rk( uplo, n, a, lda, e, ipiv, work, lwork,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, lwork, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: e(*), work(*)
     end subroutine stdlib_whetrf_rk


end interface 


interface 
     pure module subroutine stdlib_clahef_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: w(ldw,*), e(*)
     end subroutine stdlib_clahef_rk

     pure module subroutine stdlib_zlahef_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: w(ldw,*), e(*)
     end subroutine stdlib_zlahef_rk

     pure module subroutine stdlib_wlahef_rk( uplo, n, nb, kb, a, lda, e, ipiv, w, ldw,info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info, kb
           integer(ilp), intent(in) :: lda, ldw, n, nb
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: w(ldw,*), e(*)
     end subroutine stdlib_wlahef_rk


end interface 


interface 
     pure module subroutine stdlib_chetf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: e(*)
     end subroutine stdlib_chetf2_rk

     pure module subroutine stdlib_zhetf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: e(*)
     end subroutine stdlib_zhetf2_rk

     pure module subroutine stdlib_whetf2_rk( uplo, n, a, lda, e, ipiv, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, n
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: e(*)
     end subroutine stdlib_whetf2_rk


end interface 


interface 
     pure module subroutine stdlib_chetrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetrf_aa

     pure module subroutine stdlib_zhetrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetrf_aa

     pure module subroutine stdlib_whetrf_aa( uplo, n, a, lda, ipiv, work, lwork, info)
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, lda, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetrf_aa


end interface 


interface 
     pure module subroutine stdlib_clahef_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), h(ldh,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_clahef_aa

     pure module subroutine stdlib_zlahef_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), h(ldh,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zlahef_aa

     pure module subroutine stdlib_wlahef_aa( uplo, j1, m, nb, a, lda, ipiv,h, ldh, work )
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: m, nb, j1, lda, ldh
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), h(ldh,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wlahef_aa


end interface 


interface 
     pure module subroutine stdlib_chetrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           complex(sp), intent(in) :: a(lda,*)
           complex(sp), intent(inout) :: b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chetrs_aa

     pure module subroutine stdlib_zhetrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           complex(dp), intent(in) :: a(lda,*)
           complex(dp), intent(inout) :: b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhetrs_aa

     pure module subroutine stdlib_whetrs_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: n, nrhs, lda, ldb, lwork
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ipiv(*)
           complex(qp), intent(in) :: a(lda,*)
           complex(qp), intent(inout) :: b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whetrs_aa


end interface 


interface 
     pure module subroutine stdlib_slaqsy( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(inout) :: a(lda,*)
           real(sp), intent(in) :: s(*)
     end subroutine stdlib_slaqsy

     pure module subroutine stdlib_dlaqsy( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(inout) :: a(lda,*)
           real(dp), intent(in) :: s(*)
     end subroutine stdlib_dlaqsy

     pure module subroutine stdlib_qlaqsy( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(inout) :: a(lda,*)
           real(qp), intent(in) :: s(*)
     end subroutine stdlib_qlaqsy


     pure module subroutine stdlib_claqsy( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(sp), intent(in) :: amax, scond
           real(sp), intent(in) :: s(*)
           complex(sp), intent(inout) :: a(lda,*)
     end subroutine stdlib_claqsy

     pure module subroutine stdlib_zlaqsy( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(dp), intent(in) :: amax, scond
           real(dp), intent(in) :: s(*)
           complex(dp), intent(inout) :: a(lda,*)
     end subroutine stdlib_zlaqsy

     pure module subroutine stdlib_wlaqsy( uplo, n, a, lda, s, scond, amax, equed )
           character, intent(out) :: equed
           character, intent(in) :: uplo
           integer(ilp), intent(in) :: lda, n
           real(qp), intent(in) :: amax, scond
           real(qp), intent(in) :: s(*)
           complex(qp), intent(inout) :: a(lda,*)
     end subroutine stdlib_wlaqsy


end interface 


interface 
     pure module subroutine stdlib_sposv( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_sposv

     pure module subroutine stdlib_dposv( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_dposv

     pure module subroutine stdlib_qposv( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_qposv


     pure module subroutine stdlib_cposv( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_cposv

     pure module subroutine stdlib_zposv( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_zposv

     pure module subroutine stdlib_wposv( uplo, n, nrhs, a, lda, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, n, nrhs
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
     end subroutine stdlib_wposv


end interface 


interface 
     module subroutine stdlib_sposvx( fact, uplo, n, nrhs, a, lda, af, ldaf, equed,s, b, ldb, x, ldx, &
               rcond, ferr, berr, work,iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*), s(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_sposvx

     module subroutine stdlib_dposvx( fact, uplo, n, nrhs, a, lda, af, ldaf, equed,s, b, ldb, x, ldx, &
               rcond, ferr, berr, work,iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*), s(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dposvx

     module subroutine stdlib_qposvx( fact, uplo, n, nrhs, a, lda, af, ldaf, equed,s, b, ldb, x, ldx, &
               rcond, ferr, berr, work,iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*), s(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qposvx


     module subroutine stdlib_cposvx( fact, uplo, n, nrhs, a, lda, af, ldaf, equed,s, b, ldb, x, ldx, &
               rcond, ferr, berr, work,rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(inout) :: s(*)
           complex(sp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cposvx

     module subroutine stdlib_zposvx( fact, uplo, n, nrhs, a, lda, af, ldaf, equed,s, b, ldb, x, ldx, &
               rcond, ferr, berr, work,rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(inout) :: s(*)
           complex(dp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zposvx

     module subroutine stdlib_wposvx( fact, uplo, n, nrhs, a, lda, af, ldaf, equed,s, b, ldb, x, ldx, &
               rcond, ferr, berr, work,rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(inout) :: s(*)
           complex(qp), intent(inout) :: a(lda,*), af(ldaf,*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wposvx


end interface 


interface 
     pure module subroutine stdlib_sppsv( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_sppsv

     pure module subroutine stdlib_dppsv( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_dppsv

     pure module subroutine stdlib_qppsv( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_qppsv


     pure module subroutine stdlib_cppsv( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(sp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_cppsv

     pure module subroutine stdlib_zppsv( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(dp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_zppsv

     pure module subroutine stdlib_wppsv( uplo, n, nrhs, ap, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           complex(qp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_wppsv


end interface 


interface 
     module subroutine stdlib_sppsvx( fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb,x, ldx, rcond, ferr,&
                berr, work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: afp(*), ap(*), b(ldb,*), s(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_sppsvx

     module subroutine stdlib_dppsvx( fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb,x, ldx, rcond, ferr,&
                berr, work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: afp(*), ap(*), b(ldb,*), s(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dppsvx

     module subroutine stdlib_qppsvx( fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb,x, ldx, rcond, ferr,&
                berr, work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: afp(*), ap(*), b(ldb,*), s(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qppsvx


     module subroutine stdlib_cppsvx( fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb,x, ldx, rcond, ferr,&
                berr, work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(inout) :: s(*)
           complex(sp), intent(inout) :: afp(*), ap(*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cppsvx

     module subroutine stdlib_zppsvx( fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb,x, ldx, rcond, ferr,&
                berr, work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(inout) :: s(*)
           complex(dp), intent(inout) :: afp(*), ap(*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zppsvx

     module subroutine stdlib_wppsvx( fact, uplo, n, nrhs, ap, afp, equed, s, b, ldb,x, ldx, rcond, ferr,&
                berr, work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(inout) :: s(*)
           complex(qp), intent(inout) :: afp(*), ap(*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wppsvx


end interface 


interface 
     pure module subroutine stdlib_spbsv( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(sp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_spbsv

     pure module subroutine stdlib_dpbsv( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(dp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_dpbsv

     pure module subroutine stdlib_qpbsv( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           real(qp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_qpbsv


     pure module subroutine stdlib_cpbsv( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(sp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_cpbsv

     pure module subroutine stdlib_zpbsv( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(dp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_zpbsv

     pure module subroutine stdlib_wpbsv( uplo, n, kd, nrhs, ab, ldab, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldb, n, nrhs
           complex(qp), intent(inout) :: ab(ldab,*), b(ldb,*)
     end subroutine stdlib_wpbsv


end interface 


interface 
     module subroutine stdlib_spbsvx( fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb,equed, s, b, ldb, x, &
               ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*), s(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_spbsvx

     module subroutine stdlib_dpbsvx( fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb,equed, s, b, ldb, x, &
               ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*), s(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dpbsvx

     module subroutine stdlib_qpbsvx( fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb,equed, s, b, ldb, x, &
               ldx, rcond, ferr, berr,work, iwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*), s(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qpbsvx


     module subroutine stdlib_cpbsvx( fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb,equed, s, b, ldb, x, &
               ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(inout) :: s(*)
           complex(sp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cpbsvx

     module subroutine stdlib_zpbsvx( fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb,equed, s, b, ldb, x, &
               ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(inout) :: s(*)
           complex(dp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zpbsvx

     module subroutine stdlib_wpbsvx( fact, uplo, n, kd, nrhs, ab, ldab, afb, ldafb,equed, s, b, ldb, x, &
               ldx, rcond, ferr, berr,work, rwork, info )
           character, intent(inout) :: equed
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: kd, ldab, ldafb, ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(inout) :: s(*)
           complex(qp), intent(inout) :: ab(ldab,*), afb(ldafb,*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wpbsvx


end interface 


interface 
     pure module subroutine stdlib_sptsv( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(inout) :: b(ldb,*), d(*), e(*)
     end subroutine stdlib_sptsv

     pure module subroutine stdlib_dptsv( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(inout) :: b(ldb,*), d(*), e(*)
     end subroutine stdlib_dptsv

     pure module subroutine stdlib_qptsv( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(inout) :: b(ldb,*), d(*), e(*)
     end subroutine stdlib_qptsv


     pure module subroutine stdlib_cptsv( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(sp), intent(inout) :: d(*)
           complex(sp), intent(inout) :: b(ldb,*), e(*)
     end subroutine stdlib_cptsv

     pure module subroutine stdlib_zptsv( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(dp), intent(inout) :: d(*)
           complex(dp), intent(inout) :: b(ldb,*), e(*)
     end subroutine stdlib_zptsv

     pure module subroutine stdlib_wptsv( n, nrhs, d, e, b, ldb, info )
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           real(qp), intent(inout) :: d(*)
           complex(qp), intent(inout) :: b(ldb,*), e(*)
     end subroutine stdlib_wptsv


end interface 


interface 
     pure module subroutine stdlib_sptsvx( fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx,rcond, ferr, berr,&
                work, info )
           character, intent(in) :: fact
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           real(sp), intent(in) :: b(ldb,*), d(*), e(*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
           real(sp), intent(inout) :: df(*), ef(*)
     end subroutine stdlib_sptsvx

     pure module subroutine stdlib_dptsvx( fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx,rcond, ferr, berr,&
                work, info )
           character, intent(in) :: fact
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           real(dp), intent(in) :: b(ldb,*), d(*), e(*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
           real(dp), intent(inout) :: df(*), ef(*)
     end subroutine stdlib_dptsvx

     pure module subroutine stdlib_qptsvx( fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx,rcond, ferr, berr,&
                work, info )
           character, intent(in) :: fact
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           real(qp), intent(in) :: b(ldb,*), d(*), e(*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
           real(qp), intent(inout) :: df(*), ef(*)
     end subroutine stdlib_qptsvx


     pure module subroutine stdlib_cptsvx( fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx,rcond, ferr, berr,&
                work, rwork, info )
           character, intent(in) :: fact
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(sp), intent(in) :: d(*)
           real(sp), intent(inout) :: df(*)
           complex(sp), intent(in) :: b(ldb,*), e(*)
           complex(sp), intent(inout) :: ef(*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cptsvx

     pure module subroutine stdlib_zptsvx( fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx,rcond, ferr, berr,&
                work, rwork, info )
           character, intent(in) :: fact
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(dp), intent(in) :: d(*)
           real(dp), intent(inout) :: df(*)
           complex(dp), intent(in) :: b(ldb,*), e(*)
           complex(dp), intent(inout) :: ef(*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zptsvx

     pure module subroutine stdlib_wptsvx( fact, n, nrhs, d, e, df, ef, b, ldb, x, ldx,rcond, ferr, berr,&
                work, rwork, info )
           character, intent(in) :: fact
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           real(qp), intent(in) :: d(*)
           real(qp), intent(inout) :: df(*)
           complex(qp), intent(in) :: b(ldb,*), e(*)
           complex(qp), intent(inout) :: ef(*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wptsvx


end interface 


interface 
     pure module subroutine stdlib_ssysv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssysv

     pure module subroutine stdlib_dsysv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsysv

     pure module subroutine stdlib_qsysv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsysv


     pure module subroutine stdlib_csysv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csysv

     pure module subroutine stdlib_zsysv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsysv

     pure module subroutine stdlib_wsysv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsysv


end interface 


interface 
     module subroutine stdlib_ssysvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,iwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(in) :: a(lda,*), b(ldb,*)
           real(sp), intent(inout) :: af(ldaf,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_ssysvx

     module subroutine stdlib_dsysvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,iwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(in) :: a(lda,*), b(ldb,*)
           real(dp), intent(inout) :: af(ldaf,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dsysvx

     module subroutine stdlib_qsysvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,iwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(in) :: a(lda,*), b(ldb,*)
           real(qp), intent(inout) :: af(ldaf,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qsysvx


     module subroutine stdlib_csysvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), b(ldb,*)
           complex(sp), intent(inout) :: af(ldaf,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_csysvx

     module subroutine stdlib_zsysvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), b(ldb,*)
           complex(dp), intent(inout) :: af(ldaf,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zsysvx

     module subroutine stdlib_wsysvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), b(ldb,*)
           complex(qp), intent(inout) :: af(ldaf,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wsysvx


end interface 


interface 
     pure module subroutine stdlib_ssysv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: e(*), work(*)
     end subroutine stdlib_ssysv_rk

     pure module subroutine stdlib_dsysv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: e(*), work(*)
     end subroutine stdlib_dsysv_rk

     pure module subroutine stdlib_qsysv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb,work, lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: e(*), work(*)
     end subroutine stdlib_qsysv_rk


     pure module subroutine stdlib_csysv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: e(*), work(*)
     end subroutine stdlib_csysv_rk

     pure module subroutine stdlib_zsysv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: e(*), work(*)
     end subroutine stdlib_zsysv_rk

     pure module subroutine stdlib_wsysv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: e(*), work(*)
     end subroutine stdlib_wsysv_rk


end interface 


interface 
     pure module subroutine stdlib_ssysv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssysv_rook

     pure module subroutine stdlib_dsysv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsysv_rook

     pure module subroutine stdlib_qsysv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsysv_rook


     pure module subroutine stdlib_csysv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csysv_rook

     pure module subroutine stdlib_zsysv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsysv_rook

     pure module subroutine stdlib_wsysv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsysv_rook


end interface 


interface 
     pure module subroutine stdlib_chesv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chesv

     pure module subroutine stdlib_zhesv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhesv

     pure module subroutine stdlib_whesv( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whesv


end interface 


interface 
     module subroutine stdlib_chesvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(in) :: a(lda,*), b(ldb,*)
           complex(sp), intent(inout) :: af(ldaf,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_chesvx

     module subroutine stdlib_zhesvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(in) :: a(lda,*), b(ldb,*)
           complex(dp), intent(inout) :: af(ldaf,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zhesvx

     module subroutine stdlib_whesvx( fact, uplo, n, nrhs, a, lda, af, ldaf, ipiv, b,ldb, x, ldx, rcond, &
               ferr, berr, work, lwork,rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldaf, ldb, ldx, lwork, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(in) :: a(lda,*), b(ldb,*)
           complex(qp), intent(inout) :: af(ldaf,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_whesvx


end interface 


interface 
     pure module subroutine stdlib_chesv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: e(*), work(*)
     end subroutine stdlib_chesv_rk

     pure module subroutine stdlib_zhesv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: e(*), work(*)
     end subroutine stdlib_zhesv_rk

     pure module subroutine stdlib_whesv_rk( uplo, n, nrhs, a, lda, e, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: e(*), work(*)
     end subroutine stdlib_whesv_rk


end interface 


interface 
     pure module subroutine stdlib_chesv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chesv_rook

     pure module subroutine stdlib_zhesv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhesv_rook

     pure module subroutine stdlib_whesv_rook( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whesv_rook


end interface 


interface 
     pure module subroutine stdlib_sspsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_sspsv

     pure module subroutine stdlib_dspsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_dspsv

     pure module subroutine stdlib_qspsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_qspsv


     pure module subroutine stdlib_cspsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_cspsv

     pure module subroutine stdlib_zspsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_zspsv

     pure module subroutine stdlib_wspsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_wspsv


end interface 


interface 
     module subroutine stdlib_sspsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(sp), intent(inout) :: afp(*)
           real(sp), intent(in) :: ap(*), b(ldb,*)
           real(sp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_sspsvx

     module subroutine stdlib_dspsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(dp), intent(inout) :: afp(*)
           real(dp), intent(in) :: ap(*), b(ldb,*)
           real(dp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_dspsvx

     module subroutine stdlib_qspsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, iwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           integer(ilp), intent(out) :: iwork(*)
           real(qp), intent(inout) :: afp(*)
           real(qp), intent(in) :: ap(*), b(ldb,*)
           real(qp), intent(out) :: berr(*), ferr(*), work(*), x(ldx,*)
     end subroutine stdlib_qspsvx


     module subroutine stdlib_cspsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(inout) :: afp(*)
           complex(sp), intent(in) :: ap(*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_cspsvx

     module subroutine stdlib_zspsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(inout) :: afp(*)
           complex(dp), intent(in) :: ap(*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zspsvx

     module subroutine stdlib_wspsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(inout) :: afp(*)
           complex(qp), intent(in) :: ap(*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_wspsvx


end interface 


interface 
     pure module subroutine stdlib_chpsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_chpsv

     pure module subroutine stdlib_zhpsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_zhpsv

     pure module subroutine stdlib_whpsv( uplo, n, nrhs, ap, ipiv, b, ldb, info )
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: ap(*), b(ldb,*)
     end subroutine stdlib_whpsv


end interface 


interface 
     module subroutine stdlib_chpsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(sp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(sp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(sp), intent(inout) :: afp(*)
           complex(sp), intent(in) :: ap(*), b(ldb,*)
           complex(sp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_chpsvx

     module subroutine stdlib_zhpsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(dp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(dp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(dp), intent(inout) :: afp(*)
           complex(dp), intent(in) :: ap(*), b(ldb,*)
           complex(dp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_zhpsvx

     module subroutine stdlib_whpsvx( fact, uplo, n, nrhs, ap, afp, ipiv, b, ldb, x,ldx, rcond, ferr, &
               berr, work, rwork, info )
           character, intent(in) :: fact, uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: ldb, ldx, n, nrhs
           real(qp), intent(out) :: rcond
           integer(ilp), intent(inout) :: ipiv(*)
           real(qp), intent(out) :: berr(*), ferr(*), rwork(*)
           complex(qp), intent(inout) :: afp(*)
           complex(qp), intent(in) :: ap(*), b(ldb,*)
           complex(qp), intent(out) :: work(*), x(ldx,*)
     end subroutine stdlib_whpsvx


end interface 


interface 
     pure module subroutine stdlib_ssysv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(sp), intent(inout) :: a(lda,*), b(ldb,*)
           real(sp), intent(out) :: work(*)
     end subroutine stdlib_ssysv_aa

     pure module subroutine stdlib_dsysv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(dp), intent(inout) :: a(lda,*), b(ldb,*)
           real(dp), intent(out) :: work(*)
     end subroutine stdlib_dsysv_aa

     pure module subroutine stdlib_qsysv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           real(qp), intent(inout) :: a(lda,*), b(ldb,*)
           real(qp), intent(out) :: work(*)
     end subroutine stdlib_qsysv_aa


     pure module subroutine stdlib_csysv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_csysv_aa

     pure module subroutine stdlib_zsysv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zsysv_aa

     pure module subroutine stdlib_wsysv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_wsysv_aa


end interface 


interface 
     pure module subroutine stdlib_chesv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(sp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(sp), intent(out) :: work(*)
     end subroutine stdlib_chesv_aa

     pure module subroutine stdlib_zhesv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(dp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(dp), intent(out) :: work(*)
     end subroutine stdlib_zhesv_aa

     pure module subroutine stdlib_whesv_aa( uplo, n, nrhs, a, lda, ipiv, b, ldb, work,lwork, info )
               
           character, intent(in) :: uplo
           integer(ilp), intent(out) :: info
           integer(ilp), intent(in) :: lda, ldb, lwork, n, nrhs
           integer(ilp), intent(out) :: ipiv(*)
           complex(qp), intent(inout) :: a(lda,*), b(ldb,*)
           complex(qp), intent(out) :: work(*)
     end subroutine stdlib_whesv_aa


end interface 

end module stdlib_lapack_solve
