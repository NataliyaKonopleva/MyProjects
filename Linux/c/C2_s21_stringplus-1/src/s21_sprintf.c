#include "s21_string.h"

typedef struct Format {
  int c;
  int d;
  int f;
  int s;
  int u;
  int minus;
  int plus;
  int spase;
  int width;
  int precision;
  int is_precision;
  int h;
  int l;
  int sign;
  int is_minus;
} Format;

int int_len(int64_t value, int len);
int num_len(Format* const form);
char* int_to_str(char* dst, int64_t value);
char* write_sing(char* ptr, Format* const form);
char* format_str(char* ptr, int64_t value, Format* const form);
int prec_str(char* value, Format* const form);
int prec_w_str(Format* const form, int len);
char* write_ar(char* ptr, char* ar, Format* const form, int len);
char* write_str(char* ptr, char* value, Format* const form);
char* write_w_str(char* ptr, wchar_t* value, Format* const form);
char* write_char(char* ptr, char value, Format* const form);
char* write_w_char(char* ptr, wchar_t value, Format* const form);
char* write_int(char* ptr, int64_t value, Format* const form, int len);
char* write_double_str(char* ptr, int int_l, int64_t rr, Format* const form);
char* write_double(double value, char* ptr, Format* const form);
char* d_format(char* ptr, va_list args, Format* const form);
char* u_format(char* ptr, va_list args, Format* const form);
char* c_format(char* ptr, va_list args, Format* const form);
char* s_format(char* ptr, va_list args, Format* const form);
char* f_format(char* ptr, va_list args, Format* const form);
s21_size_t instal_format(Format* const forms, const char* format, s21_size_t i);

int s21_sprintf(char* str, const char* format, ...) {
  va_list args;
  va_start(args, format);
  char* str_begin = str;
  char* ptr = str;
  s21_size_t n = s21_strlen(format);
  s21_size_t i = 0;
  while (i < n) {
    if (format[i] == '%') {
      Format form = {0};
      i++;
      i = instal_format(&form, format, i);
      if (form.d) {
        ptr = d_format(ptr, args, &form);
      } else if (form.c) {
        ptr = c_format(ptr, args, &form);
      } else if (form.s) {
        ptr = s_format(ptr, args, &form);
      } else if (form.f) {
        if (form.is_precision != 1) {
          form.precision = 6;
        }
        ptr = f_format(ptr, args, &form);
      } else if (form.u) {
        ptr = u_format(ptr, args, &form);
      } else {
        *ptr++ = format[i];
      }
    } else {
      *ptr++ = format[i];
    }
    i++;
  }
  *ptr = '\0';
  va_end(args);
  return ptr - str_begin;
}

int int_len(int64_t value, int len) {
  if (value == 0) {
    len = 1;
  } else {
    len = len + (int)log10(labs(value)) + 1;
  }
  return len;
}

int num_len(Format* const form) {
  int len = 0;
  if (form->is_minus) {
    len++;
    form->sign = 1;
  } else {
    if (form->plus) {
      len++;
      form->sign = 1;
    } else if (form->spase) {
      len++;
      form->sign = 1;
    }
  }
  return len;
}

char* int_to_str(char* dst, int64_t value) {
  int int_max_digits = (int)log10(INT64_MAX) + 1;
  char temp[int_max_digits + 1];
  int i = 0;
  do {
    temp[i++] = value % 10 + '0';
    value /= 10;
  } while (value);
  while (i > 0) {
    *dst++ = temp[--i];
  }
  return dst;
}

char* write_sing(char* ptr, Format* const form) {
  if (form->is_minus) {
    *ptr++ = '-';
  } else {
    if (form->plus) {
      *ptr++ = '+';
    } else if (form->spase) {
      *ptr++ = ' ';
    }
  }
  return ptr;
}

char* format_str(char* ptr, int64_t value, Format* const form) {
  int len = 0;
  int len1 = int_len(value, len);
  if (!form->u) {
    ptr = write_sing(ptr, form);
  }
  if (form->precision > len1) {
    for (int i = 0; i < form->precision - len1; i++) {
      *ptr++ = '0';
    }
  }
  ptr = int_to_str(ptr, labs(value));
  return ptr;
}

int prec_str(char* value, Format* const form) {
  int len = s21_strlen(value);
  if (form->precision < len && form->is_precision) {
    len = form->precision;
  }
  return len;
}

int prec_w_str(Format* const form, int len) {
  if (form->precision < len && form->is_precision) {
    len = form->precision;
  }
  return len;
}

char* write_ar(char* ptr, char* ar, Format* const form, int len) {
  if (form->width > len) {
    if (form->minus) {
      for (int i = 0; i < len; i++) {
        *ptr++ = ar[i];
      }
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
    } else {
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
      for (int i = 0; i < len; i++) {
        *ptr++ = ar[i];
      }
    }
  } else {
    for (int i = 0; i < len; i++) {
      *ptr++ = ar[i];
    }
  }
  return ptr;
}

char* write_str(char* ptr, char* value, Format* const form) {
  int len = prec_str(value, form);
  ptr = write_ar(ptr, value, form, len);
  return ptr;
}

char* write_w_str(char* ptr, wchar_t* value, Format* const form) {
  char tmp[BUFF_SIZE] = {'\0'};
  int len = 0;
  wcstombs(tmp, value, BUFF_SIZE);
  len = s21_strlen(tmp);
  len = prec_w_str(form, len);
  ptr = write_ar(ptr, tmp, form, len);
  return ptr;
}

char* write_char(char* ptr, char value, Format* const form) {
  int len = 1;
  if (form->width > len) {
    if (form->minus) {
      *ptr++ = value;
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
    } else {
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
      *ptr++ = value;
    }
  } else {
    *ptr++ = value;
  }
  return ptr;
}

char* write_w_char(char* ptr, wchar_t value, Format* const form) {
  char tmp[BUFF_SIZE] = {'\0'};
  int len = 0;
  wcrtomb(tmp, value, s21_NULL);
  len = s21_strlen(tmp);
  ptr = write_ar(ptr, tmp, form, len);
  return ptr;
}

char* write_int(char* ptr, int64_t value, Format* const form, int len) {
  len = int_len(value, len);
  if (form->precision > (len - form->sign)) {
    len = form->precision + form->sign;
  }
  if (form->width > len) {
    if (form->minus) {
      ptr = format_str(ptr, value, form);
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
    } else {
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
      ptr = format_str(ptr, value, form);
    }
  } else {
    ptr = format_str(ptr, value, form);
  }
  return ptr;
}

char* write_double_str(char* ptr, int int_l, int64_t rr, Format* const form) {
  int len = int_len(int_l, 0) + form->precision + 1 + form->sign;
  char tmp[BUFF_SIZE] = {'\0'};
  for (int i = 0; i < form->precision; i++) {
    tmp[i] = rr % 10 + '0';
    rr = rr / 10;
  }
  if (form->width > len) {
    if (form->minus) {
      ptr = write_sing(ptr, form);
      ptr = int_to_str(ptr, int_l);
      *ptr++ = '.';
      for (int i = form->precision - 1; i >= 0; i--) {
        *ptr++ = tmp[i];
      }
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
    } else {
      for (int i = 0; i < form->width - len; i++) {
        *ptr++ = ' ';
      }
      ptr = write_sing(ptr, form);
      ptr = int_to_str(ptr, int_l);
      *ptr++ = '.';
      for (int i = form->precision - 1; i >= 0; i--) {
        *ptr++ = tmp[i];
      }
    }
  } else {
    ptr = write_sing(ptr, form);
    ptr = int_to_str(ptr, int_l);
    *ptr++ = '.';
    for (int i = form->precision - 1; i >= 0; i--) {
      *ptr++ = tmp[i];
    }
  }
  return ptr;
}

char* write_double(double value, char* ptr, Format* const form) {
  int int_l = 0;
  if (signbit(value) || form->plus || form->spase) {
    form->sign = 1;
  }
  value = fabs(value);
  double l = 0, r = modf(value, &l), rr = r;
  for (int i = 0; i < form->precision; i++) {
    rr = rr * 10;
  }
  int len_rr = int_len((int64_t)round(rr), 0);
  int len_r = int_len((int64_t)rr, 0);
  if (len_rr != len_r) {
    int_l = (int)l + 1;
    ptr = write_double_str(ptr, int_l, (int64_t)round(rr), form);
  } else {
    int_l = (int)l;
    ptr = write_double_str(ptr, int_l, (int64_t)round(rr), form);
  }
  return ptr;
}

char* d_format(char* ptr, va_list args, Format* const form) {
  int64_t value = va_arg(args, int64_t);
  if (form->h) {
    value = (int16_t)value;
  } else if (form->l) {
    value = (int64_t)value;
  } else {
    value = (int32_t)value;
  }
  if (value < 0) {
    form->is_minus = 1;
  }
  if (!(value == 0 && form->precision == 0 && form->is_precision)) {
    int len = num_len(form);
    ptr = write_int(ptr, value, form, len);
  }
  return ptr;
}

char* u_format(char* ptr, va_list args, Format* const form) {
  uint64_t value = va_arg(args, uint64_t);
  if (form->h) {
    value = (uint16_t)value;
  } else if (form->l) {
    value = (uint64_t)value;
  } else {
    value = (uint32_t)value;
  }
  if (!(value == 0 && form->precision == 0 && form->is_precision)) {
    int len = 0;
    ptr = write_int(ptr, value, form, len);
  }
  return ptr;
}

char* c_format(char* ptr, va_list args, Format* const form) {
  if (form->l) {
    wchar_t value = va_arg(args, wchar_t);
    ptr = write_w_char(ptr, value, form);
  } else {
    char value = (char)va_arg(args, int);
    ptr = write_char(ptr, value, form);
  }
  return ptr;
}

char* s_format(char* ptr, va_list args, Format* const form) {
  if (form->l) {
    wchar_t* value = va_arg(args, wchar_t*);
    ptr = write_w_str(ptr, value, form);
  } else {
    char* value = va_arg(args, char*);
    ptr = write_str(ptr, value, form);
  }
  return ptr;
}

char* f_format(char* ptr, va_list args, Format* const form) {
  double value = va_arg(args, double);
  if (signbit(value)) {
    form->is_minus = 1;
  }
  if (form->precision == 0) {
    int64_t int_value = round(value);
    int len = num_len(form);
    ptr = write_int(ptr, int_value, form, len);
  } else {
    ptr = write_double(value, ptr, form);
  }
  return ptr;
}

s21_size_t instal_format(Format* const forms, const char* format,
                         s21_size_t i) {
  while (format[i] == '-' || format[i] == '+' || format[i] == ' ') {
    if (format[i] == '-') {
      forms->minus = 1;
    } else if (format[i] == '+') {
      forms->plus = 1;
    } else {
      forms->spase = 1;
    }
    i++;
  }
  while (format[i] >= '0' && format[i] <= '9') {
    forms->width = forms->width * 10 + (format[i] - '0');
    i++;
  }
  if (format[i] == '.') {
    i++;
    forms->precision = 0;
    forms->is_precision = 1;
    while (format[i] >= '0' && format[i] <= '9') {
      forms->precision = forms->precision * 10 + (format[i] - '0');
      i++;
    }
  }
  if (format[i] == 'h' || format[i] == 'l') {
    if (format[i] == 'h') {
      forms->h = 1;
    } else {
      forms->l = 1;
    }
    i++;
  }
  if (format[i] == 'd') {
    forms->d = 1;
  } else if (format[i] == 's') {
    forms->s = 1;
  } else if (format[i] == 'c') {
    forms->c = 1;
  } else if (format[i] == 'f') {
    forms->f = 1;
  } else if (format[i] == 'u') {
    forms->u = 1;
  }
  return i;
}
