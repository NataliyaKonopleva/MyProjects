#define _GNU_SOURCE

#include <ctype.h>
#include <getopt.h>
#include <regex.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../common/common_func.h"

#define PATTERNS_INIT 128
#define PATTERNS_ADD 128

#define BUFFER_INIT 128
#define BUFFER_MULT 2

struct Patterns {
  char **data;
  regex_t *reg_data;
  size_t cur_size;
  size_t max_size;
};

struct Options {
  bool e;
  bool f;
  bool i;
  bool s;
  bool v;
  bool n;
  bool h;
  bool o;
  bool l;
  bool c;
  struct Patterns patts;
  size_t file_count;
};

typedef struct Patterns Patterns;
typedef struct Options Options;

static const char Short_Opts[] = "e:f:isvnholc";

static const struct option Long_Opts[] = {
    {"regexp", required_argument, NULL, 'e'},
    {"file", required_argument, NULL, 'f'},
    {"ignore-case", no_argument, NULL, 'i'},
    {"no-messages", no_argument, NULL, 's'},
    {"invert-match", no_argument, NULL, 'v'},
    {"line-number", no_argument, NULL, 'n'},
    {"no-filename", no_argument, NULL, 'h'},
    {"only-matching", no_argument, NULL, 'o'},
    {"files-with-matches", no_argument, NULL, 'l'},
    {"count", no_argument, NULL, 'c'},
    {NULL, 0, NULL, 0}};

static void instal_opts(Options *const opts, int argc, char *const argv[]);
static void free_opts(Options *const opts);
static void set_opts(Options *const opts, const char opt);

static void init_patts(Patterns *const patts);
static void free_pats(Patterns *const patts);

static void add_pats_into_str(Patterns *const patts, const char *const str);
static void add_pats(Patterns *const patts, const char *const patt);
static void add_pats_from_file(Patterns *const patts, char *const filename);
static void compile_pats(Options *const opts);
static void buffer_file(FILE *file, char *buffer);
static void work_files(int file_cnt, char *const file_path[],
                       const Options *const opts);

static void greping_file(FILE *file, const char *filename,
                         const Options *const opts);

static void grep_l(FILE *file, const char *filename, const Options *const opts);

static bool is_match(const char *line, const Options *const opts,
                     regmatch_t *const match);
static void grep_c(FILE *file, const char *filename, const Options *const opts);

static void greping(FILE *file, const char *filename,
                    const Options *const opts);
static void grep_o(FILE *file, const char *filename, const Options *const opts);

int main(int argc, char *argv[]) {
  Options opts = {0};
  instal_opts(&opts, argc, argv);
  work_files(argc - optind, argv + optind, &opts);
  free_opts(&opts);
  return 0;
}

static void instal_opts(Options *const opts, int argc, char *const argv[]) {
  init_patts(&opts->patts);
  int longind = 0;
  char curr_opt = getopt_long(argc, argv, Short_Opts, Long_Opts, &longind);
  while (curr_opt != -1) {
    set_opts(opts, curr_opt);
    curr_opt = getopt_long(argc, argv, Short_Opts, Long_Opts, &longind);
  }
  if (!opts->e && !opts->f) {
    add_pats_into_str(&opts->patts, argv[optind++]);
  }
  compile_pats(opts);
  opts->file_count = argc - optind;
}

static void compile_pats(Options *const opts) {
  Patterns *patts = &opts->patts;
  patts->reg_data = safe_malloc(sizeof(regex_t) * patts->cur_size);
  int reg_icase = opts->i ? REG_ICASE : 0;
  for (size_t i = 0; i < patts->cur_size; ++i) {
    regcomp(&patts->reg_data[i], patts->data[i], reg_icase);
  }
}

static void free_opts(Options *const opts) { free_pats(&opts->patts); }

static void init_patts(Patterns *const patts) {
  patts->cur_size = 0;
  patts->max_size = PATTERNS_INIT;
  patts->data = safe_malloc(sizeof(char *) * patts->max_size);
}

static void free_pats(Patterns *const patts) {
  for (size_t i = 0; i < patts->cur_size; ++i) {
    free(patts->data[i]);
    regfree(&patts->reg_data[i]);
  }
  free(patts->data);
  free(patts->reg_data);
}

static void set_opts(Options *const opts, const char opt) {
  switch (opt) {
    case 'e':
      opts->e = true;
      add_pats_into_str(&opts->patts, optarg);
      break;
    case 'f':
      opts->f = true;
      add_pats_from_file(&opts->patts, optarg);
      break;
    case 'i':
      opts->i = true;
      break;
    case 's':
      opts->s = true;
      break;
    case 'v':
      opts->v = true;
      break;
    case 'n':
      opts->n = true;
      break;
    case 'h':
      opts->h = true;
      break;
    case 'o':
      opts->o = true;
      break;
    case 'l':
      opts->l = true;
      break;
    case 'c':
      opts->c = true;
      break;
    case '?':
    default:
      print_invalid_option();
  }
}

static void add_pats_into_str(Patterns *const patts, const char *const str) {
  char *temp_patts = safe_malloc(sizeof(char) * strlen(str) + sizeof(char));
  strcpy(temp_patts, str);
  char *token = strtok(temp_patts, "\n");
  while (token != NULL) {
    add_pats(patts, token);
    token = strtok(NULL, "\n");
  }
  free(temp_patts);
}

static void add_pats(Patterns *const patts, const char *const patt) {
  if (patts->cur_size == patts->max_size) {
    patts->max_size += PATTERNS_ADD;
    patts->data = safe_realloc(patts->data, patts->max_size * sizeof(char *));
  }
  patts->data[patts->cur_size] =
      safe_malloc(sizeof(char) * strlen(patt) + sizeof(char));
  strcpy(patts->data[patts->cur_size++], patt);
}

static void add_pats_from_file(Patterns *const patts, char *const filename) {
  FILE *file = f_open(filename, "r");
  if (file != NULL) {
    char *buffer = safe_malloc(sizeof(char) * BUFFER_INIT);
    buffer_file(file, buffer);
    add_pats_into_str(patts, buffer);
    free(buffer);
    fclose(file);
  } else
    exit(EXIT_FAILURE);
}

static void buffer_file(FILE *file, char *buffer) {
  size_t size = 0;
  size_t max_size = BUFFER_INIT;
  char symbol = fgetc(file);
  while (!feof(file)) {
    buffer[size++] = symbol;
    symbol = fgetc(file);
    if (size == max_size) {
      max_size *= BUFFER_MULT;
      buffer = safe_realloc(buffer, max_size * sizeof(char));
    }
  }
  buffer[size] = '\0';
}

static void work_files(int file_count, char *const file_path[],
                       const Options *const opts) {
  for (FILE *curr_file = NULL; file_count--; ++file_path) {
    curr_file = fopen(*file_path, "r");
    if (curr_file != NULL) {
      greping_file(curr_file, *file_path, opts);
      fflush(stdout);
      fclose(curr_file);
    } else if (!opts->s) {
      fprintf(stderr, "%s: No such file or directory\n", *file_path);
    }
  }
}

static void greping_file(FILE *file, const char *filename,
                         const Options *const opts) {
  if (opts->l) {
    grep_l(file, filename, opts);
  } else if (opts->c) {
    grep_c(file, filename, opts);
  } else if (opts->o) {
    grep_o(file, filename, opts);
  } else {
    greping(file, filename, opts);
  }
}

static void grep_l(FILE *file, const char *filename,
                   const Options *const opts) {
  char *buffer = safe_malloc(sizeof(char) * BUFFER_INIT);
  size_t buffer_size = BUFFER_INIT;
  while (getline(&buffer, &buffer_size, file) != EOF) {
    if (is_match(buffer, opts, NULL)) {
      fprintf(stdout, "%s\n", filename);
      break;
    }
  }
  free(buffer);
}

static bool is_match(const char *line, const Options *const opts,
                     regmatch_t *const match) {
  const Patterns *const patts = &opts->patts;
  bool result = false;
  size_t nmatch = match ? 1 : 0;
  for (size_t i = 0; i < patts->cur_size; ++i) {
    if (regexec(&patts->reg_data[i], line, nmatch, match, 0) == 0) {
      result = true;
    }
  }
  if (opts->v) {
    result = !result;
    if (opts->o) {
      result = false;
    }
  }
  return result;
}

static void grep_c(FILE *file, const char *filename,
                   const Options *const opts) {
  size_t match_count = 0;
  char *buffer = safe_malloc(sizeof(char) * BUFFER_INIT);
  size_t buffer_size = BUFFER_INIT;
  while (getline(&buffer, &buffer_size, file) != EOF) {
    if (is_match(buffer, opts, NULL)) {
      ++match_count;
    }
  }
  if (opts->file_count > 1 && !opts->h) {
    fprintf(stdout, "%s:", filename);
  }
  fprintf(stdout, "%zu\n", match_count);
  free(buffer);
}

static void greping(FILE *file, const char *filename,
                    const Options *const opts) {
  char *line = safe_malloc(sizeof(char) * BUFFER_INIT);
  size_t line_size = BUFFER_INIT;
  size_t line_count = 0;
  while (getline(&line, &line_size, file) != EOF) {
    ++line_count;
    if (is_match(line, opts, NULL)) {
      if (opts->file_count > 1 && !opts->h) {
        fprintf(stdout, "%s:", filename);
      }
      if (opts->n) {
        fprintf(stdout, "%zu:", line_count);
      }
      fprintf(stdout, "%s", line);
    }
  }
  free(line);
}

static void grep_o(FILE *file, const char *filename,
                   const Options *const opts) {
  char *line = safe_malloc(sizeof(char) * BUFFER_INIT);
  size_t line_size = BUFFER_INIT;
  size_t line_count = 0;
  regmatch_t match = {0};
  while (getline(&line, &line_size, file) != EOF) {
    char *line_ptr = line;
    ++line_count;
    while (is_match(line_ptr, opts, &match)) {
      if (opts->file_count > 1 && !opts->h) {
        fprintf(stdout, "%s:", filename);
      }
      if (opts->n) {
        fprintf(stdout, "%zu:", line_count);
      }
      fprintf(stdout, "%.*s\n", ((int)(match.rm_eo - match.rm_so)),
              (line_ptr + match.rm_so));
      line_ptr += match.rm_eo;
    }
  }
  free(line);
}
