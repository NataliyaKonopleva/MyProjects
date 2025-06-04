#!/bin/bash

mkdir -p test_directory
cp ./s21_cat test_directory/
cp ./test.txt test_directory/
cp ./test1.txt test_directory/
cd test_directory/


echo "Test number: 1"
    files_list="test1.txt test1.txt"
    ./s21_cat -bnseEtTv $files_list > s21_result
    cat -bnseEtTv $files_list > cat_result
    echo -e "$(diff -s cat_result s21_result)\n"
    if [[ $(diff -q cat_result s21_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 2"
    files_list="test.txt test1.txt"
    ./s21_cat $files_list > s21_result
    cat $files_list > cat_result
    echo -e "$(diff -s cat_result s21_result)\n"
    if [[ $(diff -q cat_result s21_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 3"
    files_list="test.txt not_exist.txt test1.txt"
    ./s21_cat -bnseEtTv $files_list > s21_result
    cat -bnseEtTv $files_list > cat_result
    echo -e "$(diff -s cat_result s21_result)\n"
    if [[ $(diff -q cat_result s21_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 4"
    files_list="empty.txt test.txt"
    ./s21_cat -bnseEtTv $files_list > s21_result
    cat -bnseEtTv $files_list > cat_result
    echo -e "$(diff -s cat_result s21_result)\n"
    if [[ $(diff -q cat_result s21_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

echo "Test number: 5"
    files_list="test1.txt test.txt"
    ./s21_cat --number-nonblank --squeeze-blank $files_list > s21_result
    cat --number-nonblank --squeeze-blank $files_list > cat_result
    echo -e "$(diff -s cat_result s21_result)\n"
    if [[ $(diff -q cat_result s21_result) ]]
    then
        echo "____________________________________________________________"
        echo -e "Test error\n"
        exit 1
    fi

cd ..
rm -rf ./test_directory
