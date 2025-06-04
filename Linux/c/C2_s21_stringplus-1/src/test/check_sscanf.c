#include "../s21_tests.h"

START_TEST(basic_test) {
  
  /*переменные для нашего сканф*/
  char adress11[1000] = "text11";
  char adress12[1000] = "text12";
  char adress13[1000] = "text13";
  int a1=0;
  long long int b1=0;
  long int c1=0;
  long double x1 = 0;
  char y1 = 0;
  char p1 =0;
  char z1[100] = {0}; 
  void *px1=NULL;
  int s1=0;
  int n1=0;
/*переменные для базового сканф*/

  char adress21[1000] = "text11";
  char adress22[1000] = "text12";
  char adress23[1000] = "text13";
  int a2=0;
  long long int b2=0;
  long int c2=0;
  long double x2 = 0;
  char y2 = 0;
  char p2 =0;
  char z2[100] = {0};
  void *px2=NULL;
  int s2=0;
  int n2=0;
  setlocale(LC_ALL, ""); /*устанавливает настройки системы по умолчанию*/
  setlocale(LC_NUMERIC, "en_US.UTF-8"); /*устанавливает настройки системы по умолчанию*/
    s1=s21_sscanf("0xf123 %1.442695E+27 34 \t%\n48 5e3 4some_text here", "%p%%%Lf%1c%2d%1llu%2li%3c\t%%\n%n%10s%s%s%s",&px1,&x1,&y1,&a1,&b1,&c1,&p1,&n1,
             z1, adress11, adress12, adress13);

    s2=sscanf("0xf123 %1.442695E+27 34 \t%\n48 5e3 4some_text here", "%p%%%Lf%1c%2d%1llu%2li%3c\t%%\n%n%10s%s%s%s",&px2,&x2,&y2,&a2,&b2,&c2,&p2,&n2,
             z2, adress21, adress22, adress23);


ck_assert_int_eq(b1,b2);
ck_assert_int_eq(c1,c2);
ck_assert_int_eq(n1,n2);
ck_assert_int_eq(y1,y2);
ck_assert_str_eq(adress11,adress21);
ck_assert_str_eq(adress12,adress22);
ck_assert_int_eq(s1,s2);
ck_assert_str_eq(adress13,adress23);

ck_assert_double_eq(x1,x2);



p2=p1;
px2=px1;

}
END_TEST


Suite *suite_sscanf(void) {

  Suite *s = suite_create("suite_scanf");
  TCase *tc = tcase_create("tc_scanf");

  tcase_add_test(tc, basic_test);
  suite_add_tcase(s, tc);
  return s;
}