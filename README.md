# CreateTableZero
CreateTableOneの引数を作成するShiny Appです

RのTableOne packageはとても便利なpackageですが、CreateTableOne()を使用する際に、引数を指定するのがやや面倒です。
そこで、データフレームを指定したら変数を列挙してくれて、ポチポチクリックで引数を作れるShiny appを作ってみました。

## 準備
CreateTableZero.Rをワーキングディレクトリに置いてください
（パスの指定ができれば、必ずしもワーキングディレクトリではなくても良いです）

使用するスクリプトからSource("CreateTableZero.R")を実行すると、上記のファイルが読み込まれ、CreateTableZeroが使えるようになります

## irisを使用してTableOneを作成する
irisのデータを使って、TableOneを作ってみましょう

CreateTableZero(iris)

