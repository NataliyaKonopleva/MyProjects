#include "s21_decimal.h"

/* инициализирует переменную типа s21_decimal */
void init_val(s21_decimal* val) {
  for (int i = 0; i < 128; i++) {
    set_bit(val, i, 0);
  }
}

/* возвращает значение бита по его индексу (index) */
// int get_bit(s21_decimal val, int index) {
//   int result = 1;
//   if ((val.bits[index / 32] & (1 << index % 32)) == 0) result = 0;
//   return result;
// }

/* устанавливает значение бита (bit) по его индексу (index) */
void set_bit(s21_decimal* val, int index, int bit) {
  if (bit) {
    val->bits[index / 32] = val->bits[index / 32] | (1 << index % 32);
  } else {
    val->bits[index / 32] = val->bits[index / 32] & ~(1 << index % 32);
  }
}
/*принтит биты децимала в виде таблицы, строчка = байт*/
// void printdecimaltable(s21_decimal decimal) {
//   for (int i = 127; i >= 0; i--) {
//     if (decimal.bits[i / 32] & (1U << i % 32))
//       printf("1 ");
//     else
//       printf("0 ");
//     if (i % 32 == 0) printf("\n");
//   }
//   printf("\n");
// }
/*принтит биты большого децимала в виде таблицы, строчка = байт*/
// void printbigdecimaltable(s21_big_decimal decimal) {
//   for (int i = 223; i >= 0; i--) {
//     if (decimal.bits[i / 32] & 1U << i % 32)
//       printf("1 ");
//     else
//       printf("0 ");
//     if (i % 32 == 0) printf("\n");
//   }
//   printf("\n");
// }

/*перобразовать децимал в большой, возвращает структура большой децимал*/
s21_big_decimal s21_turn_decimal_to_big_decimal(s21_decimal original) {
  s21_big_decimal converted = {0};
  converted.bits[0] = original.bits[0];
  converted.bits[1] = original.bits[1];
  converted.bits[2] = original.bits[2];
  converted.bits[s21_SIZE_BIG_DECIMAL - 1] =
      original.bits[s21_SIZE_DECIMAL - 1];
  return converted;
}
/*левый шифт большого децимала. не учитывает переполнения*/
s21_big_decimal leftshiftbigdecimal(s21_big_decimal original, int shift) {
  s21_big_decimal converted = {0};
  memcpy(&converted, &original, sizeof(s21_big_decimal));
  for (int j = shift; j > 0; j--) {
    for (int i = s21_SIZE_BIG_DECIMAL - 2; i >= 0; i--) {
      if (i != 0)
        converted.bits[i] =
            converted.bits[i] << 1 | converted.bits[i - 1] >> 31;
      else
        converted.bits[i] = converted.bits[i] << 1;
    }
  }
  return converted;
}
/*правый шифт большого децимала. не учитывает переполнения*/
// s21_big_decimal rightshiftbigdecimal(s21_big_decimal original, int shift) {
//   s21_big_decimal converted = {0};
//   memcpy(&converted, &original, sizeof(s21_big_decimal));
//   for (int j = 0; j < shift; j++) {
//     for (int i = 0; i <= 5; i--) {
//       if (i != 5)
//         converted.bits[i] = converted.bits[i] >> 1 | converted.bits[i + 1]
//                                                          << 31;
//       else
//         converted.bits[i] = converted.bits[i] >> 1;
//     }
//   }
//   return converted;
// }

/*проверить бит в большом децимале*/
int get_big_bit(s21_big_decimal val, int index) {
  int result = 1;
  if ((val.bits[index / 32] & (1 << index % 32)) == 0) result = 0;
  return result;
}
/*утсановить бит в большом децимале*/
void set_big_bit(s21_big_decimal* val, int index, int bit) {
  if (bit) {
    val->bits[index / 32] = val->bits[index / 32] | (1 << index % 32);
  } else {
    val->bits[index / 32] = val->bits[index / 32] & ~(1 << index % 32);
  }
}

/*перобразовать децимал в большой, возвращает структура большой децимал*/
s21_decimal s21_turn_big_decimal_to_decimal(s21_big_decimal original) {
  s21_decimal converted = {0};
  converted.bits[0] = original.bits[0];
  converted.bits[1] = original.bits[1];
  converted.bits[2] = original.bits[2];
  converted.bits[s21_SIZE_DECIMAL - 1] =
      original.bits[s21_SIZE_BIG_DECIMAL - 1];
  return converted;
}
/*определяет итоговый знак для деления и умножения*/
int signmuldiv(s21_big_decimal value1, s21_big_decimal value2) {
  return value1.sign ^ value2.sign;
}
/*принтит в строку все биты большого децимала, от большего к меньшему, слева
 * направо*/
// void printbigdecimaltableflat(s21_big_decimal decimal) {
//   for (int i = 223; i >= 0; i--) {
//     if (decimal.bits[i / 32] & (1U << i % 32))
//       printf("1");
//     else
//       printf("0");
//   }
// }

int s21_validate_decimal(s21_decimal value) {
  return value.power > 28 || value.empty1 != 0 || value.empty2 != 0;
}

void s21_make_nulldecimal_positive(s21_big_decimal* result) {
  if (result->bits[0] == 0 && result->bits[1] == 0 && result->bits[2] == 0 &&
      result->bits[3] == 0 && result->bits[4] == 0 && result->bits[5] == 0 &&
      result->bits[6] == 0 && result->bits[7] == 0 && result->bits[8] == 0) {
    result->sign = 0;
    result->power = 0;
  }
}

// void printdecimaltableflat(s21_decimal decimal) {
//   for (int i = s21_SMALL_MSB; i >= 0; i--) {
//     if (decimal.bits[i / 32] & (1U << i % 32))
//       printf("1");
//     else
//       printf("0");
//   }
// }

/* представляет число типа float в виде int и степени */
int float_to_mantissa(float src, int* exp, int* multen) {
  char str[15] = {'\0'};
  char dst[15] = {'\0'};
  char tmp[15] = {'\0'};
  int mant = 0;
  sprintf(str, "%e", src);
  strncpy(dst, str, 1);
  strncpy(tmp, str + 2, 6);
  strcat(dst, tmp);
  int j = 0;
  for (int i = strlen(str) - 1; i >= 10; i--) {
    *exp += (str[i] - '0') * pow(10, j);
    j++;
  }
  *exp = (str[9] == '-') ? -*exp : *exp;
  j = 0;
  for (int i = 6; i >= 0; i--) {
    mant += (dst[i] - '0') * pow(10, j);
    j++;
  }
  if (*exp >= 6) {
    *multen = *exp - 6;
    *exp = 0;
  } else {
    *exp = 6 - *exp;
  }
  return mant;
}