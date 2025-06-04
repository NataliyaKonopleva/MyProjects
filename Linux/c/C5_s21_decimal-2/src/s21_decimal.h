#ifndef S21_DECIMAL_H
#define S21_DECINAL_H

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define s21_SIZE_DECIMAL 4
#define s21_SIZE_BIG_DECIMAL 10

#define s21_BIG_MSB 287
#define s21_SMALL_MSB 95

#define s21_SIGN_POSITIVE 0
#define s21_SIGN_NEGATIVE 1

typedef union {
  unsigned int bits[s21_SIZE_DECIMAL];
  struct {
    unsigned int mantissa[s21_SIZE_DECIMAL - 1];
    short empty2 : 16;
    unsigned short power : 8;
    short empty1 : 7;
    unsigned short sign : 1;
  };
} s21_decimal;

typedef union {
  unsigned int bits[s21_SIZE_BIG_DECIMAL];
  struct {
    unsigned int mantissa[s21_SIZE_BIG_DECIMAL - 1];
    short empty2 : 16;
    unsigned short power : 8;
    short empty1 : 7;
    unsigned short sign : 1;
  };
} s21_big_decimal;

typedef enum {
  OK = 0,
  TRUE = 0,
  CALCULATION_ERROR = 1,
  CONVERTATION_ERROR = 1,
  FALSE = 1,
  TO_LARGE = 1,
  TO_SMALL = 2,
  DIVISION_BY_ZERO = 3
} RETURN_VALUE;

void s21_drop_trailing_zeros(s21_big_decimal* value);
int s21_from_int_to_decimal(int src, s21_decimal* dst);
void init_val(s21_decimal* val);
int get_bit(s21_decimal val, int index);
void set_bit(s21_decimal* val, int index, int bit);
void printdecimaltable(s21_decimal decimal);
void printbigdecimaltable(s21_big_decimal decimal);
s21_big_decimal s21_turn_decimal_to_big_decimal(s21_decimal original);
s21_big_decimal leftshiftbigdecimal(s21_big_decimal original, int shift);
s21_big_decimal rightshiftbigdecimal(s21_big_decimal original, int shift);
void set_big_bit(s21_big_decimal* val, int index, int bit);
int get_big_bit(s21_big_decimal val, int index);
s21_big_decimal s21_add_big(s21_big_decimal value, s21_big_decimal increase);
s21_big_decimal s21_mul_big(s21_big_decimal value, s21_big_decimal factor);
void s21_big_equalizer(s21_big_decimal* first, s21_big_decimal* second);
int signmuldiv(s21_big_decimal value1, s21_big_decimal value2);
s21_big_decimal s21_sub_big(s21_big_decimal term, s21_big_decimal minuend);
int s21_is_greater_big(s21_big_decimal val1, s21_big_decimal val2);
int s21_is_equal_big(s21_big_decimal val1, s21_big_decimal val2);
s21_big_decimal s21_div_big(s21_big_decimal numerator,
                            s21_big_decimal denominator, int variation);
int s21_is_greater_or_equal_big(s21_big_decimal val1, s21_big_decimal val2);
void printbigdecimaltableflat(s21_big_decimal decimal);
s21_big_decimal s21_round_banking_big(s21_big_decimal value);
int s21_is_greater(s21_decimal, s21_decimal);
s21_decimal s21_turn_big_decimal_to_decimal(s21_big_decimal original);
int s21_is_equal(s21_decimal value_1, s21_decimal value_2);
int s21_validate_decimal(s21_decimal value);
int s21_round(s21_decimal value, s21_decimal* result);
int s21_is_greater_or_equal(s21_decimal value_1, s21_decimal value_2);
int s21_negate(s21_decimal value, s21_decimal* result);
int s21_big_normalizer(s21_big_decimal original, s21_big_decimal* result);
void s21_make_nulldecimal_positive(s21_big_decimal* value);
int s21_mul(s21_decimal value_1, s21_decimal value_2, s21_decimal* result);
int s21_div(s21_decimal value_1, s21_decimal value_2, s21_decimal* result);
void printdecimaltableflat(s21_decimal decimal);
int s21_add(s21_decimal value_1, s21_decimal value_2, s21_decimal* result);
int s21_sub(s21_decimal value_1, s21_decimal value_2, s21_decimal* result);
int s21_is_less(s21_decimal val1, s21_decimal val2);
int s21_is_not_equal(s21_decimal value_1, s21_decimal value_2);
int s21_is_less_or_equal(s21_decimal val1, s21_decimal val2);
int s21_truncate(s21_decimal value, s21_decimal* result);
s21_big_decimal s21_round_big(s21_big_decimal value);
int s21_floor(s21_decimal value, s21_decimal* result);
int s21_negate(s21_decimal value, s21_decimal* result);
int s21_from_decimal_to_float(s21_decimal src, float* dst);
int s21_from_float_to_decimal(float src, s21_decimal* dst);
int s21_from_decimal_to_int(s21_decimal src, int* dst);
int float_to_mantissa(float src, int* exp, int* multen);
void decide_sub_result_sign(s21_big_decimal term, s21_big_decimal minuend,
                            s21_big_decimal* value_1, s21_big_decimal* value_2,
                            s21_big_decimal* result);

#endif /* S21_DECIMAL_H_ */