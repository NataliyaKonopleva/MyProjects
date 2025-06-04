GCC := g++ -std=c++20 -Wall -Werror -Wextra 

all: clean test

s21_matrix_oop.a: s21_matrix_oop.cpp
	$(GCC) s21_matrix_oop.cpp -c 
	ar rcs s21_matrix_oop.a s21_matrix_oop.o
	$(MAKE) clean_o 

test: s21_matrix_oop.a clean_test
#g++ -std=c++20 -Wall -Werror -Wextra ./test/test_m.cpp -o ./test/tests -l:s21_matrix_oop.a -L/lib/x86_64-linux-gnu -Wl,-rpath=/lib/x86_64-linux-gnu -lgtest -lpthread
	$(GCC) -o ./test/tests ./test/test_m.cpp -L. -l:s21_matrix_oop.a -lgtest -lpthread
	./test/tests

gcov_report: ./test/test_m.cpp s21_matrix_oop.a 
	$(GCC) --coverage ./test/test_m.cpp s21_matrix_oop.cpp s21_matrix_oop.a -L. s21_matrix_oop.a -lgtest -lpthread -o ./test/tests_cov 
	./test/tests_cov
	lcov -t "Report" -c -d ./ --output-file ./coverage.info
	genhtml ./coverage.info --output-directory ./report/
	open ./report/index.html

valgrind: s21_matrix_oop.a
	$(GCC) -o ./test/tests ./test/test_m.cpp -L. -l:s21_matrix_oop.a -lgtest -lpthread
	valgrind --tool=memcheck --leak-check=yes ./test/tests

clean: clean_o clean_test
	rm -rf  *.a
	rm -Rf ./report/
clean_o:
	rm -rf *.o
clean_test:
	rm -Rf ./test/tests
	rm -Rf ./test/tests_cov
	rm -Rf ./test/*.gcda
	rm -Rf ./test/*.gcno
	rm -rf *.info
clang_format:
	clang-format -i ./*.cpp ./*.hpp ./test/*.cpp
