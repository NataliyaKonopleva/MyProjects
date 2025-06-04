#include "s21_tests.h"

int main(void) {
  /* Запуск функций тестирования */
  int failed = 0;
  SRunner *runner;

  setlocale(LC_ALL, ""); /*устанавливает настройки системы по умолчанию*/
  setlocale(LC_NUMERIC,
            "en_US.UTF-8"); /*устанавливает настройки системы по умолчанию*/
  runner = srunner_create(suite_add());
  /*Сюда добавляем тесты, по аналогии.*/
  srunner_add_suite(runner, suite_sub());
  srunner_add_suite(runner, suite_div());
  srunner_add_suite(runner, suite_mul());
  srunner_add_suite(runner, suite_is_greater());
  srunner_add_suite(runner, suite_is_equal());
  srunner_add_suite(runner, suite_is_greater_or_equal());
  srunner_add_suite(runner, suite_is_less());
  srunner_add_suite(runner, suite_is_less_or_equal());
  srunner_add_suite(runner, suite_is_not_equal());
  srunner_add_suite(runner, suite_truncate());
  srunner_add_suite(runner, suite_round());
  srunner_add_suite(runner, suite_floor());
  srunner_add_suite(runner, suite_negate());
  srunner_add_suite(runner, suite_int_to_decimal());
  srunner_add_suite(runner, suite_decimal_to_int());
  srunner_add_suite(runner, suite_float_to_decimal());
  srunner_add_suite(runner, s21_from_decimal_to_float_get_tests());

  srunner_set_fork_status(runner, CK_NOFORK);
  srunner_run_all(runner, CK_VERBOSE);

  failed = srunner_ntests_failed(runner);
  srunner_free(runner);
  return (failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
