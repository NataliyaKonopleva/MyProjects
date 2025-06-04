#include "s21_decimal.h"

int s21_from_float_to_decimal(float src, s21_decimal* dst) {
  RETURN_VALUE CODEERROR = OK;
  if (dst == NULL) CODEERROR = CONVERTATION_ERROR;
  if (!CODEERROR) {
    init_val(dst);
    if ((fabs(src) > 0 && fabs(src) < 1e-28) || sizeof(src) > 4 || isinf(src) ||
        isnan(src)) {
      CODEERROR = CONVERTATION_ERROR;
    }
  }
  if (!CODEERROR) {
    int sign = 0;
    if (signbit(src) < 0) {
      sign = 1;
    }
    src = fabs(src);
    int exp = 0, multen = 0, cod = 0;
    int mantissa = float_to_mantissa(src, &exp, &multen);
    dst->bits[0] = mantissa;
    dst->power = exp;
    dst->sign = sign;
    s21_big_decimal big_dst = s21_turn_decimal_to_big_decimal(*dst);
    s21_drop_trailing_zeros(&big_dst);
    if (multen != 0) {
      s21_decimal ten = {{10, 0, 0, 0}};
      s21_big_decimal big_ten = s21_turn_decimal_to_big_decimal(ten);
      for (int i = 0; i < multen; i++) {
        big_dst = s21_mul_big(big_dst, big_ten);
      }
    } else {
      if (big_dst.power > 28) {
        cod = s21_big_normalizer(big_dst, &big_dst);
      }
    }
    if (big_dst.bits[3] == 0 && big_dst.bits[4] == 0 && big_dst.bits[5] == 0 &&
        big_dst.bits[6] == 0 && big_dst.bits[7] == 0 && big_dst.bits[8] == 0 &&
        cod == 0) {
      *dst = s21_turn_big_decimal_to_decimal(big_dst);
    } else
      CODEERROR = CONVERTATION_ERROR;
  }
  return CODEERROR;
}