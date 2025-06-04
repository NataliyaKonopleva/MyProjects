#include "t_frontend.h"

int main() {
  GameInfo_t tg;
  tetris_move move = TM_NONE;
  UserAction_t act = Start;
  int out = tg_create(ROWS + 2, COLS, &tg);
  if (out) {
    WINDOW *board, *next, *score;
    tg_init(&tg, ROWS, COLS);
    initCurses();
    board = newwin(ROWS + 2, 2 * COLS + 2, 0, 0);
    next = newwin(6, 10, 0, 2 * (COLS + 1) + 1);
    score = newwin(10, 22, 8, 2 * (COLS + 1) + 1);
    int ch = getch();
    while (ch != 's' && ch != 'q') {
      ch = getch();
      displayStart(board);
      sleepMilli(10);
    }
    if (ch == 's') {
      bool running = true, hold = true;
      while (running) {
        running = updateCurrentState(&tg, move);
        if (!running) {
          running = GameOver(&tg, board);
        }
        displayBoard(board, &tg);
        displayPiece(next, tg.i_next);
        displayScore(score, &tg);
        doupdate();
        sleepMilli(10);
        switch (getch()) {
          case KEY_LEFT:
            act = Left;
            break;
          case KEY_RIGHT:
            act = Right;
            break;
          case ' ':
            act = Action;
            break;
          case KEY_DOWN:
            act = Down;
            break;
          case 'q':
            running = GameOver(&tg, board);
            break;
          case 'p':
            GamePause(board);
            act = Pause;
            break;
          case 's':
            act = Start;
            break;
          default:
            act = None;
            break;
        }
        move = userInput(act, hold);
      }
      write_record(tg.high_score);
    }
    wclear(stdscr);
    endwin();
    tg_delete(&tg, ROWS + 2);
  }
  return 0;
}

void displayBoard(WINDOW *w, GameInfo_t *obj) {
  box(w, 0, 0);
  for (int i = 0; i < ROWS; i++) {
    wmove(w, 1 + i, 1);
    for (int j = 0; j < COLS; j++) {
      if (TC_IS_FILLED(tg_get(obj, i, j))) {
        ADD_BLOCK(w, tg_get(obj, i, j));
      } else {
        ADD_EMPTY(w);
      }
    }
  }
  wnoutrefresh(w);
}

void displayPiece(WINDOW *w, tetris_info block) {
  wclear(w);
  box(w, 0, 0);
  if (block.type != -1) {
    for (int b = 0; b < TETRIS; b++) {
      tetris_location c = TETROMINOS[block.type][block.ori][b];
      wmove(w, c.row + 1, c.col * COLS_PER_CELL + 1);
      ADD_BLOCK(w, TYPE_TO_CELL(block.type));
    }
  }
  wnoutrefresh(w);
}

void displayScore(WINDOW *w, GameInfo_t *tg) {
  wclear(w);
  wprintw(w, "High score:%d\n", tg->high_score);
  wprintw(w, "Score:%d\n", tg->score);
  wprintw(w, "Level:%d\n", tg->level);
  wprintw(w, "Speed:%d\n", 150 - SPEED_LEVEL[tg->level]);
  wprintw(w, "\n");
  wprintw(w, "Move: LEFT,RIGHT,\n");
  wprintw(w, "DOWN,SPACE\n");
  wprintw(w, "Management: s-START,\n");
  wprintw(w, "p-PAUSE/UNPAUSE,q-QUIT");
  wnoutrefresh(w);
}

void displayGameOver(WINDOW *w, GameInfo_t *tg) {
  wclear(w);
  box(w, 0, 0);
  wmove(w, 5, 7);
  wprintw(w, "Game over!\n");
  wmove(w, 8, 5);
  wprintw(w, "You finished\n");
  wmove(w, 9, 5);
  wprintw(w, "with %d points\n", tg->score);
  wmove(w, 10, 5);
  wprintw(w, "on level %d\n", tg->level);
  wmove(w, 11, 5);
  wprintw(w, "High score %d\n", tg->high_score);
  wmove(w, 12, 5);
  wprintw(w, "Max level %d\n", MAX_LEVEL);
  box(w, 0, 0);
  wrefresh(w);
}

void displayPause(WINDOW *w) {
  wclear(w);
  box(w, 0, 0);
  wmove(w, 10, 7);
  wprintw(w, "PAUSED");
  wrefresh(w);
}

void displayStart(WINDOW *w) {
  wclear(w);
  box(w, 0, 0);
  wmove(w, 10, 2);
  wprintw(w, "Welcome to Tetris!");
  wmove(w, 11, 3);
  wprintw(w, "s-START, q-QUIT");
  wrefresh(w);
}

void initColors(void) {
  start_color();
  init_pair(TC_CELLI, COLOR_CYAN, COLOR_BLACK);
  init_pair(TC_CELLJ, COLOR_BLUE, COLOR_BLACK);
  init_pair(TC_CELLL, COLOR_WHITE, COLOR_BLACK);
  init_pair(TC_CELLO, COLOR_YELLOW, COLOR_BLACK);
  init_pair(TC_CELLS, COLOR_GREEN, COLOR_BLACK);
  init_pair(TC_CELLT, COLOR_MAGENTA, COLOR_BLACK);
  init_pair(TC_CELLZ, COLOR_RED, COLOR_BLACK);
}

void sleepMilli(int milliseconds) {
  struct timespec ts;
  ts.tv_sec = 0;
  ts.tv_nsec = milliseconds * 1000 * 1000;
  nanosleep(&ts, NULL);
}

void initCurses() {
  initscr();             // initialize curses
  cbreak();              // pass key presses to program, but not signals
  noecho();              // don't echo key presses to screen
  keypad(stdscr, TRUE);  // allow arrow keys
  timeout(0);            // no blocking on getch()
  curs_set(0);           // set the cursor to invisible
  initColors();          // setup tetris colors
}

bool GameOver(GameInfo_t *tg, WINDOW *w) {
  int ch = getch();
  bool run = false;
  while (ch != 's' && ch != 'q') {
    ch = getch();
    displayGameOver(w, tg);
    sleepMilli(10);
  }
  if (ch == 's') {
    run = true;
    write_record(tg->high_score);
    tg_init(tg, ROWS, COLS);
  }
  return run;
}

void GamePause(WINDOW *w) {
  int ch = getch();
  while (ch != 'p') {
    ch = getch();
    displayPause(w);
    sleepMilli(10);
  }
}