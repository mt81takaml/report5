21746123
高橋正大

<初めに>
今回使ったgithubアカウントは、mt81takamlです。
今回使ったレポジトリはレポートの指定通りreport5です。
最大公約数シェルスクリプトのファイル名はgcd.shです。
動作確認シェルスクリプトのファイル名は、gcd-test.shです。
Travis Ciの設定ファイル名は　.travis.ymlです。

<最大公約数シェルスクリプトについて(gcd.sh)>
・ユークリッドの互除法を用いて作成しました。
・エラー終了は3つのパターン分けてなるようにしています。
まず、引数が2つ以外の入力をされている場合、#2-1のif文の終了ステータスが0になります。
このとき、引数を2つ入力してくださいという意味の「ERROR: PLZ INPUT 2 ARGMENTS」をエラー文として出力し、exit 1で　エラー終了します。
次に、引数に数字ではなく文字を入力した場合、#2-2のif文の終了ステータスが0になります。
このとき、数字を2つ入力してくださいという意味の「ERROR: PLZ INPUT 2 FIGURES」をエラー文として出力し、exit 1でエラー終了します。
最後に、自然数ではなく、マイナスの値や小数点を入れてしまった場合、#2-3のif文の終了ステータスが0になります。
このとき、自然数を入力してくださいという意味の「ERROR: PLZ INPUT NATURAL NUMBER」をエラー文として出力し、exit 1でエラー終了します。


<動作確認シェルスクリプトについて(gcd-test.sh)>
・gcd.shの動作確認を正常動作と異常動作(エラーが出た時の動作)に分けてテストするスクリプトです。
・正常動作は3つにわかれています。
まず1-1では、自然数を2つ入力して正常動作するかをチェックしています。
出てほしい出力をansに、実際の出力をresultに入れて、diffコマンドでそれらの差異を比較します。
差異があれば、正常動作をしていないので、エラーになります。

次に1-2では、自然数でないものを入力して、エラーが正常に出るかどうかをチェックしています。
これはエラーが出るように入力をしています。エラーが出なければ正常に動作をしていないとして、エラーになります。

最後に1-3では、自然数でないものを入力して、エラーが正常に出るかどうかをチェックしています。
これも、エラーが出るように入力をしています。エラーが出なければ正常に動作していないとして、エラーになります。


・異常動作も3つに分かれています。
まず2-1では、引数の入力を一つだけにしたときにエラーが正しく出るかチェックしています。
出るはずのエラー文をansに、実際の出力をresultに入れてdiffコマンドで比較します。
この時、差異があると正しい異常動作をしていないので、エラーになります。

次に2-2では、文字を入力してエラーが正しく出るかをチェックしています。
これも同じくdiffコマンドで差異があれば、正しいエラーが出ていないのでエラーとなります。

最後に2-3では、自然数以外を入力して、エラーが正しく出るかをチェックしています。
これも同じくdiffコマンドで差異があれば、正しいエラーが出ていないのでエラーとなります。

以上の、正常動作と異常動作をすべて終われば、最後のif文でどこで、エラーが起きたかを示し、ファイルの後処理もして終了します。

＜Travis CIの設定ファイルについて(.travis.yml)＞
・設定ファイルは「gcd.shのテスト開始」という文字を出力した後、動作確認シェルスクリプトを実行するという流れになっています。

