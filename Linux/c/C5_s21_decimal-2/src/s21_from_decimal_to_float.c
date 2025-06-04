#include "s21_decimal.h"

int s21_from_decimal_to_float(s21_decimal src, float *dst) {
  RETURN_VALUE CODEERROR = OK;
  if (dst == NULL || s21_validate_decimal(src)) CODEERROR = CONVERTATION_ERROR;
  if (!CODEERROR) {
    s21_big_decimal processed = {0};
    s21_big_decimal tendecimal = {0};
    s21_big_decimal difference = {0};
    double result = 0;
    int temppower = src.power;
    tendecimal.bits[0] = 10;
    processed = s21_turn_decimal_to_big_decimal(src);
    for (int i = 0; i < 30; i++) {
      double addition = 0;
      difference = s21_div_big(processed, tendecimal, 1);
      difference = s21_mul_big(difference, tendecimal);
      difference = s21_sub_big(processed, difference);
      addition = difference.bits[0];
      if (temppower > 0)
        for (int j = 0; j < temppower; j++) addition /= 10;
      if (temppower <= 0)
        for (int z = temppower; z < 0; z++) addition *= 10;
      temppower--;
      result += addition;
      processed = s21_div_big(processed, tendecimal, 1);
    }
    if (isinf(result)) CODEERROR = CONVERTATION_ERROR;
    if (!CODEERROR) {
      if (((fabs(result) > 0 && fabs(result) < 1e-28)) ||
          (result == 0 && (src.bits[0] || src.bits[1] || src.bits[2]))) {
        CODEERROR = CONVERTATION_ERROR;
        result = 0;
      }

      *dst = (float)result;
      *dst *= (src.sign == 0) ? 1 : -1;  // знак
    }
  }
  return CODEERROR;
}