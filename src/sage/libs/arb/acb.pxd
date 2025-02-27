# distutils: libraries = gmp flint
# distutils: depends = acb.h

from sage.libs.arb.types cimport *
from sage.libs.flint.types cimport fmpz_t, fmpq_t

# acb.h
cdef extern from "arb_wrap.h":

    arb_t acb_realref(acb_t x)
    arb_t acb_imagref(acb_t x)

    void acb_init(acb_t x)
    void acb_clear(acb_t x)
    acb_ptr _acb_vec_init(long n)
    void _acb_vec_clear(acb_ptr v, long n)

    bint acb_is_zero(const acb_t z)
    bint acb_is_one(const acb_t z)
    bint acb_is_finite(const acb_t z)
    bint acb_is_exact(const acb_t z)
    bint acb_is_int(const acb_t z)

    void acb_zero(acb_t z)
    void acb_one(acb_t z)
    void acb_onei(acb_t z)
    void acb_set(acb_t z, const acb_t x)
    void acb_set_ui(acb_t z, long x)
    void acb_set_si(acb_t z, long x)
    void acb_set_fmpz(acb_t z, const fmpz_t x)
    void acb_set_arb(acb_t z, const arb_t c)
    void acb_set_fmpq(acb_t z, const fmpq_t x, long prec)
    void acb_set_round(acb_t z, const acb_t x, long prec)
    void acb_set_round_fmpz(acb_t z, const fmpz_t x, long prec)
    void acb_set_round_arb(acb_t z, const arb_t x, long prec)
    void acb_swap(acb_t z, acb_t x)

    void acb_print(const acb_t x)
    void acb_printd(const acb_t z, long digits)

    # void acb_randtest(acb_t z, flint_rand_t state, long prec, long mag_bits)
    # void acb_randtest_special(acb_t z, flint_rand_t state, long prec, long mag_bits)
    # void acb_randtest_precise(acb_t z, flint_rand_t state, long prec, long mag_bits)
    # void acb_randtest_param(acb_t z, flint_rand_t state, long prec, long mag_bits)

    bint acb_equal(const acb_t x, const acb_t y)
    bint acb_eq(const acb_t x, const acb_t y)
    bint acb_ne(const acb_t x, const acb_t y)
    bint acb_overlaps(const acb_t x, const acb_t y)
    void acb_union(acb_t z, const acb_t x, const acb_t y, long prec)
    void acb_get_abs_ubound_arf(arf_t u, const acb_t z, long prec)
    void acb_get_abs_lbound_arf(arf_t u, const acb_t z, long prec)
    void acb_get_rad_ubound_arf(arf_t u, const acb_t z, long prec)
    void acb_get_mag(mag_t u, const acb_t x)
    void acb_get_mag_lower(mag_t u, const acb_t x)
    bint acb_contains_fmpq(const acb_t x, const fmpq_t y)
    bint acb_contains_fmpz(const acb_t x, const fmpz_t y)
    bint acb_contains(const acb_t x, const acb_t y)
    bint acb_contains_zero(const acb_t x)
    bint acb_contains_int(const acb_t x)

    long acb_rel_error_bits(const acb_t x)
    long acb_rel_accuracy_bits(const acb_t x)
    long acb_bits(const acb_t x)
    void acb_indeterminate(acb_t x)
    void acb_trim(acb_t y, const acb_t x)
    bint acb_is_real(const acb_t x)
    bint acb_get_unique_fmpz(fmpz_t z, const acb_t x)

    void acb_arg(arb_t r, const acb_t z, long prec)
    void acb_abs(arb_t r, const acb_t z, long prec)

    void acb_neg(acb_t z, const acb_t x)
    void acb_conj(acb_t z, const acb_t x)
    void acb_add_ui(acb_t z, const acb_t x, unsigned long y, long prec)
    void acb_add_fmpz(acb_t z, const acb_t x, const fmpz_t y, long prec)
    void acb_add_arb(acb_t z, const acb_t x, const arb_t y, long prec)
    void acb_add(acb_t z, const acb_t x, const acb_t y, long prec)
    void acb_sub_ui(acb_t z, const acb_t x, unsigned long y, long prec)
    void acb_sub_fmpz(acb_t z, const acb_t x, const fmpz_t y, long prec)
    void acb_sub_arb(acb_t z, const acb_t x, const arb_t y, long prec)
    void acb_sub(acb_t z, const acb_t x, const acb_t y, long prec)
    void acb_mul_onei(acb_t z, const acb_t x)
    void acb_div_onei(acb_t z, const acb_t x)
    void acb_mul_ui(acb_t z, const acb_t x, unsigned long y, long prec)
    void acb_mul_si(acb_t z, const acb_t x, long y, long prec)
    void acb_mul_fmpz(acb_t z, const acb_t x, const fmpz_t y, long prec)
    void acb_mul_arb(acb_t z, const acb_t x, const arb_t y, long prec)
    void acb_mul(acb_t z, const acb_t x, const acb_t y, long prec)
    void acb_mul_2exp_si(acb_t z, const acb_t x, long e)
    void acb_mul_2exp_fmpz(acb_t z, const acb_t x, const fmpz_t e)
    void acb_cube(acb_t z, const acb_t x, long prec)
    void acb_addmul(acb_t z, const acb_t x, const acb_t y, long prec)
    void acb_addmul_ui(acb_t z, const acb_t x, unsigned long y, long prec)
    void acb_addmul_si(acb_t z, const acb_t x, long y, long prec)
    void acb_addmul_fmpz(acb_t z, const acb_t x, const fmpz_t y, long prec)
    void acb_addmul_arb(acb_t z, const acb_t x, const arb_t y, long prec)
    void acb_submul(acb_t z, const acb_t x, const acb_t y, long prec)
    void acb_submul_ui(acb_t z, const acb_t x, unsigned long y, long prec)
    void acb_submul_si(acb_t z, const acb_t x, long y, long prec)
    void acb_submul_fmpz(acb_t z, const acb_t x, const fmpz_t y, long prec)
    void acb_submul_arb(acb_t z, const acb_t x, const arb_t y, long prec)
    void acb_inv(acb_t z, const acb_t x, long prec)
    void acb_div_ui(acb_t z, const acb_t x, unsigned long y, long prec)
    void acb_div_si(acb_t z, const acb_t x, long y, long prec)
    void acb_div_fmpz(acb_t z, const acb_t x, const fmpz_t y, long prec)
    void acb_div(acb_t z, const acb_t x, const acb_t y, long prec)

    void acb_const_pi(acb_t y, long prec)

    void acb_sqrt(acb_t r, const acb_t z, long prec)
    void acb_rsqrt(acb_t r, const acb_t z, long prec)
    void acb_pow_fmpz(acb_t y, const acb_t b, const fmpz_t e, long prec)
    void acb_pow_ui(acb_t y, const acb_t b, unsigned long e, long prec)
    void acb_pow_si(acb_t y, const acb_t b, long e, long prec)
    void acb_pow_arb(acb_t z, const acb_t x, const arb_t y, long prec)
    void acb_pow(acb_t z, const acb_t x, const acb_t y, long prec)

    void acb_exp(acb_t y, const acb_t z, long prec)
    void acb_exp_pi_i(acb_t y, const acb_t z, long prec)
    void acb_exp_invexp(acb_t s, acb_t t, const acb_t z, long prec)
    void acb_log(acb_t y, const acb_t z, long prec)
    void acb_log1p(acb_t z, const acb_t x, long prec)

    void acb_sin(acb_t s, const acb_t z, long prec)
    void acb_cos(acb_t c, const acb_t z, long prec)
    void acb_sin_cos(arb_t s, arb_t c, const acb_t z, long prec)
    void acb_tan(acb_t s, const acb_t z, long prec)
    void acb_cot(acb_t s, const acb_t z, long prec)
    void acb_sec(acb_t s, const acb_t z, long prec)
    void acb_csc(acb_t c, const acb_t z, long prec)
    void acb_sin_pi(acb_t s, const acb_t z, long prec)
    void acb_cos_pi(acb_t s, const acb_t z, long prec)
    void acb_sin_cos_pi(acb_t s, acb_t c, const acb_t z, long prec)
    void acb_tan_pi(acb_t s, const acb_t z, long prec)
    void acb_cot_pi(acb_t s, const acb_t z, long prec)

    void acb_asin(acb_t s, const acb_t z, long prec)
    void acb_acos(acb_t s, const acb_t z, long prec)
    void acb_atan(acb_t s, const acb_t z, long prec)
    void acb_asinh(acb_t s, const acb_t z, long prec)
    void acb_acosh(acb_t s, const acb_t z, long prec)
    void acb_atanh(acb_t s, const acb_t z, long prec)

    void acb_lambertw(acb_t res, const acb_t z, const fmpz_t k, int flags, long prec)

    void acb_sinh(acb_t s, const acb_t z, long prec)
    void acb_cosh(acb_t c, const acb_t z, long prec)
    void acb_sinh_cosh(acb_t s, acb_t c, const acb_t z, long prec)
    void acb_tanh(acb_t s, const acb_t z, long prec)
    void acb_coth(acb_t s, const acb_t z, long prec)
    void acb_sech(acb_t s, const acb_t z, long prec)
    void acb_csch(acb_t c, const acb_t z, long prec)

    void acb_rising(acb_t z, const acb_t x, const acb_t n, long prec)

    void acb_gamma(acb_t y, const acb_t x, long prec)
    void acb_rgamma(acb_t y, const acb_t x, long prec)
    void acb_lgamma(acb_t y, const acb_t x, long prec)
    void acb_digamma(acb_t y, const acb_t x, long prec)
    void acb_log_sin_pi(acb_t res, const acb_t z, long prec)
    void acb_polygamma(acb_t z, const acb_t s, const acb_t z, long prec)
    void acb_barnes_g(acb_t res, const acb_t z, long prec)
    void acb_log_barnes_g(acb_t res, const acb_t z, long prec)

    void acb_zeta(acb_t z, const acb_t s, long prec)
    void acb_hurwitz_zeta(acb_t z, const acb_t s, const acb_t a, long prec)

    void acb_polylog(acb_t w, const acb_t s, const acb_t z, long prec)
    void acb_polylog_si(acb_t w, long s, const acb_t z, long prec)

    void acb_agm1(acb_t m, const acb_t z, long prec)
    void acb_agm1_cpx(acb_ptr m, const acb_t z, long len, long prec)

    acb_ptr _acb_vec_init(long n)
    void _acb_vec_sort_pretty(acb_ptr vec, long len)
    void _acb_vec_clear(acb_ptr v, long n)
