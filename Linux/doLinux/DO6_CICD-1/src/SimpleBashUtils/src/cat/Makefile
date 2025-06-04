CC=gcc
CFLAGS=-Wall -Werror -Wextra -std=c11

all: clean s21_cat
s21_cat: s21_cat.o common_func.o
	$(CC) $(CFLAGS) s21_cat.o common_func.o -o s21_cat

s21_cat.o: s21_cat.c
	$(CC) $(CFLAGS) -c s21_cat.c

common_func.o: ../common/common_func.c
	$(CC) $(CFLAGS) -c ../common/common_func.c

rebuild:
	clean s21_cat

clean: 
	rm -f *.o

check : 
	clang-format -n *.c
	cppcheck --enable=all --suppress=missingIncludeSystem *.c
	