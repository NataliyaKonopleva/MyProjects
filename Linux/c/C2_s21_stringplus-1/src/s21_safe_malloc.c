#include "s21_string.h"

void* s21_safe_malloc(const s21_size_t size) {
  void* ret_ptr = malloc(size);
  if (ret_ptr == s21_NULL) {
    exit(EXIT_FAILURE);
  }
  return ret_ptr;
}