#include "s21_sscanf.h"

int s21_sscanf(const char *str, const char *format, ...) {
  setlocale(LC_ALL, ""); /*устанавливает настройки системы по умолчанию*/
  setlocale(LC_NUMERIC,
            "en_US.UTF-8"); /*устанавливает настройки системы по умолчанию*/
  int sucsessargumentprocessing = EOF;
  char *formattracker = (char *)format;
  char *strtracker = (char *)str;
  spec specification = {0};
  char buffer[BUFF_SIZE] = {0};
  va_list ap;
  va_start(ap, format);
  int erroralert = 0;
  s21_size_t len = s21_strlen(str);
  for (; *formattracker && !erroralert && *strtracker &&
         len - s21_strlen(str) != len;
       formattracker++) {
    if (s21_strpbrk(formattracker, s21_SPACES) == formattracker) {
      if (s21_strpbrk(strtracker, s21_SPACES) != strtracker) continue;
      if (s21_strpbrk(strtracker, s21_SPACES) == strtracker)
        heybitchholdmyspacesXD(&strtracker, &formattracker);
    }
    if (*formattracker == '%' && *(formattracker + 1) == '%') heybitchholdmyspacesXD(&strtracker, &formattracker);
    if (*strtracker == *formattracker) {
      if (*formattracker == '%' && *(formattracker + 1) == '%') {
        formattracker++, strtracker++;
        continue;
      } else
        strtracker++;
      continue;
    } 
    else if (*formattracker == '%') {
      erroralert = specificationparsing(ap, &specification, &formattracker);
      if (specification.specifier != s21_c)
        heybitchholdmyspacesXD(&strtracker, &formattracker);
      if (!erroralert) {
        specification.ititialstrlen = len;
        specification.lennow = s21_strlen(strtracker);
        s21_memset(buffer, 0, BUFF_SIZE);
        erroralert = processinputstream(&specification, &strtracker, buffer);
        if (!erroralert && specification.specifier != s21_n &&
            !specification.asterisk)
          sucsessargumentprocessing++;
      }
    } else
      erroralert++;
  }
  if (sucsessargumentprocessing != EOF) sucsessargumentprocessing++;
  va_end(ap);
  return sucsessargumentprocessing;
}

int specificationparsing(va_list ap, spec *specification,
                         char **formattracker) {
  s21_memset(specification, 0, sizeof(spec));
  static int erroralert = 0;
  (*formattracker)++;
  int stop = 0;
  while (**formattracker && !stop) {
    if (!erroralert && **formattracker == '*') {
      if (!specification->width && !specification->length)
        specification->asterisk = '*';
      else
        erroralert = 1;
    } else if (!erroralert && **formattracker >= '0' && **formattracker <= '9')
      erroralert = parsewidth(*&specification, *&formattracker);
    else if (!erroralert && (s21_strpbrk(*formattracker, "hlL") == *formattracker))
      erroralert = parselength(*&specification, *&formattracker);
    else if (!erroralert &&
             (s21_strpbrk(*formattracker, "cdieEfgGosuxXpn") == *formattracker)) {
      parsespecifierandadress(ap, *&specification, *&formattracker);
      stop = s21_TRUE;
    } else
      erroralert = 1;
    if (!stop) (*formattracker)++;
  }

  return erroralert;
}

int parselength(spec *specification, char **formattracker) {
  int erroralert = 0;
  if (!specification->length) {
    if (**formattracker == 'l') {
      if (*(*formattracker + 1) == 'l') {
        specification->length = s21_ll;
        (*formattracker)++;
      } else
        specification->length = s21_l;
    } else if (**formattracker == 'L')
      specification->length = s21_L;
    else if (**formattracker == 'h') {
      if (*(*formattracker + 1) == 'h') {
        specification->length = s21_h;
        (*formattracker)++;
      } else
        specification->length = s21_h;
    }
  } else
    erroralert = 1;
  return erroralert;
}

int parsespecifierandadress(va_list ap, spec *specification,
                            char **formattracker) {
  int erroralert = 0;
  if (**formattracker == 'c') specification->specifier = s21_c;
  if (**formattracker == 'f') specification->specifier = s21_f;
  if (**formattracker == 'd') specification->specifier = s21_d;
  if (**formattracker == 'i') specification->specifier = s21_i;
  if (**formattracker == 'o') specification->specifier = s21_o;
  if (**formattracker == 's') specification->specifier = s21_s;
  if (**formattracker == 'u') specification->specifier = s21_u;
  if (**formattracker == 'x') specification->specifier = s21_x;
  if (**formattracker == 'X') specification->specifier = s21_X;
  if (**formattracker == 'p') specification->specifier = s21_p;
  if (**formattracker == 'n') specification->specifier = s21_n;
  if (**formattracker == 'e') specification->specifier = s21_e;
  if (**formattracker == 'E') specification->specifier = s21_E;
  if (**formattracker == 'g') specification->specifier = s21_g;
  if (**formattracker == 'G') specification->specifier = s21_G;
  if (!specification->asterisk && specification->specifier == s21_p)
    specification->adress = (va_arg(ap, void **));
  else if (!specification->asterisk)
    specification->adress = (va_arg(ap, void *));
  return erroralert;
}

int parsewidth(spec *specification, char **formattracker) {
  char widthstring[BUFF_SIZE] = {0};

  int erroralert = 0;
  if (!specification->width && !specification->length &&
      !specification->specifier) {
    int widthstringlength = 0;
    while (**formattracker >= '0' && **formattracker <= '9') {
      widthstring[widthstringlength] = **formattracker;
      widthstringlength++;
      (*formattracker)++;
    }
  } else
    erroralert = 1;
  specification->width = s21_atoll(widthstring);
  (*formattracker)--;
  return erroralert;
}

void heybitchholdmyspacesXD(char **strtracker, char **formattracker) {
  while (**strtracker == ' ' || **strtracker == '\t' || **strtracker == '\n')
    (*strtracker)++;
  while (**formattracker == ' ' || **formattracker == '\t' ||
         **formattracker == '\n')
    (*formattracker)++;
}

int processinputstream(spec *specification, char **strtracker, char *buffer) {
  int erroralert = 0;
  specification->isnegative = 1;
  if (specification->specifier == s21_s) {
    fillthebufferstring(*&specification, *&strtracker, *&buffer);
    if (!specification->asterisk)
      writebuffertotheaddress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_c) {
    processsymbols(*&specification, *&strtracker, *&buffer);
    if (!specification->asterisk)
      writebuffertotheaddress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_e || specification->specifier == s21_E ||
      specification->specifier == s21_f || specification->specifier == s21_g ||
      specification->specifier == s21_G) {
    erroralert = numericdataintobuffer(*&specification, *&strtracker, *&buffer);
    if (!erroralert && !specification->asterisk)
      writefloattoadress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_o) {
    erroralert = numericdataintobuffer(*&specification, *&strtracker, *&buffer);
    if (!erroralert && !specification->asterisk)
      writeunsignedtoadress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_p) {
    erroralert = numericdataintobuffer(*&specification, *&strtracker, *&buffer);
    if (!erroralert && !specification->asterisk)
      writepointertoadress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_n) {
    writeintegertoadress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_x || specification->specifier == s21_X ||
      specification->specifier == s21_u) {
    erroralert = numericdataintobuffer(*&specification, *&strtracker, *&buffer);
    if (!erroralert && !specification->asterisk)
      writeunsignedtoadress(*&specification, *&buffer);
  }
  if (specification->specifier == s21_i ||
      specification->specifier ==
          s21_d) {  // ДОЛЖЕН СТОЯТЬ ПОСЛЕДНИМ!!! ПЕРЕНАЗНАЧАЕТ
    // СПЕЦИФИКАТОР!!!
    erroralert = numericdataintobuffer(*&specification, *&strtracker, *&buffer);
    if (!erroralert && !specification->asterisk)
      writeintegertoadress(*&specification, *&buffer);
  }

  return erroralert;
}

void fillthebufferstring(spec *specification, char **strtracker, char *buffer) {
  int targetsymbols = s21_strcspn(*strtracker, s21_SPACES);
  if (specification->width && targetsymbols > specification->width)
    targetsymbols = specification->width;
  s21_strncpy(buffer, *strtracker, targetsymbols);
  (*strtracker) += (targetsymbols);
}

int numericdataintobuffer(spec *specification, char **strtracker,
                          char *buffer) {
  int mantissatracker = 0;
  int dottracker = 0;
  int terminate = 0;
  int targetsymbols = 0;
  char *pattern = chosepattern(*&specification, *&strtracker);
  if (specification->width > 1 || specification->width == 0)
    isnegative(*&specification, *&strtracker);
  targetsymbols += processocthexprefix(*&specification, *&strtracker, *&buffer);

  if (specification->width == 0) specification->width = BUFF_SIZE;
  while ((s21_strpbrk(*strtracker, pattern) == *strtracker) && !terminate &&
         specification->width != 0) {
    if (**strtracker == '-' && targetsymbols == 0) {
      terminate++;
      continue;
    }
    if (**strtracker == '.' && mantissatracker > 0) {
      terminate++;
      continue;
    }
    if (**strtracker == '.') dottracker++;
    if (**strtracker == 'e' || **strtracker == 'E') mantissatracker++;
    if ((**strtracker == '-' || **strtracker == '+') &&
        buffer[targetsymbols - 1] != 'E' && buffer[targetsymbols - 1] != 'e') {
      terminate++;
      continue;
    }
    if (**strtracker == '.' && dottracker > 1) {
      terminate++;
      continue;
    }
    buffer[targetsymbols] = **strtracker;
    targetsymbols++;
    (*strtracker)++;
    specification->width--;
  }
  return targetsymbols || *buffer ? 0 : 1;
}

/* ДОДЕЛАЙ*/
void processsymbols(spec *specification, char **strtracker, char *buffer) {
  int len = s21_strlen(*strtracker);
  if (specification->width == 0) specification->width = 1;
  if (len > specification->width) len = specification->width;
  s21_strncpy(buffer, *strtracker, len);
  (*strtracker) += (len);
}

void isnegative(spec *specification, char **strtracker) {
  if (**strtracker == '-') {
    specification->isnegative = -1;
    *strtracker += 1;
    if (specification->width != 0) specification->width -= 1;
  } else if (**strtracker == '+') {
    specification->isnegative = 1;
    *strtracker += 1;
    if (specification->width != 0) specification->width -= 1;
  } else
    specification->isnegative = 1;
}

void writebuffertotheaddress(spec *specification, char *buffer) {
  if (specification->length == s21_l || specification->length == s21_ll) {
    wchar_t *pointer = (wchar_t *)specification->adress;
    while (*buffer) {
      *pointer = *buffer;
      buffer++;
      pointer++;
    }
    if (specification->specifier == s21_s) *pointer = '\0';
  } else {
    char *pointer = (char *)specification->adress;
    while (*buffer) {
      *pointer = *buffer;
      buffer++;
      pointer++;
    }
    if (specification->specifier == s21_s) *pointer = '\0';
  }
}

void writeintegertoadress(spec *specification, char *buffer) {
  long long int result = 0;
  result = turnstringtointeger(*&specification, *&buffer);

  if (specification->length == s21_l)
    *(long int *)specification->adress = (long int)result;
  else if (specification->length == s21_ll)
    *(long long int *)specification->adress = (long long int)result;
  else if (specification->length == s21_h)
    *(short int *)specification->adress = (short int)result;
  else
    *(int *)specification->adress = (int)result;
}

char *chosepattern(spec *specification, char **strtracker) {
  static char integerpattern[] = "0123456789";
  static char floatpattern[] = "0123456789.eE-+";
  static char octalpattern[] = "01234567";
  static char hexadecimalpattern[] = "0123456789abcdefABCDEF";
  char *pointer = NULL;
  if (specification->specifier == s21_i) {
    if (**strtracker == '0') {
      if (*(*strtracker + 1) == 'x' || *(*strtracker + 1) == 'X')
        specification->specifier = s21_x;
      else
        specification->specifier = s21_o;
    } else
      specification->specifier = s21_d;
  }
  if (specification->specifier >= s21_e && specification->specifier <= s21_G)
    pointer = floatpattern;
  if (specification->specifier == s21_o) pointer = octalpattern;
  if (specification->specifier == s21_x || specification->specifier == s21_X ||
      specification->specifier == s21_p)
    pointer = hexadecimalpattern;
  if (specification->specifier == s21_d || specification->specifier == s21_u)
    pointer = integerpattern;
  return pointer;
}

int processocthexprefix(spec *specification, char **strtracker, char *buffer) {
  int slide = 0;
  if (specification->specifier >= s21_o && specification->specifier <= s21_p) {
    if (**strtracker == '0' &&
        (specification->width > 1 || specification->width == 0)) {
      if ((*(*strtracker + 1) == 'x' || *(*strtracker + 1) == 'X') &&
          (specification->width > 2 || specification->width == 0)) {
        buffer[0] = '0';
        buffer[1] = 'x';
        slide += 2;
        *strtracker += 2;
        if (specification->width != 0) specification->width -= 2;
      } else {
        buffer[0] = '0';
        slide += 1;
        *strtracker += 1;
        if (specification->width != 0) specification->width -= 1;
      }
    }
  }
  return slide;
}

long long turnstringtointeger(spec *specification, char *buffer) {
  long long digit = 0;
  char z[5];
  int i = s21_strlen(buffer) - 1;
  long long int p = 1;
  if (specification->specifier == s21_d || specification->specifier == s21_u)
    digit = s21_atoll(buffer);
  if (specification->specifier == s21_o)
    for (s21_size_t x = 0; x <= s21_strlen(buffer) - 1; i--, x++) {
      if (x != 0) p *= 8;
      z[0] = buffer[i];
      z[1] = '\0';
      digit += p * s21_atoll(z);
    }
  if (specification->specifier == s21_x || specification->specifier == s21_X ||
      specification->specifier == s21_p)
    for (int x = 0; i >= 0 && buffer[i] != 'x'; i--, x++) {
      z[0] = 0;
      z[1] = 0;
      z[2] = 0;
      if (x != 0) p *= 16;

      z[0] = buffer[i];
      if (z[0] == 'A' || z[0] == 'a') {
        z[0] = '1';
        z[1] = '0';
        z[2] = '\0';
      } else if (z[0] == 'B' || z[0] == 'b') {
        z[0] = '1';
        z[1] = '1';
        z[2] = '\0';
      } else if (z[0] == 'C' || z[0] == 'c') {
        z[0] = '1';
        z[1] = '2';
        z[2] = '\0';
      } else if (z[0] == 'D' || z[0] == 'd') {
        z[0] = '1';
        z[1] = '3';
        z[2] = '\0';
      } else if (z[0] == 'E' || z[0] == 'e') {
        z[0] = '1';
        z[1] = '4';
        z[2] = '\0';
      } else if (z[0] == 'F' || z[0] == 'f') {
        z[0] = '1';
        z[1] = '5';
        z[2] = '\0';
      }
      digit += p * s21_atoll(z);
    }
  if (specification->specifier == s21_n)
    digit = specification->ititialstrlen - specification->lennow;
  return specification->isnegative == -1 ? 0 - digit : digit;
}

void writefloattoadress(spec *specification, char *buffer) {
  long double result = 0;
  result = turnstringtofloat(*&specification, *&buffer);

  if (specification->length == s21_L || specification->length == s21_ll) {
    *(long double *)specification->adress = (long double)result;
  } else if (specification->length == s21_l)
    *(double *)specification->adress = (double)result;
  else
    *(float *)specification->adress = (float)result;
}

long double turnstringtofloat(spec *specification, char *buffer) {
  long double digit = 0;
  char operationbuffer[BUFF_SIZE] = {0};
  int i = 0;
  for (int t = 0;
       buffer[i] != '.' && buffer[i] != 'e' && buffer[i] != 'E' && buffer[i];
       i++, t++) {
    operationbuffer[t] = buffer[i];
  }
  digit = s21_atoll(operationbuffer);
  s21_memset(operationbuffer, 0, BUFF_SIZE);
  if (buffer[i] == '.') {
    i++;
    for (unsigned long long int t = 10;
         buffer[i] != 'e' && buffer[i] != 'E' && buffer[i]; i++, t *= 10) {
      operationbuffer[0] = buffer[i];
      operationbuffer[1] = '\0';
      digit += (long double)s21_atoll(operationbuffer) / t;
    }
  }
  if (buffer[i] == 'e' || buffer[i] == 'E') {
    i++;
    s21_memset(operationbuffer, 0, BUFF_SIZE);
    for (int t = 0; buffer[i]; i++, t++) {
      operationbuffer[t] = buffer[i];
    }
    int delimraz = s21_atoll(operationbuffer);
    if (delimraz > 0)
      for (; 0 < delimraz; delimraz--) digit *= 10;
    if (delimraz < 0)
      for (; 0 > delimraz; delimraz++) digit /= 10;
  }
  return specification->isnegative == -1 ? 0 - digit : digit;
}

long long s21_atoll(const char *str) {
  int len = s21_strlen(str) - 1;
  long long int factor = 1;
  long long result = 0;
  int negative = 0;
  for (int i = 0; len >= 0; i++, len--) {
    if (len == 0 && str[len] == '+')
      continue;
    else if (len == 0 && str[len] == '-') {
      negative = s21_TRUE;
      continue;
    } else if (str[len] > '9' || str[len] < '0') {
      result = 0;
      i = 0;
      factor = 1;
    } else {
      if (i > 0) factor *= 10;
      result += factor * (str[len] - 48);
    }
  }
  return negative ? 0 - result : result;
}

void writeunsignedtoadress(spec *specification, char *buffer) {
  unsigned long long result = 0;
  result = (unsigned long long)turnstringtointeger(*&specification, *&buffer);

  if (specification->length == s21_l)
    *(unsigned long *)specification->adress = (unsigned long)result;
  else if (specification->length == s21_ll)
    *(unsigned long long *)specification->adress = (unsigned long long)result;
  else if (specification->length == s21_h)
    *(unsigned short *)specification->adress = (unsigned short)result;
  else
    *(unsigned *)specification->adress = (unsigned)result;
}

void writepointertoadress(spec *specification, char *buffer) {
  unsigned long result = 0;
  result = (unsigned long)turnstringtointeger(*&specification, *&buffer);
  *(unsigned long *)specification->adress = (unsigned long)result;
}