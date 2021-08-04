#!/bin/bash  

ans="/tmp/$$-ans"
result="/tmp/$$-result"

#正常動作、異常動作の確認で想定しない挙動をしたときに、エラー処理とtmpファイルの後処理をする関数。
ERROR_EXIT(){
   echo $1
   rm /tmp/$$-*
   exit 1
}

#正常動作、異常動作が正しくできている場合、検証のために作ったtmpファイルの後処理をする関数。
#正しく動作する場合は、続きのテストも行ってほしいのでexitはしない。
SUCCESS(){
   echo $1
   rm /tmp/$$-*
}

#正常動作の確認
#1-1 自然数を2つ入力してエラーが出ないかチェック
echo "100と250の最大公約数は50" > ${ans} 
./gcd.sh 100 250 > ${result} 
diff ${ans} ${result} && SUCCESS "test 1-1 OK" || ERROR_EXIT "error in 1-1" 

#1-2　少し大きい自然数を入力して正常に動作するかチェック
echo "10000と1500の最大公約数は500" > ${ans}
./gcd.sh 10000 1500 > ${result}
diff ${ans} ${result} && SUCCESS "test 1-2 OK" || ERROR_EXIT "error in 1-2"


#異常動作の確認
#2-1では、引数の数によって起きるエラーを想定する。
#2-1(A) 入力を一つだけにしたときにエラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 ARGMENTS" > ${ans}
./gcd.sh 20 > ${result}  && ERROR_EXIT "error before diff in 2-1(A)" 
diff ${ans} ${result} && SUCCESS "test 2-1(A) OK" || ERROR_EXIT "error in 2-1(A)" 

#2-1(B) 入力が10つあった場合に、エラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 ARGMENTS" > ${ans}
./gcd.sh a b c d e f g h i j > ${result}  && ERROR_EXIT "error before diff in 2-1(B)"
diff ${ans} ${result} && SUCCESS "test 2-1(B) OK" || ERROR_EXIT "error in 2-1(B)" 


#2-2 文字の入力、引数の桁の限界、小数の入力によって起きるエラーを想定する。
#2-2(A) 文字が入力されたときにエラーが正しく出るかチェック。
echo "ERROR: PLZ INPUT TWO NATURAL NUMBERS SMALLER THAN 21 DIGITS" > ${ans}
./gcd.sh 最大 公約数 > ${result}  && ERROR_EXIT "error before diff in 2-2(A)" 
diff ${ans} ${result} && SUCCESS "test 2-2(A) OK" || ERROR_EXIT "error in 2-2(A)" 

#2-2(B) 入力した引数の桁によっておきるエラーを想定する。
#引数の数字の桁が21桁以上になった場合にエラーが正しく出るかチェック
echo "ERROR: PLZ INPUT TWO NATURAL NUMBERS SMALLER THAN 21 DIGITS" > ${ans}
 ./gcd.sh 22222222222222222222 1234 > ${result}  && ERROR_EXIT "error before diff in 2-2(B)"
diff ${ans} ${result} && SUCCESS "test 2-2(B) OK" || ERROR_EXIT "error in 2-2(B)"

#2-2(C) 小数を入力して、エラーが正しく出るかチェック
echo "ERROR: PLZ INPUT TWO NATURAL NUMBERS SMALLER THAN 21 DIGITS" > ${ans}
./gcd.sh 1.5 -1 > ${result}  && ERROR_EXIT "error before diff in 2-2(C)"
diff ${ans} ${result} && SUCCESS "test 2-2(C) OK" || ERROR_EXIT "error in 2-2(C)"

#2-3 自然数以外の数字を入れたことによるエラーを想定する。
#マイナスの値を入力して、エラーが正しく出るかチェック
echo "ERROR: PLZ INPUT NATURAL NUMBER" > ${ans}
./gcd.sh 1 -1 > ${result}  && ERROR_EXIT "error before diff in 2-3" 
diff ${ans} ${result} && SUCCESS "test 2-3 OK" || ERROR_EXIT "error in 2-3 OK"
