#include "s21_tests.h"

int main(void) {
  /* Запуск функций тестирования */
  int failed = 0;
  SRunner *runner;

  setlocale(LC_ALL, ""); /*устанавливает настройки системы по умолчанию*/
  setlocale(LC_NUMERIC,
            "en_US.UTF-8"); /*устанавливает настройки системы по умолчанию*/
  runner = srunner_create(suite_memcmp());
  /*Сюда добавляем тесты, по аналогии.*/
  srunner_add_suite(runner, suite_memchr());
  srunner_add_suite(runner, suite_memset());
  srunner_add_suite(runner, suite_memcpy());
  srunner_add_suite(runner, suite_trim());
  srunner_add_suite(runner, suite_strchr());
  srunner_add_suite(runner, suite_strncpy());
  srunner_add_suite(runner, suite_strncmp());
  srunner_add_suite(runner, suite_strlen());
  srunner_add_suite(runner, suite_sprintf());
  srunner_add_suite(runner, suite_strstr());
  srunner_add_suite(runner, suite_to_upper());
  srunner_add_suite(runner, suite_to_lower());
  srunner_add_suite(runner, suite_strncat());
  srunner_add_suite(runner, suite_strtok());
  srunner_add_suite(runner, suite_strcspn());
  srunner_add_suite(runner, suite_strrchr());
  srunner_add_suite(runner, suite_strpbrk());
  srunner_add_suite(runner, suite_strerror());
  srunner_add_suite(runner, suite_insert());
  srunner_add_suite(runner, suite_sscanf());

  srunner_set_fork_status(runner, CK_NOFORK);
  srunner_run_all(runner, CK_VERBOSE);

  failed = srunner_ntests_failed(runner);
  srunner_free(runner);
  return (failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
