#!/bin/bash

n="$1"
m="$2" 

#2-1 引数が2つ入力されていないときにエラー文を出す。
if [ "$#" -ne "2" ] ;
then echo "ERROR: PLZ INPUT 2 ARGMENTS"
 exit 1
fi

#2-2　文字を入力した時にエラー文を出す。
if ! [ "$n" -eq "$n" -a  "$m" -eq "$m" ] 2>/dev/null ;
then echo "ERROR: PLZ INPUT 2 FIGURES"
 exit 1
fi

#2-3 自然数以外の数字を入力したときにエラー文を出す。
if ! [ "$n" -ge  "1" -a "$m" -ge  "1" ] 2>/dev/null ;
then echo "ERROR: PLZ INPUT NATURAL NUMBER"
 exit 1
fi

#<最大公約数を求める計算式>
while [ ! "$m"  -eq "0" ];
     do
       r=`expr $n % $m`
       n=$m
       m=$r
    done
     echo "$1と$2の最大公約数は$n"
    exit 0
