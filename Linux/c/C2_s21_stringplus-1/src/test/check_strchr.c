#include "../s21_tests.h"

START_TEST(rnd_test) {
  char str1[BUFF_SIZE] = {0};
  int j = 0;
  while (j < BUFF_SIZE) {
    str1[j] = rand() % 94 + 32;
    j++;
  }
  str1[j] = '\0';
  int symbol = rand() % 94 + 32;
  ck_assert_ptr_eq(s21_strchr(str1, symbol), strchr(str1, symbol));
}
END_TEST

START_TEST(test_slash_null) {
  char str1[BUFF_SIZE] = "asdfasdfasdf";
  int symbol = '\0';
  ck_assert_ptr_eq(s21_strchr(str1, symbol), strchr(str1, symbol));
}
END_TEST


Suite *suite_strchr(void) {
  Suite *s = suite_create("suite_strchr");
  TCase *tc = tcase_create("tc_strchr");

  tcase_add_loop_test(tc, rnd_test, 0, amount_of_rand_tests);
  tcase_add_test(tc, test_slash_null);
  suite_add_tcase(s, tc);
  
  return s;
}
