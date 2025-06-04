#include "s21_decimal.h"

int s21_from_int_to_decimal(int src, s21_decimal *dst) {
  RETURN_VALUE result = OK;
  if (sizeof(src) <= 4 && dst != NULL) {
    init_val(dst);
    dst->bits[0] = (src > 0) ? src : -src;
    dst->sign = (src >= 0) ? 0 : 1;
  } else {
    result = CONVERTATION_ERROR;
  }
  return result;
}