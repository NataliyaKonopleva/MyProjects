#include "test.h"

START_TEST(init_create) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  ck_assert_int_eq(tg.score, 0);

  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_put) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  ck_assert_int_eq(tg.field[1][2], 4);
  ck_assert_int_eq(tg.field[1][3], 4);
  ck_assert_int_eq(tg.field[2][2], 4);
  ck_assert_int_eq(tg.field[2][3], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_remove) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  tg_remove(&tg, tg.i_falling);
  ck_assert_int_eq(tg.field[1][2], 0);
  ck_assert_int_eq(tg.field[1][3], 0);
  ck_assert_int_eq(tg.field[2][2], 0);
  ck_assert_int_eq(tg.field[2][3], 0);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_fits1) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  tg.i_falling.cell.row = 2;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 1;
  tg_put(&tg, tg.i_falling);
  ck_assert_int_eq(tg_fits(&tg, tg.i_falling), 0);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_fits2) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  tg.i_falling.cell.row = 4;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 1;
  ck_assert_int_eq(tg_fits(&tg, tg.i_falling), 1);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_start) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.score = 1000;
  tg.level = 10;
  UserAction_t a = Start;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.score, 0);
  ck_assert_int_eq(tg.level, 0);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_left) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Left;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[2][1], 4);
  ck_assert_int_eq(tg.field[2][2], 4);
  ck_assert_int_eq(tg.field[3][1], 4);
  ck_assert_int_eq(tg.field[3][2], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_right) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Right;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[2][3], 4);
  ck_assert_int_eq(tg.field[2][4], 4);
  ck_assert_int_eq(tg.field[3][3], 4);
  ck_assert_int_eq(tg.field[3][4], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_down) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Down;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[18][2], 4);
  ck_assert_int_eq(tg.field[18][3], 4);
  ck_assert_int_eq(tg.field[19][2], 4);
  ck_assert_int_eq(tg.field[19][3], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_rotate) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_I;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Action;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[2][3], 1);
  ck_assert_int_eq(tg.field[3][3], 1);
  ck_assert_int_eq(tg.field[4][3], 1);
  ck_assert_int_eq(tg.field[5][3], 1);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_high_score) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  ck_assert_int_eq(tg.high_score, 0);
  tg.high_score = 100;
  write_record(tg.high_score);
  tg_init(&tg, r + 2, c);
  ck_assert_int_eq(tg.high_score, 100);
  write_record(0);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_score) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  for (int i = 3; i < 6; i++)
    for (int j = 0; j < c; j++) tg_set(&tg, i, j, 4);
  tg_adjust_score(&tg, tg_check_lines(&tg));
  ck_assert_int_eq(tg.score, 700);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_none) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_I;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = None;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[3][1], 1);
  ck_assert_int_eq(tg.field[3][2], 1);
  ck_assert_int_eq(tg.field[3][3], 1);
  ck_assert_int_eq(tg.field[3][4], 1);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_pause) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_I;
  tg.i_falling.ori = 0;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Pause;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[3][1], 1);
  ck_assert_int_eq(tg.field[3][2], 1);
  ck_assert_int_eq(tg.field[3][3], 1);
  ck_assert_int_eq(tg.field[3][4], 1);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_graviti) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg.level = MAX_LEVEL + 1;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Down;
  tg.speed = 0;
  for (int j = 0; j <= c - 1; j++) tg_set(&tg, 10, j, 10);
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[10][2], 4);
  ck_assert_int_eq(tg.field[10][3], 4);
  ck_assert_int_eq(tg.field[9][2], 4);
  ck_assert_int_eq(tg.field[9][3], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_none) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg.level = MAX_LEVEL + 1;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = None;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[2][2], 4);
  ck_assert_int_eq(tg.field[2][3], 4);
  ck_assert_int_eq(tg.field[3][2], 4);
  ck_assert_int_eq(tg.field[3][3], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(init_term) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 1;
  tg.i_falling.type = TET_O;
  tg.i_falling.ori = 0;
  tg.level = MAX_LEVEL + 1;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Terminate;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[2][2], 4);
  ck_assert_int_eq(tg.field[2][3], 4);
  ck_assert_int_eq(tg.field[3][2], 4);
  ck_assert_int_eq(tg.field[3][3], 4);
  tg_delete(&tg, r + 2);
}
END_TEST

START_TEST(userInput_rotate1) {
  GameInfo_t tg;
  int r = 20, c = 10;
  tg_create(r + 2, c, &tg);
  tg_init(&tg, r + 2, c);
  tg.i_falling.cell.row = 1;
  tg.i_falling.cell.col = 7;
  tg.i_falling.type = TET_I;
  tg.i_falling.ori = 1;
  tg_put(&tg, tg.i_falling);
  UserAction_t a = Action;
  tg.speed = 0;
  updateCurrentState(&tg, userInput(a, true));
  ck_assert_int_eq(tg.field[5][6], 1);
  ck_assert_int_eq(tg.field[5][7], 1);
  ck_assert_int_eq(tg.field[5][8], 1);
  ck_assert_int_eq(tg.field[5][9], 1);
  tg_delete(&tg, r + 2);
}
END_TEST

Suite *tetris_suite() {
  Suite *s = suite_create("tetris_suite");
  TCase *tc = tcase_create("tetris_tc");

  tcase_add_test(tc, init_create);
  tcase_add_test(tc, init_put);
  tcase_add_test(tc, init_remove);
  tcase_add_test(tc, init_fits1);
  tcase_add_test(tc, init_fits2);
  tcase_add_test(tc, userInput_left);
  tcase_add_test(tc, userInput_right);
  tcase_add_test(tc, userInput_down);
  tcase_add_test(tc, userInput_rotate);
  tcase_add_test(tc, init_high_score);
  tcase_add_test(tc, init_score);
  tcase_add_test(tc, userInput_start);
  tcase_add_test(tc, userInput_none);
  tcase_add_test(tc, userInput_pause);
  tcase_add_test(tc, init_graviti);
  tcase_add_test(tc, init_none);
  tcase_add_test(tc, init_term);
  tcase_add_test(tc, userInput_rotate1);

  suite_add_tcase(s, tc);

  return s;
}

int main() {
  Suite *s = tetris_suite();
  SRunner *sr = srunner_create(s);
  int tf = 0;

  srunner_set_fork_status(sr, CK_NOFORK);
  srunner_run_all(sr, CK_VERBOSE);
  tf = srunner_ntests_failed(sr);
  srunner_free(sr);

  return tf > 0;
}