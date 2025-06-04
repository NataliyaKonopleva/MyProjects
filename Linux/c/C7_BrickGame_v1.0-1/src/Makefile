# Targets: all, install, uninstall, clean, dvi, dist, test, gcov_report.

CC := gcc
CFLAGS := -Wall -Wextra -Werror -std=c11 -Wpedantic
GCOV_FLAGS := -fprofile-arcs -ftest-coverage

OS := $(shell uname -s)

ifeq ($(OS), Darwin)
	LIB_FLAGS := $(shell pkg-config --static --cflags --libs check ncurses)
else
	LIB_FLAGS := $(shell pkg-config --static --cflags --libs check ncursesw)
endif

PROJECT := tetris_cli
GUI := gui/cli/t_frontend.c
BUILD_DIR := build
TESTS_DIR := tests
REPORT_DIR := report
DIST_DIR := dist
DVI_DIR := dvi
TEST = $(TESTS_DIR)/test.c

all : install


install : tetris.a | build_dir
	echo 0 > build/high_score.txt
	$(CC) $(CFLAGS) $(GUI) $(BUILD_DIR)/tetris.a -o $(BUILD_DIR)/$(PROJECT) $(LIB_FLAGS)

install-sanitized : tetris.a
	echo 0 > build/high_score.txt
	$(CC) $(CFLAGS) $(GUI) $(BUILD_DIR)/tetris.a -o $(BUILD_DIR)/$(PROJECT) $(LIB_FLAGS) -fsanitize=address

tetris.a : build_dir
	$(CC) $(CFLAGS) -c brick_game/tetris/t_backend.c -o $(BUILD_DIR)/tetris.o
	ar rc $(BUILD_DIR)/tetris.a $(BUILD_DIR)/tetris.o
	ranlib $(BUILD_DIR)/tetris.a
	rm -rf $(BUILD_DIR)/tetris.o

uninstall :
	rm -rf $(BUILD_DIR)

rebuild : uninstall install


clean :
	rm -rf $(BUILD_DIR) $(DIST_DIR) $(REPORT_DIR) $(TESTS_DIR)/tetris_test $(DVI_DIR)/documentation.dvi $(DVI_DIR)/documentation.aux $(DVI_DIR)/documentation.log

dvi : dvi_dir
	latex -output-directory=dvi dvi/documentation.tex
# xelatex -output-directory=dvi dvi/documentation.tex

dist : dist_dir
	tar cf $(DIST_DIR)/tetris-1.0.tar $(BUILD_DIR) $(DVI_DIR)

test : tetris.a
	echo 0 > build/high_score.txt
	$(CC) $(CFLAGS) $(TESTS_DIR)/test.c $(BUILD_DIR)/tetris.a -o $(TESTS_DIR)/tetris_test $(LIB_FLAGS)
	./$(TESTS_DIR)/tetris_test

gcov_report : | build_dir
	$(CC) $(CFLAGS) $(GCOV_FLAGS) -c brick_game/tetris/t_backend.c -o $(BUILD_DIR)/tetris.o $(LIB_FLAGS)
	ar rc $(BUILD_DIR)/tetris.a $(BUILD_DIR)/tetris.o
	ranlib $(BUILD_DIR)/tetris.a
	rm -rf $(BUILD_DIR)/tetris.o
	$(CC) $(CFLAGS) $(TESTS_DIR)/test.c $(BUILD_DIR)/tetris.a -o $(TESTS_DIR)/tetris_test $(LIB_FLAGS) -lgcov
	./$(TESTS_DIR)/tetris_test
	rm -rf $(REPORT_DIR)
	mkdir $(REPORT_DIR)
	gcovr --html-details $(REPORT_DIR)/coverage.html
	rm -rf *.gcda *.gcno *.o
	open $(REPORT_DIR)/coverage.html

format :
	clang-format -i $(TESTS_DIR)/*.c $(TESTS_DIR)/*.h brick_game/tetris/*.c brick_game/tetris/*.h gui/cli/*.c gui/cli/*.h

check :
	clang-format -n $(TESTS_DIR)/*.c $(TESTS_DIR)/*.h brick_game/tetris/*.c brick_game/tetris/*.h gui/cli/*.c gui/cli/*.h
	cppcheck --enable=all --suppress=missingIncludeSystem $(TESTS_DIR)/*.c $(TESTS_DIR)/*.h brick_game/tetris/*.c brick_game/tetris/*.h gui/cli/*.c gui/cli/*.h

valgrind-test :
	valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all -s --track-origins=yes $(TESTS_DIR)/tetris_test

build_dir :
	mkdir -p $(BUILD_DIR)

dist_dir :
	mkdir -p $(DIST_DIR)

dvi_dir :
	mkdir -p $(DVI_DIR)