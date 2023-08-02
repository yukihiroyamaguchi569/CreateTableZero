library(shiny)
library(tableone)

# CreateTableZeroの読み込み
source("CreateTableZero.R")

# TableOneの引数を作成する
CreateTableZero(iris)

# TableOneを作成
tableone <- CreateTableOne(vars = c( "Sepal.Length", "Sepal.Width", "Petal.Length" ),
                           factorVars = c( "Species" ),
                           test =  TRUE ,
                           data =  iris 
)
tableone

# 今度はSpeciesで群分けしてみる
CreateTableZero(iris)

# TableOne作成
tableone2 <- CreateTableOne(vars = c( "Sepal.Length", "Sepal.Width", "Petal.Length", "Species" ),
                            factorVars = c( "Species" ),
                            strata = "Species",
                            test =  TRUE ,
                            data =  iris 
)
tableone2
