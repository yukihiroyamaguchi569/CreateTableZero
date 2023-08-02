# CreateTableZero
CreateTableOneの引数を作成するShiny Appです

RのTableOne package(https://cran.r-project.org/web/packages/tableone/index.html) はとても便利なpackageですが、CreateTableOne()を使用する際に、引数を指定するのがやや面倒です。

そこで、データフレームを指定したら変数を列挙してくれて、ポチポチクリックして引数を作れるShiny appを作ってみました。

## 準備
CreateTableZero.Rをワーキングディレクトリに置いてください
（パスの指定ができれば、必ずしもワーキングディレクトリではなくても良いです）

使用するスクリプトからSource("CreateTableZero.R")を実行すると、上記のファイルが読み込まれ、CreateTableZeroが使えるようになります

## irisを使用してTableOneを作成する
irisのデータを使って、TableOneを作ってみましょう [Demo_CreateTableZero](Demo_CreateTableZero.R)

CreateTableZero(iris)　を実行するとShinyが立ち上がります。

<table><tr><td>
  <img src= image/zero1.png width = 70%>
</td></tr></table>


左側のカラムの必要な変数をポチポチクリックすると、右上に引数が作成されていきます。

「クリップボードにコピー」ボタンを押すとコードがコピーされます。

<table><tr><td>
  <img src= image/zero2.png width = 70%>
</td></tr></table>

Shiny appを閉じて、コードに戻り、ペーストするとCreateTableOneが出来上がります

Shinyを閉じないとコードが実行できないので、ご注意ください。

## 課題
まだ、とりあえず動く、という状態です。

今後、引数の種類を増やしたり、エラーチェックを追加していく予定です
