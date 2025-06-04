CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11

all: clean s21_grep
s21_grep: s21_grep.o common_func.o
	$(CC) $(CFLAGS) s21_grep.o common_func.o -o s21_grep

s21_grep.o: s21_grep.c
	$(CC) $(CFLAGS) -c s21_grep.c

common_func.o: ../common/common_func.c
	$(CC) $(CFLAGS) -c ../common/common_func.c

rebuild:
	clean s21_grep

clean: 
	rm -f *.o

check : 
	clang-format -n *.c
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

