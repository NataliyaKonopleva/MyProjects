#ifndef T_BACKEND_H
#define T_BACKEND_H

#include <stdbool.h>
#include <stdio.h>

#define ROWS 20
#define COLS 10

#define TYPE_TO_CELL(x) ((x) + 1)

#define TC_IS_EMPTY(x) ((x) == TC_EMPTY)
#define TC_IS_FILLED(x) (!TC_IS_EMPTY(x))

#define TETRIS 4
#define NUM_TETROMINOS 7
#define NUM_ORIENTATIONS 4

#define MAX_LEVEL 10

typedef enum {
  Start,
  Pause,
  Terminate,
  Left,
  Right,
  Up,
  Down,
  Action,
  None
} UserAction_t;

typedef enum {
  TM_LEFT,
  TM_RIGHT,
  TM_ROTATE,
  TM_DROP,
  TM_NONE,
  TM_START,
  TM_TERM,
  TM_PAUSE
} tetris_move;

typedef struct {
  int row;
  int col;
} tetris_location;

typedef struct {
  tetris_location cell;
  int type;
  int ori;
} tetris_info;

typedef struct {
  int **field;
  int score;
  int high_score;
  int level;
  int speed;
  int pause;
  tetris_info i_falling;
  tetris_info i_next;
} GameInfo_t;

typedef enum {
  TC_EMPTY,
  TC_CELLI,
  TC_CELLJ,
  TC_CELLL,
  TC_CELLO,
  TC_CELLS,
  TC_CELLT,
  TC_CELLZ
} tetris_cell;

typedef enum { TET_I, TET_J, TET_L, TET_O, TET_S, TET_T, TET_Z } tetris_type;

extern tetris_location TETROMINOS[NUM_TETROMINOS][NUM_ORIENTATIONS][TETRIS];

extern int SPEED_LEVEL[MAX_LEVEL + 1];

tetris_move userInput(UserAction_t action, bool hold);
bool updateCurrentState(GameInfo_t *obj, tetris_move move);
void tg_init(GameInfo_t *obj, int rows, int cols);
int tg_create(int rows, int columns, GameInfo_t *result);
void tg_delete(GameInfo_t *A, int rows);
char tg_get(GameInfo_t *obj, int row, int col);
void write_record(int high_score);
void tg_put(GameInfo_t *obj, tetris_info block);
void tg_remove(GameInfo_t *obj, tetris_info block);
bool tg_fits(GameInfo_t *obj, tetris_info block);
void tg_set(GameInfo_t *obj, int row, int col, char value);
bool tg_adjust_score(GameInfo_t *obj, int lines_cleared);
int tg_check_lines(GameInfo_t *obj);

#endif  // T_BACKEND_H
