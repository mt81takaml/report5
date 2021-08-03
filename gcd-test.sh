#!/bin/bash  

ans="/tmp/$$-ans"
result="/tmp/$$-result"

#正常動作、異常動作の確認で想定しない挙動をしたときに、エラー処理処理とtmpファイルの後処理をする関数。
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

#1-2 大きい自然数を入力して正常に動作するかチェック
echo "10000と1500の最大公約数は500" > ${ans}
./gcd.sh 10000 1500 > ${result}
diff ${ans} ${result} && SUCCESS "test 1-2 OK" || ERROR_EXIT "error in 1-2"


#異常動作の確認
#2-1(A) 入力を一つだけにしたときにエラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 ARGMENTS" > ${ans}
./gcd.sh 20 > ${result}  && ERROR_EXIT "error before diff in 2-1" 
diff ${ans} ${result} && SUCCESS "test 2-1(A) OK" || ERROR_EXIT "error in 2-1(A)" 

#2-1(B) 入力が10つあった場合に、エラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 ARGMENTS" > ${ans}
./gcd.sh a b c d e f g h i j > ${result}  && ERROR_EXIT "error before diff in 2-1"
diff ${ans} ${result} && SUCCESS "test 2-1(B) OK" || ERROR_EXIT  "error in 2-1(B)" 


#2-2 文字を入力してエラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 FIGURES" > ${ans}
./gcd.sh 最大 公約数 > ${result}  && ERROR_EXIT "error before diff in 2-2" 
diff ${ans} ${result} && SUCCESS "test 2-2 OK" || ERROR_EXIT "error in 2-2" 

#2-3 因数の数字の桁が21桁以上になった場合にエラーが正しく出るかチェック
 echo "ERROR: PLZ INPUT 2 FIGURES" > ${ans}
./gcd.sh 22222222222222222222 1234 > ${result}  && ERROR_EXIT "error before diff in 2-3"
diff ${ans} ${result} && SUCCESS "test 2-3 OK" || ERROR_EXIT "error in 2-3"

#2-4 自然数以外を入力して、エラーが正しく出るかチェック
echo "ERROR: PLZ INPUT NATURAL NUMBER" > ${ans}
./gcd.sh 1 -1 > ${result}  && ERROR_EXIT "error before diff in 2-4" 
diff ${ans} ${result} && SUCCESS "test 2-4 OK" ||  ERROR_EXIT "error in 2-4"
