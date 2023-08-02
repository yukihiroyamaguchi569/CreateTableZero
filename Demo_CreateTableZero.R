
# 読み込み --------------------------------------------------------------------

library(shiny)
library(tableone)

# CreateTableZeroの読み込み
source("CreateTableZero.R")


# irisを使用してTableOneを作成する --------------------------------------------------

# TableOneの引数を作成する
CreateTableZero(iris)

## 必要な変数をクリックして「クリップボードにコピー」
## コードに貼り付ける

# TableOneを作成
tableone <- CreateTableOne(vars = c( "Sepal.Length", "Sepal.Width", "Petal.Length" ),
                           factorVars = c( "Species" ),
                           test =  TRUE ,
                           data =  iris 
)
tableone


# Speciesで群分けしてみる ---------------------------------------------------------

CreateTableZero(iris)

# 

# TableOne作成
tableone2 <- CreateTableOne(vars = c( "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width" ),
                               factorVars = c( "Petal.Width" ),
                               strata = "Species",
                               test =  TRUE ,
                               data =  iris 
)

tableone2
