#include "t_backend.h"

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX(X, Y) ((X) > (Y) ? (X) : (Y))

tetris_location TETROMINOS[NUM_TETROMINOS][NUM_ORIENTATIONS][TETRIS] = {
    // I
    {{{1, 0}, {1, 1}, {1, 2}, {1, 3}},
     {{0, 2}, {1, 2}, {2, 2}, {3, 2}},
     {{3, 0}, {3, 1}, {3, 2}, {3, 3}},
     {{0, 1}, {1, 1}, {2, 1}, {3, 1}}},
    // J
    {{{0, 0}, {1, 0}, {1, 1}, {1, 2}},
     {{0, 1}, {0, 2}, {1, 1}, {2, 1}},
     {{1, 0}, {1, 1}, {1, 2}, {2, 2}},
     {{0, 1}, {1, 1}, {2, 0}, {2, 1}}},
    // L
    {{{0, 2}, {1, 0}, {1, 1}, {1, 2}},
     {{0, 1}, {1, 1}, {2, 1}, {2, 2}},
     {{1, 0}, {1, 1}, {1, 2}, {2, 0}},
     {{0, 0}, {0, 1}, {1, 1}, {2, 1}}},
    // O
    {{{0, 1}, {0, 2}, {1, 1}, {1, 2}},
     {{0, 1}, {0, 2}, {1, 1}, {1, 2}},
     {{0, 1}, {0, 2}, {1, 1}, {1, 2}},
     {{0, 1}, {0, 2}, {1, 1}, {1, 2}}},
    // S
    {{{0, 1}, {0, 2}, {1, 0}, {1, 1}},
     {{0, 1}, {1, 1}, {1, 2}, {2, 2}},
     {{1, 1}, {1, 2}, {2, 0}, {2, 1}},
     {{0, 0}, {1, 0}, {1, 1}, {2, 1}}},
    // T
    {{{0, 1}, {1, 0}, {1, 1}, {1, 2}},
     {{0, 1}, {1, 1}, {1, 2}, {2, 1}},
     {{1, 0}, {1, 1}, {1, 2}, {2, 1}},
     {{0, 1}, {1, 0}, {1, 1}, {2, 1}}},
    // Z
    {{{0, 0}, {0, 1}, {1, 1}, {1, 2}},
     {{0, 2}, {1, 1}, {1, 2}, {2, 1}},
     {{1, 0}, {1, 1}, {2, 1}, {2, 2}},
     {{0, 1}, {1, 0}, {1, 1}, {2, 0}}},
};

int SPEED_LEVEL[MAX_LEVEL + 1] = {
    // 50, 47, 43, 39, 35, 30, 25, 20, 15, 10, 5
    100, 80, 70, 60, 50, 40, 30, 20, 15, 10, 5};

char tg_get(GameInfo_t *obj, int row, int col) { return obj->field[row][col]; }

void tg_set(GameInfo_t *obj, int row, int col, char value) {
  obj->field[row][col] = value;
}

bool tg_check(int row, int col) {
  return 0 <= row && row < ROWS && 0 <= col && col < COLS;
}

void tg_put(GameInfo_t *obj, tetris_info block) {
  for (int i = 0; i < TETRIS; i++) {
    tetris_location cell = TETROMINOS[block.type][block.ori][i];
    tg_set(obj, block.cell.row + cell.row, block.cell.col + cell.col,
           TYPE_TO_CELL(obj->i_falling.type));
  }
}

void tg_remove(GameInfo_t *obj, tetris_info block) {
  for (int i = 0; i < TETRIS; i++) {
    tetris_location cell = TETROMINOS[block.type][block.ori][i];
    tg_set(obj, block.cell.row + cell.row, block.cell.col + cell.col, TC_EMPTY);
  }
}

bool tg_fits(GameInfo_t *obj, tetris_info block) {
  bool out = true;
  for (int i = 0; i < TETRIS && out; i++) {
    tetris_location cell = TETROMINOS[block.type][block.ori][i];
    int r = block.cell.row + cell.row;
    int c = block.cell.col + cell.col;
    if (!tg_check(r, c) || TC_IS_FILLED(tg_get(obj, r, c))) {
      out = false;
    }
  }
  return out;
}

static int random_tetromino(void) { return rand() % NUM_TETROMINOS; }

static void tg_new_falling(GameInfo_t *obj) {
  obj->i_falling = obj->i_next;
  obj->i_next.type = random_tetromino();
  obj->i_next.ori = 0;
  obj->i_next.cell.row = 0;
  obj->i_next.cell.col = COLS / 2 - 2;
}

static void tg_gravity(GameInfo_t *obj) {
  obj->speed--;
  if (obj->speed <= 0) {
    tg_remove(obj, obj->i_falling);
    obj->i_falling.cell.row++;
    if (tg_fits(obj, obj->i_falling)) {
      obj->speed = SPEED_LEVEL[obj->level];
    } else {
      obj->i_falling.cell.row--;
      tg_put(obj, obj->i_falling);

      tg_new_falling(obj);
    }
    tg_put(obj, obj->i_falling);
  }
}

static void tg_move(GameInfo_t *obj, int d) {
  tg_remove(obj, obj->i_falling);
  obj->i_falling.cell.col += d;
  if (!tg_fits(obj, obj->i_falling)) {
    obj->i_falling.cell.col -= d;
  }
  tg_put(obj, obj->i_falling);
}

static void tg_down(GameInfo_t *obj) {
  tg_remove(obj, obj->i_falling);
  while (tg_fits(obj, obj->i_falling)) {
    obj->i_falling.cell.row++;
  }
  obj->i_falling.cell.row--;
  tg_put(obj, obj->i_falling);
  tg_new_falling(obj);
}

static void tg_rotate(GameInfo_t *obj, int d) {
  tg_remove(obj, obj->i_falling);
  bool out = true;
  while (out) {
    obj->i_falling.ori = (obj->i_falling.ori + d) % NUM_ORIENTATIONS;
    if (tg_fits(obj, obj->i_falling))
      out = false;
    else {
      obj->i_falling.cell.col--;
      if (tg_fits(obj, obj->i_falling))
        out = false;
      else {
        obj->i_falling.cell.col += 2;
        if (tg_fits(obj, obj->i_falling))
          out = false;
        else
          obj->i_falling.cell.col--;
      }
    }
  }

  tg_put(obj, obj->i_falling);
}

static void tg_handle_move(GameInfo_t *obj, tetris_move move) {
  switch (move) {
    case TM_LEFT:
      tg_move(obj, -1);
      break;
    case TM_RIGHT:
      tg_move(obj, 1);
      break;
    case TM_DROP:
      tg_down(obj);
      break;
    case TM_ROTATE:
      tg_rotate(obj, 1);
      break;
    case TM_START:
      tg_init(obj, ROWS, COLS);
      break;
    case TM_TERM:
      // tg_term(obj);
      break;
    case TM_PAUSE:
      // tg_pause(obj);
      break;
    default:
      break;
  }
}

tetris_move userInput(UserAction_t action, bool hold) {
  tetris_move move = TM_NONE;
  if (hold) {
    switch (action) {
      case Start:
        move = TM_START;
        break;
      case Terminate:
        move = TM_TERM;
        break;
      case Left:
        move = TM_LEFT;
        break;
      case Right:
        move = TM_RIGHT;
        break;
      case Action:
        move = TM_ROTATE;
        break;
      case Down:
        move = TM_DROP;
        break;
      case Pause:
        move = TM_PAUSE;
        break;
      case None:
        move = TM_NONE;
        break;
      default:
        move = TM_NONE;
    }
  }
  return move;
}

static bool tg_line_full(GameInfo_t *obj, int i) {
  bool out = true;
  for (int j = 0; j < COLS && out; j++) {
    if (TC_IS_EMPTY(tg_get(obj, i, j))) out = false;
  }
  return out;
}

static void tg_shift_lines(GameInfo_t *obj, int r) {
  for (int i = r - 1; i >= 0; i--) {
    for (int j = 0; j < COLS; j++) {
      tg_set(obj, i + 1, j, tg_get(obj, i, j));
      tg_set(obj, i, j, TC_EMPTY);
    }
  }
}

int tg_check_lines(GameInfo_t *obj) {
  int lines = 0;
  tg_remove(obj, obj->i_falling);
  for (int i = ROWS - 1; i >= 0; i--) {
    if (tg_line_full(obj, i)) {
      tg_shift_lines(obj, i);
      i++;
      lines++;
    }
  }

  tg_put(obj, obj->i_falling);
  return lines;
}

bool tg_adjust_score(GameInfo_t *obj, int lines_cleared) {
  const int line_multiplier[] = {0, 100, 300, 700, 1500};
  bool out = true;
  obj->score += line_multiplier[lines_cleared];
  obj->high_score = MAX(obj->high_score, obj->score);
  if (obj->score >= ((obj->level + 1) * 600)) {
    obj->level++;
  }
  if (obj->level > MAX_LEVEL) {
    out = false;
    obj->level = MAX_LEVEL;
  }
  return out;
}

static bool tg_game_over(GameInfo_t *obj) {
  bool over = false;
  tg_remove(obj, obj->i_falling);
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < COLS; j++) {
      if (TC_IS_FILLED(tg_get(obj, i, j))) over = true;
    }
  }
  tg_put(obj, obj->i_falling);
  return over;
}

bool updateCurrentState(GameInfo_t *obj, tetris_move move) {
  int lines_cleared = 0;
  tg_gravity(obj);
  tg_handle_move(obj, move);
  lines_cleared = tg_check_lines(obj);
  return (!tg_game_over(obj)) && tg_adjust_score(obj, lines_cleared);
}

static int read_record() {
  int high_score = 0;
  FILE *file = fopen("build/high_score.txt", "r");
  if (file) {
    fscanf(file, "%d", &high_score);
    fclose(file);
  }
  return high_score;
}

void write_record(int high_score) {
  FILE *file = fopen("build/high_score.txt", "w");
  if (file) {
    fprintf(file, "%d", high_score);
    fclose(file);
  }
}

void tg_init(GameInfo_t *obj, int rows, int cols) {
  for (int i = 0; i < rows; i++)
    for (int j = 0; j < cols; j++) obj->field[i][j] = TC_EMPTY;
  obj->score = 0;
  obj->level = 0;
  obj->speed = SPEED_LEVEL[obj->level];
  obj->pause = 0;
  srand(time(NULL));
  tg_new_falling(obj);
  tg_new_falling(obj);
  obj->i_next.cell.col = COLS / 2 - 2;
  obj->high_score = read_record();
}

int tg_create(int rows, int columns, GameInfo_t *result) {
  int out = 1;
  result->field = (int **)calloc(rows, sizeof(int *));
  if (result->field == NULL)
    out = 0;
  else {
    for (int i = 0; out == 1 && i < rows; i++) {
      result->field[i] = (int *)calloc(columns, sizeof(int));
      if (result->field[i] == NULL) out = 0;
    }
  }
  return out;
}

void tg_delete(GameInfo_t *A, int rows) {
  if (A != NULL && A->field != NULL) {
    for (int i = 0; i < rows; i++) {
      if (A->field[i] != NULL) free(A->field[i]);
    }
    free(A->field);
    A->field = NULL;
  }
}