#include "../s21_tests.h"

START_TEST(mult_single_separators_oleg) {
  char str2[] = "hi,,ya,,oleg";
  char str2_std[] = "hi,,ya,,oleg";
  const char delim2[] = ",";

  char *token2 = s21_strtok(str2, delim2);
  char *token2_std = strtok(str2_std, delim2);

  while (token2 != NULL && token2_std != NULL) {
    ck_assert_str_eq(token2, token2_std);
    token2 = s21_strtok(NULL, delim2);
    token2_std = strtok(NULL, delim2);
  }
}
END_TEST

START_TEST(mult_separators_oleg) {
  char str3[] = "hi! ya; oleg.";
  char str3_std[] = "hi! ya; oleg.";
  const char delim3[] = " ,;.!";

  char *token3 = s21_strtok(str3, delim3);
  char *token3_std = strtok(str3_std, delim3);

  while (token3 != NULL && token3_std != NULL) {
    ck_assert_str_eq(token3, token3_std);
    token3 = s21_strtok(NULL, delim3);
    token3_std = strtok(NULL, delim3);
  }
}
END_TEST

// START_TEST(empty_str) {
//   char str1[] = "";
//   char str1_std[] = "";
//   const char delim1[] = " 2IDt";

//   char *token1 = s21_strtok(str1, delim1);
//   char *token1_std = strtok(str1_std, delim1);
//   ck_assert_str_eq(token1, token1_std);

// }
// END_TEST

// START_TEST(null_str) {
//   char *str3 = s21_NULL;
//   char *str3_std = s21_NULL;
//   const char delim3[] = " 2IDt";

//   char *token3 = s21_strtok(str3, delim3);
//   char *token3_std = strtok(str3_std, delim3);
//   ck_assert_str_eq(token3, token3_std);

// }
// END_TEST

Suite *suite_strtok(void) {
  Suite *s = suite_create("suite_strtok");
  TCase *tc = tcase_create("tc_strtok");

  tcase_add_test(tc, mult_single_separators_oleg);
  tcase_add_test(tc, mult_separators_oleg);
  // tcase_add_test(tc, empty_str);
  // tcase_add_test(tc, null_str);

  suite_add_tcase(s, tc);
  return s;
}