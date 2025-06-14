#ifndef S21_TESTS_H_
#define S21_TESTS_H_

#include <check.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "s21_string.h"
#define amount_of_rand_tests 25
#define BUFF_SIZE 1000

Suite *suite_memchr(void);
Suite *suite_memcmp(void);
Suite *suite_strncmp(void);
Suite *suite_memset(void);
Suite *suite_memcpy(void);
Suite *suite_trim(void);
Suite *suite_strchr(void);
Suite *suite_strncpy(void);
Suite *suite_strlen(void);
Suite *suite_strstr(void);
Suite *suite_sprintf(void);
Suite *suite_to_upper(void);
Suite *suite_to_lower(void);
Suite *suite_strncat(void);
Suite *suite_strtok(void);
Suite *suite_strcspn(void);
Suite *suite_strrchr(void);
Suite *suite_strpbrk(void);
Suite *suite_strerror(void);
Suite *suite_insert(void);
Suite *suite_sscanf(void);
#endif /*S21_TESTS_H_*/