#!/bin/bash  

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-err"

#正常動作の確認
#1-1 自然数を2つ入力してエラーが出ないかチェック
echo "100と250の最大公約数は50" > ${ans} 
./gcd.sh 100 250 > ${result} 
diff ${ans} ${result} && echo "test 1-1 OK" || echo "error in 1-1" >> ${err}

#1-2 自然数でないものを入力して、エラーが出るかチェック。
./gcd.sh -1 100 && echo "test 1-2 OK" || echo "error in1-2" >> ${err}
#echo "" > ${ans}
#./gcd.sh > ${result} 
#diff ${ans} ${result} && echo "test 1-2 OK" || echo "error in 1-2" >> ${err}

#1-3 文字を入力してエラーが出るかチェック。
./gcd.sh 公約数 && echo "test 1-3 OK" || echo "error in1-3" >> ${err}
#echo "" > ${ans}
#./gcd.sh 公約数 > ${result}
#diff ${ans} ${result} && echo "test 1-3 OK" || echo "error in 1-3" >> ${err}


#異常動作の確認
#2-1 入力を一つだけにしたときにエラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 ARGMENTS" > ${ans}
./gcd.sh 20 > ${result}  && echo "error before diff in 2-1" >> ${err}
diff ${ans} ${result} && echo "test 2-1 OK" || echo "error in2-1" >> ${err}

#2-2 文字を入力してエラーが正しく出るかチェック
echo "ERROR: PLZ INPUT 2 FIGURES" > ${ans}
./gcd.sh 最大 公約数 > ${result}  && echo "error before diff in 2-2" >> ${err}
diff ${ans} ${result} && echo "test 2-2 OK" || echo "error in2-2" >> ${err}

#2-3 自然数以外を入力して、エラーが正しく出るかチェック
echo "ERROR: PLZ INPUT NATURAL NUMBER" > ${ans}
./gcd.sh 1 -1 > ${result}  && echo "error before diff in 2-3" >> ${err}
diff ${ans} ${result} && echo "test 2-3 OK" ||  echo "error in2-3" >> ${err}

#動作確認でエラーが起きた場合、そのエラー個所を通知。最後に後処理して終了。
if [ -f ${err} ]; then 
cat ${err} 
rm /tmp/$$-* 
exit 1
fi
