#ifndef T_FRONTEND_H
#define T_FRONTEND_H

#include <ncurses.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "../../brick_game/tetris/t_backend.h"

#define COLS_PER_CELL 2

#define ADD_BLOCK(w, x)                         \
  waddch((w), ' ' | A_REVERSE | COLOR_PAIR(x)); \
  waddch((w), ' ' | A_REVERSE | COLOR_PAIR(x))
#define ADD_EMPTY(w) \
  waddch((w), ' ');  \
  waddch((w), ' ')

void displayBoard(WINDOW *w, GameInfo_t *obj);
void displayPiece(WINDOW *w, tetris_info block);
void displayScore(WINDOW *w, GameInfo_t *tg);
void displayGameOver(WINDOW *w, GameInfo_t *tg);
void displayPause(WINDOW *w);
void displayStart(WINDOW *w);
void initColors(void);
void sleepMilli(int milliseconds);
void initCurses();
bool GameOver(GameInfo_t *tg, WINDOW *w);
void GamePause(WINDOW *w);

#endif