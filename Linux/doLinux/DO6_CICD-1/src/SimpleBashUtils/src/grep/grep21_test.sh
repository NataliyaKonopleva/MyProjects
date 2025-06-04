#!/bin/bash

mkdir -p test_directory
cp ./s21_grep test_directory/
cp ./text.txt test_directory/
cp ./txt.txt test_directory/
cd test_directory/


echo "Test number: 1"
    files_list="text.txt txt.txt"
    ./s21_grep -ni "baN" $files_list > s21_grep_result
    grep -ni "baN" $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 2"
    files_list="text.txt txt.txt"
    ./s21_grep -ci "ba" $files_list > s21_grep_result
    grep -ci "ba" $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 3"
    files_list="text.txt is_not.txt"
    ./s21_grep -vn "ba" $files_list > s21_grep_result
    grep -vn "ba" $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi
echo "Test number: 4"
    files_list="text.txt is_not.txt"
    ./s21_grep -sn "berr" $files_list > s21_grep_result
    grep -sn "berr" $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi
echo "Test number: 5"
    files_list="text.txt"
    ./s21_grep -v -f patterns.txt $files_list > s21_grep_result
    grep -v -f patterns.txt $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 6"
    files_list="text.txt txt.txt"
    ./s21_grep -h "berr" $files_list > s21_grep_result
    grep -h "berr" $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi
echo "Test number: 7"
    files_list="text.txt txt.txt"
    ./s21_grep -e berr $files_list > s21_grep_result
    grep -e berr $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 8"
    files_list="text.txt txt.txt"
    ./s21_grep -e berr apple $files_list > s21_grep_result
    grep -e berr apple $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi 
echo "Test number: 9"
    files_list="text.txt txt.txt"
    ./s21_grep -e berr -e apple $files_list > s21_grep_result
    grep -e berr -e apple $files_list > grep_result
    echo -e "$(diff -s grep_result s21_grep_result)\n"
    if [[ $(diff -q grep_result s21_grep_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi   
cd ..
rm -rf ./test_directory
