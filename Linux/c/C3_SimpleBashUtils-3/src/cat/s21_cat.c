#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "../common/common_func.h"

typedef struct Options {
  bool b;
  bool e;
  bool n;
  bool s;
  bool t;
  bool v;
} Options;

const char SHORT_OPT[] = "benstvET";
static const struct option LONG_OPT[] = {
    {"number-nonblank", no_argument, NULL, 'b'},
    {"number", no_argument, NULL, 'n'},
    {"squeeze-blank", no_argument, NULL, 's'},
    {NULL, 0, NULL, 0}};

static void instal_options(Options* const opts, int argc, char* const argv[]);
static void cat_write(FILE* file, const Options* const opts);
static void work_files(int f_count, char* const f_path[],
                       const Options* const opts);

int main(int argc, char* argv[]) {
  Options opts = {0};
  instal_options(&opts, argc, argv);
  work_files(argc - optind, argv + optind, &opts);
  return 0;
}

static void instal_options(Options* const opts, int argc, char* const argv[]) {
  int point_opt = 0;
  int cur_opt;
  while ((cur_opt = getopt_long(argc, argv, SHORT_OPT, LONG_OPT, &point_opt)) !=
         -1) {
    switch (cur_opt) {
      case 'b':
        opts->b = true;
        break;
      case 'e':
        opts->v = true;
        opts->e = true;
        break;
      case 'E':
        opts->e = true;
        break;
      case 'n':
        opts->n = true;
        break;
      case 's':
        opts->s = true;
        break;
      case 't':
        opts->v = true;
        opts->t = true;
        break;
      case 'T':
        opts->t = true;
        break;
      case 'v':
        opts->v = true;
        break;
      case '?':
      default:
        print_invalid_option();
    }
  }
  if (opts->b) {
    opts->n = false;
  }
}

static void cat_write(FILE* file, const Options* const opts) {
  static int squeeze_empty_lines = 0;
  static int prev_newline = 1;
  static int index = 0;
  int c;
  while ((c = fgetc(file)) != EOF) {
    if (!(opts->s && c == '\n' && prev_newline && squeeze_empty_lines)) {
      if (prev_newline == 1 && c == '\n')
        squeeze_empty_lines = 1;
      else
        squeeze_empty_lines = 0;
      if (((opts->n) || (opts->b && c != '\n')) && prev_newline == 1) {
        index += 1;
        printf("%6d\t", index);
      }
      if (opts->e && c == '\n') printf("$");
      if (opts->t && c == '\t') {
        printf("^");
        c = '\t' + 64;
      }
      if (opts->v) {
        if (c > 127 && c < 160) printf("M-^");
        if ((c < 32 && c != '\n' && c != '\t') || c == 127) printf("^");
        if ((c < 32 || (c > 126 && c < 160)) && c != '\n' && c != '\t')
          c = c > 126 ? c - 128 + 64 : c + 64;
      }

      putc(c, stdout);
    }
    prev_newline = (c == '\n');
  }
}

static void work_files(int f_count, char* const f_path[],
                       const Options* const opts) {
  FILE* cur_file = NULL;
  for (cur_file = NULL; f_count--; ++f_path) {
    cur_file = f_open(*f_path, "r");
    if (cur_file != NULL) {
      cat_write(cur_file, opts);
      fflush(stdout);
      fclose(cur_file);
    }
  }
}
