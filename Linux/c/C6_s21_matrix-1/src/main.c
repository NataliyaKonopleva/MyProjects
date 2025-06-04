#include "s21_tests.h"

int main(void) {
  /* Запуск функций тестирования */
  int failed = 0;
  SRunner *runner;

  runner = srunner_create(s21_matrix_suite());
  srunner_set_fork_status(runner, CK_NOFORK);
  srunner_run_all(runner, CK_VERBOSE);

  failed = srunner_ntests_failed(runner);
  srunner_free(runner);
  return (failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
