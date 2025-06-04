# Targets: all, clean, test, s21_decimal.a, gcov_report

# Флаги компилятора и компоновки из pkg-config
CC = gcc 
GCC_FLAGS = -g -Wall -Wextra -Werror -std=c11
ASAN = # -g -fsanitize=address
LDFLAGS = $(shell pkg-config --cflags --libs check)
GCOV_FLAGS = #-fprofile-arcs -ftest-coverage

# Папки
SRC_DIR = .
TEST_DIR = ./test
OBJ_DIR = ./objs
TEST_OBJ_DIR = ./test/objs
BUILD_PATH=./

# Исходные файлы
SOURCES_FUN:= $(shell find $(SRC_DIR) -name "s21_*.c")
SOURCES_TEST := $(shell find $(TEST_DIR) -name "check_*.c")
TEST=main.c

# Объектные файлы
OBJECTS_FUN:= $(addprefix $(OBJ_DIR)/, $(notdir $(SOURCES_FUN:.c=.o)))
OBJECTS_TEST:= $(addprefix $(TEST_OBJ_DIR)/, $(notdir $(SOURCES_TEST:.c=.o)))

# Результаты
EXE=test.out
PROGRAM=a.out

all: s21_decimal.a test gcov_report

# Цель: компоновка библиотеки функций
s21_decimal.a: $(OBJECTS_FUN)
	ar rcs s21_decimal.a $(OBJECTS_FUN)
	ranlib s21_decimal.a

# Цель: компоновка программы
test: $(OBJECTS_TEST) s21_decimal.a main.o
	$(CC) $(ASAN) $(OBJECTS_TEST) $(OBJECTS_FUN) main.o $(LDFLAGS) 
	$(BUILD_PATH)$(PROGRAM)

# Цель: компоновка программы c gcov_report
gcov_report: $(TEST) s21_decimal.a 
	$(CC) $(GCC_FLAGS) --coverage $(TEST) $(SOURCES_TEST) $(SOURCES_FUN) s21_decimal.a -L. s21_decimal.a $(LDFLAGS) -o $(BUILD_PATH)$(EXE) 
	$(BUILD_PATH)$(EXE)
	lcov -t "Report" -c -d $(BUILD_PATH) --output-file $(BUILD_PATH)coverage.info
	genhtml $(BUILD_PATH)coverage.info --output-directory $(BUILD_PATH)report/
	open $(BUILD_PATH)report/index.html

main.o: $(TEST)
	$(CC) -c $(GCC_FLAGS) -o $@ $<

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(GCC_FLAGS) -c $< -o $@

$(TEST_OBJ_DIR)/%.o: $(TEST_DIR)/%.c | $(TEST_OBJ_DIR)
	$(CC) $(GCC_FLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(TEST_OBJ_DIR):
	mkdir -p $(TEST_OBJ_DIR)

# Цель: очистка
clean:
	rm -rf *.a *.out *.info
	rm -rf $(OBJ_DIR)/*.o
	rm -rf $(TEST_OBJ_DIR)/*.o
	rm -rf $(OBJ_DIR)
	rm -rf $(TEST_OBJ_DIR)
	rm -rf *.o
	rm -rf *.gcno *.gcov *.gcda
	rm -rf report/

# Цель: проверка стиля
check:
	clang-format -i *.c *.h */*.c 
	cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h

