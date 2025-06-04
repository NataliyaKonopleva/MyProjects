#include "s21_decimal.h"

/*Вроде работает))*/

s21_big_decimal s21_add_big(s21_big_decimal value, s21_big_decimal increase) {
  s21_big_decimal result = {0};
  /*работает только с одинаковыми знаками. иначе скидывает в функцию разности*/
  if (value.sign == increase.sign) {
    int tempbit = 0;
    for (int i = 0; i < s21_BIG_MSB; i++) {
      if (get_big_bit(value, i) && get_big_bit(increase, i)) {
        if (!tempbit) {
          tempbit = 1;
          set_big_bit(&result, i, 0);
        } else
          set_big_bit(&result, i, 1);
      } else if (get_big_bit(value, i) == 0 && get_big_bit(increase, i) == 0) {
        if (!tempbit)
          set_big_bit(&result, i, 0);
        else {
          set_big_bit(&result, i, 1);
          tempbit = 0;
        }
      } else {
        if (!tempbit)
          set_big_bit(&result, i, 1);
        else
          set_big_bit(&result, i, 0);
      }
    }
    result.bits[s21_SIZE_BIG_DECIMAL - 1] =
        value.bits[s21_SIZE_BIG_DECIMAL - 1];
  } else { /*вот тут отправляем разные знаки в разность.*/
    s21_big_decimal tempvalue = value;
    s21_big_decimal tempincrease = increase;
    tempincrease.sign = 0;
    tempvalue.sign = 0;
    result = value.sign == 0 ? s21_sub_big(tempvalue, tempincrease)
                             : s21_sub_big(tempincrease, tempvalue);
  }
  // s21_make_nulldecimal_positive(&result);
  return result;
}

void s21_drop_trailing_zeros(s21_big_decimal *value) {
  s21_big_decimal nulldecimal = {0};
  s21_big_decimal tendecimal = {0};
  tendecimal.bits[0] = 10;
  int firstpower = value->power;
  while (firstpower &&
         s21_is_equal_big(
             s21_sub_big(*value, s21_mul_big(s21_div_big(*value, tendecimal, 1),
                                             tendecimal)),
             nulldecimal)) {
    *value = s21_div_big(*value, tendecimal, 1);
    firstpower--;
  }
  value->power = firstpower;
}

void s21_big_equalizer(s21_big_decimal *first, s21_big_decimal *second) {
  s21_drop_trailing_zeros(*&first);
  s21_drop_trailing_zeros(*&second);
  if (first->power > second->power) {
    s21_big_decimal factor = {0};
    factor.bits[0] = 10;
    int tmpsecondpower = second->power;
    while (first->power != second->power) {
      *second = s21_mul_big(*second, factor);
      tmpsecondpower++;
      second->power = tmpsecondpower;
    }
  }
  if (first->power < second->power) {
    s21_big_decimal factor = {0};
    factor.bits[0] = 10;
    int tmpfirstpower = first->power;
    while (first->power != second->power) {
      *first = s21_mul_big(*first, factor);
      tmpfirstpower++;
      first->power = tmpfirstpower;
    }
  }
}

/*нужно сделать*/

int checkextrabits(s21_big_decimal processed) {
  return processed.bits[3] || processed.bits[4] || processed.bits[5] ||
         processed.bits[6] || processed.bits[7] || processed.bits[8];
}

/*при уменожении может получиться очень большая степень или очень большая
мантисса*/
/*в остальных операциях степень будет равна, и слишком большой может
оказаться лишь манитисса*/

int s21_big_normalizer(s21_big_decimal original, s21_big_decimal *result) {
  RETURN_VALUE CODEERROR = 0;
  s21_big_decimal nulldecimal = {0};
  s21_big_decimal processed = {0};
  processed = original;
  while (processed.power > 28 ||
         (processed.power > 0 && checkextrabits(processed)))
    processed = s21_round_banking_big(
        processed); /*округляем банковски пока не скинем степень меньше 28, пока
                       экстра биты знаты и степень больше ноля*/
  s21_drop_trailing_zeros(&processed);
  if (checkextrabits(processed) && processed.sign == 0) CODEERROR = TO_LARGE;
  if (checkextrabits(processed) && processed.sign == 1) CODEERROR = TO_SMALL;
  if (!s21_is_equal_big(original, nulldecimal) &&
      s21_is_equal_big(processed, nulldecimal))
    CODEERROR = TO_SMALL;
  if (!CODEERROR)
    *result = processed;  // если нет ошибок - записываем в результат
  return CODEERROR;
}
// variation == 1 целочисленное деление
// variation == 0 деление с дробной частью
// mumerator что делим
// denominator на что делим
s21_big_decimal s21_div_big(s21_big_decimal numerator,
                            s21_big_decimal denominator, int variation) {
  s21_big_decimal remainder = {0};
  s21_big_decimal result = {0};
  s21_big_decimal tempnumerator = numerator;
  s21_big_decimal tempdenominator = denominator;
  // зануляем степени и знаки
  tempnumerator.bits[s21_SIZE_BIG_DECIMAL - 1] = 0;
  tempdenominator.bits[s21_SIZE_BIG_DECIMAL - 1] = 0;
  /*работаем с целочисленным делением*/
  for (int i = s21_BIG_MSB; i >= 0; i--) {
    remainder = leftshiftbigdecimal(remainder, 1);
    remainder.bits[0] |= get_big_bit(tempnumerator, i);
    if (s21_is_greater_big(remainder, tempdenominator) == 0 &&
        s21_is_equal_big(remainder, tempdenominator) == 0) {
      result = leftshiftbigdecimal(result, 1);
      set_big_bit(&result, 0, 0);
    }
    if (s21_is_greater_big(remainder, tempdenominator) == 1 ||
        s21_is_equal_big(remainder, tempdenominator) == 1) {
      result = leftshiftbigdecimal(result, 1);
      set_big_bit(&result, 0, 1);
      remainder = s21_sub_big(remainder, tempdenominator);
    }
  }
  /*работаем с остатком*/
  s21_big_decimal nulldecimal = {0};
  if (!variation && s21_is_equal_big(remainder, nulldecimal) != 1) {
    s21_big_decimal tendecimal = {0};
    tendecimal.bits[0] = 10;
    static s21_big_decimal subtotal = {0};
    static int subtotalpower = 0;
    if (subtotal.bits[5] == 0 && subtotalpower < 30) {
      subtotal = s21_add_big(subtotal, result);
      subtotal = s21_mul_big(subtotal, tendecimal);
      subtotalpower++;
      subtotal.power = subtotalpower;
      remainder = s21_mul_big(remainder, tendecimal);
      result = s21_div_big(remainder, tempdenominator, 0);
      subtotalpower--;
      if (s21_is_equal_big(subtotal, result) != 1)
        subtotal = s21_add_big(subtotal, result);
    }
    result = subtotal;
    if (subtotalpower == 0) memset(&subtotal, 0, sizeof(s21_big_decimal));
  }
  result.sign = signmuldiv(numerator, denominator); /*присваиваем  знак
                          в конце, чтоб функция разности отработала правильно, и
                          не задействовала сложение из-за различия знаков*/
  return result;
}

int s21_is_equal_big(s21_big_decimal val_1, s21_big_decimal val_2) {
  s21_big_decimal val1 = {0};
  s21_big_decimal val2 = {0};
  val1 = val_1;
  val2 = val_2;
  s21_make_nulldecimal_positive(&val1);
  s21_make_nulldecimal_positive(&val2);
  int result = 1;
  int stop = 0;
  if (val1.sign == 0) {
    if (val2.sign != 0)
      result = 0;
    else
      for (int i = s21_BIG_MSB; i >= 0 && !stop; i--) {
        if (get_big_bit(val1, i) != get_big_bit(val2, i)) {
          result = 0;
          stop = 1;
        }
      }
  } else {
    if (val2.sign == 0)
      result = 0;
    else
      for (int i = s21_BIG_MSB; i >= 0 && !stop; i--) {
        if (get_big_bit(val1, i) != get_big_bit(val2, i)) {
          result = 0;
          stop = 1;
        }
      }
  }
  return result;
}

int s21_is_greater_big(s21_big_decimal bigvalue_1, s21_big_decimal bigvalue_2) {
  s21_big_decimal val1 = {0};
  s21_big_decimal val2 = {0};
  val1 = bigvalue_1;
  val2 = bigvalue_2;
  s21_make_nulldecimal_positive(&val1);
  s21_make_nulldecimal_positive(&val2);
  int result = 0;
  int stop = 0;
  if (val1.sign == 0) {
    if (val2.sign != 0)
      result = 1;
    else
      for (int i = s21_BIG_MSB; i >= 0 && !stop; i--) {
        if (get_big_bit(val1, i) > get_big_bit(val2, i)) {
          result = 1;
          stop = 1;
        }
        if (get_big_bit(val1, i) < get_big_bit(val2, i)) stop = 1;
      }
  } else {
    if (val2.sign == 0)
      result = 0;
    else
      for (int i = s21_BIG_MSB; i >= 0 && !stop; i--) {
        if (get_big_bit(val1, i) < get_big_bit(val2, i)) {
          result = 1;
          stop = 1;
        }
        if (get_big_bit(val1, i) > get_big_bit(val2, i)) stop = 1;
      }
  }
  return result;
}

void decide_sub_result_sign(s21_big_decimal term, s21_big_decimal minuend,
                            s21_big_decimal *value_1, s21_big_decimal *value_2,
                            s21_big_decimal *result) {
  if (term.sign == 0) {
    if (s21_is_greater_or_equal_big(term, minuend) == 1) {
      *value_1 = term;
      *value_2 = minuend;
      result->sign = 0;
    } else {
      *value_1 = minuend;
      *value_2 = term;
      result->sign = 1;
    }
  }
  if (term.sign != 0) {
    if (s21_is_greater_or_equal_big(term, minuend) == 0) {
      *value_1 = term;
      *value_2 = minuend;
      result->sign = 1;
    } else {
      *value_1 = minuend;
      *value_2 = term;
      result->sign = 0;
    }
  }
}
s21_big_decimal s21_sub_big(s21_big_decimal term, s21_big_decimal minuend) {
  s21_big_decimal result = {0};
  s21_big_decimal value_1 = {0};
  s21_big_decimal value_2 = {0};
  if (term.sign == minuend.sign) {
    decide_sub_result_sign(term, minuend, &value_1, &value_2, &result);
    int dept = 0;
    for (int i = 0; i < s21_BIG_MSB; i++) {
      if (get_big_bit(value_1, i) == 1 && get_big_bit(value_2, i) == 1) {
        set_big_bit(&result, i, 0);
      }
      if (get_big_bit(value_1, i) == 1 && get_big_bit(value_2, i) == 0) {
        set_big_bit(&result, i, 1);
      }
      if (get_big_bit(value_1, i) == 0 && get_big_bit(value_2, i) == 1) {
        if (dept > 0) {
          set_big_bit(&result, i, 0);
          dept--;
        } else if (dept == 0) {
          while (get_big_bit(value_1, dept + i) == 0) dept++;
          set_big_bit(&value_1, dept + i, 0);
          set_big_bit(&result, i, 1);
          dept--;
        }
      }
      if (get_big_bit(value_1, i) == 0 && get_big_bit(value_2, i) == 0) {
        if (dept == 0) set_big_bit(&result, i, 0);
        if (dept > 0) {
          set_big_bit(&result, i, 1);
          dept--;
        }
      }
    }
  } else {
    value_1 = minuend;
    value_2 = term;
    value_1.sign = 0;
    value_2.sign = 0;
    result = s21_add_big(value_1, value_2);
    result.sign = minuend.sign == 0 ? 1 : 0;
  }
  result.power = value_1.power;
  return result;
}

/* округляет БОЛЬШОЙ децимал, в сторону целого! на 1 знак после запятой!
 * Округляет не дальше чем до целого
 Округляет по типу БАНКОВСКОГО ОКРУГЛЕНИЯ*/

s21_big_decimal s21_round_big(s21_big_decimal value) {
  s21_big_decimal processed = {0};
  processed = value;
  if (value.power != 0) {
    s21_big_decimal fivedecimal = {0};
    fivedecimal.bits[0] = 5;
    s21_big_decimal tendecimal = {0};
    tendecimal.bits[0] = 10;
    fivedecimal.sign = value.sign;
    if (value.power == 1) processed = s21_add_big(processed, fivedecimal);
    processed = s21_div_big(processed, tendecimal, 1);
    processed.power = value.power - 1;
  }
  return processed;
}

s21_big_decimal s21_round_banking_big(s21_big_decimal value) {
  s21_big_decimal processed = {0};
  processed = value;

  if (value.power != 0) {
    s21_big_decimal fivedecimal = {0};
    s21_big_decimal tendecimal = {0};
    s21_big_decimal difference = {0};
    fivedecimal.bits[0] = 5;
    tendecimal.bits[0] = 10;
    s21_big_decimal rule = {0};
    fivedecimal.sign = value.sign;
    difference = s21_div_big(processed, tendecimal, 1);
    difference = s21_mul_big(difference, tendecimal);
    difference = s21_sub_big(value, difference);
    rule = s21_div_big(value, tendecimal, 1);
    if (value.power - 1 <= 28 && !checkextrabits(rule)) {
      if (s21_is_equal_big(difference, fivedecimal)) {
        if (get_big_bit(s21_div_big(processed, tendecimal, 1), 0)) {
          processed = s21_add_big(processed, fivedecimal);
          processed = s21_div_big(processed, tendecimal, 1);
        } else {
          processed = s21_div_big(processed, tendecimal, 1);
        }
        processed.power = value.power - 1;
      } else {
        processed = s21_add_big(processed, fivedecimal);
        processed = s21_div_big(processed, tendecimal, 1);
        processed.power = value.power - 1;
      }
    } else {
      processed = rule;
      processed.power = value.power - 1;
    }
  }

  return processed;
}

s21_big_decimal s21_mul_big(s21_big_decimal value, s21_big_decimal factor) {
  s21_big_decimal result = {0};
  s21_big_decimal increase = {0};
  for (int i = 0; i < s21_BIG_MSB; i++) {
    memset(&increase, 0, sizeof(s21_big_decimal));
    if (get_big_bit(factor, i)) {
      increase = leftshiftbigdecimal(value, i);
      result = s21_add_big(result, increase);
    }
  }
  result.power = value.power + factor.power;
  result.sign = signmuldiv(
      value, factor); /*присваиваем степень и знак в конце, чтоб функция
                         сложения отработала правильно, и не задействовала
                         вычитание из-за различия знаков*/
  return result;
}

int s21_is_greater_or_equal_big(s21_big_decimal val1, s21_big_decimal val2) {
  return s21_is_equal_big(val1, val2) || s21_is_greater_big(val1, val2);
}