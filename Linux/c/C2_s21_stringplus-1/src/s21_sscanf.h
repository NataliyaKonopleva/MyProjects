#ifndef S21_SSCANF_H_
#define S21_SSCANF_H_
#include "s21_string.h"
#define s21_TRUE 1
#define s21_FALSE 0

#define s21_SPACES " \t\n\r\f\v"

typedef enum length {
  s21_l = 1,
  s21_ll,
  s21_L,
  s21_h,
} s21_length;

typedef enum specifier {
  s21_c = 1,
  s21_d,
  s21_i,
  s21_e,
  s21_E,
  s21_f,
  s21_g,
  s21_G,
  s21_s,
  s21_u,
  s21_o,
  s21_x,
  s21_X,
  s21_p,
  s21_n
} s21_specifier;

typedef struct {
  void *adress;
  char asterisk;
  int width;
  s21_length length;
  s21_specifier specifier;
  int isnegative;
  int ititialstrlen;
  int lennow;
} spec;

int s21_sscanf(const char *str, const char *format, ...);
int specificationparsing(va_list ap, spec *specification, char **formattracker);
int parsespecifierandadress(va_list ap, spec *specification,
                            char **formattracker);
int parselength(spec *specification, char **formattracker);
int parsewidth(spec *specification, char **formattracker);
void heybitchholdmyspacesXD(char **strtracker, char **formattracker);
int processinputstream(spec *specification, char **strtracker, char *buffer);
void fillthebufferstring(spec *specification, char **strtracker, char *buffer);
int numericdataintobuffer(spec *specification, char **strtracker, char *buffer);
void processsymbols(spec *specification, char **strtracker, char *buffer);
void isnegative(spec *specification, char **strtracker);
void writebuffertotheaddress(spec *specification, char *buffer);
void writeintegertoadress(spec *specification, char *buffer);
char *chosepattern(spec *specification, char **strtracker);
int processocthexprefix(spec *specification, char **strtracker, char *buffer);
long long turnstringtointeger(spec *specification, char *buffer);
void writefloattoadress(spec *specification, char *buffer);
long double turnstringtofloat(spec *specification, char *buffer);
void writeunsignedtoadress(spec *specification, char *buffer);
long long s21_atoll(const char *str);
void writepointertoadress(spec *specification, char *buffer);

#endif /*S21_SSCAN_F*/