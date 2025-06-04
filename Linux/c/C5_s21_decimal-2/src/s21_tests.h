#ifndef S21_TESTS_H
#define S21_TESTS_H

#include <check.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "s21_decimal.h"

Suite *suite_add(void);
Suite *suite_sub(void);
Suite *suite_div(void);
Suite *suite_mul(void);
Suite *suite_is_greater(void);
Suite *suite_is_equal(void);
Suite *suite_is_greater_or_equal(void);
Suite *suite_is_less(void);
Suite *suite_is_less_or_equal(void);
Suite *suite_is_not_equal(void);
Suite *suite_truncate(void);
Suite *suite_round(void);
Suite *suite_floor(void);
Suite *suite_negate(void);
Suite *suite_int_to_decimal(void);
Suite *suite_float_to_decimal(void);
Suite *suite_decimal_to_int(void);

Suite *s21_from_decimal_to_float_get_tests(void);
#endif /*S21_TESTS_H*/
