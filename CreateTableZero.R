
CreateTableZero <- function(dataframe) {
     
     # データフレームの名前を取得
     dataframe_name <- deparse(substitute(dataframe))

     # UI側のコード
     ui <- fluidPage(
          titlePanel("CreateTableZero"),
          
          sidebarLayout(
               sidebarPanel(
                    checkboxGroupInput("vars", "変数を選択:", choices = names(dataframe)), # チェックボックスで変数を選択
                    checkboxGroupInput("factorVars", "カテゴリ変数を選択:", choices = names(dataframe)), # チェックボックスでカテゴリ変数を選択
                    selectInput("strata", "Strata変数を選択:", c("層別化しない", names(dataframe))), # 「層別化しない」を追加
                    radioButtons("test", "検定を行う:", choices = c("TRUE", "FALSE")), # Testの選択
               ),
               
               mainPanel(
                    verbatimTextOutput("arguments"), # 引数の表示
                    actionButton("copyBtn", "クリップボードにコピー"), # コピーするボタン
                    tags$script(HTML("
                       $('#copyBtn').click(function() {
                         var text = $('#arguments').text(); // 引数のテキストを取得
                         var el = document.createElement('textarea'); // テキストエリアを作成
                         el.value = text; // テキストを設定
                         document.body.appendChild(el); // テキストエリアを追加
                         el.select(); // テキストを選択
                         document.execCommand('copy'); // クリップボードにコピー
                         document.body.removeChild(el); // テキストエリアを削除
                    });
                  "))
               )
          )
     )
     
     
     # サーバー側のコード
     server <- function(input, output) {
               output$arguments <- renderPrint({
                    # 変数の選択
                    vars <- input$vars
                    if (is.null(vars) || length(vars) == 0) return("変数が選択されていません。")
                    
                    # カテゴリ変数の選択
                    factorVars <- input$factorVars
                    if (is.null(factorVars)) factorVarss <- NULL
                    
                    # Strata変数の選択
                    strata <- input$strata
                    if (strata == "層別化しない") strata <- NULL
                    
                    # Testの選択
                    test <- as.logical(input$test)
                    
                    # Dataの選択
                    data <- dataframe
                    
                    # 引数の表示st
                    cat("<- CreateTableOne(")
                    cat("vars = c(", paste0("\"", paste(vars, collapse = "\", \""), "\""), "),\n")
                    cat("factorVars = c(", paste0("\"", paste(factorVars, collapse = "\", \""), "\""), "),\n")
                    if (!is.null(strata)) cat(paste0("strata = \"", strata, "\",\n")) # strata変数が選ばれている場合のみ表示
                    cat("test = ", test, ",\n")
                    cat("data = ", dataframe_name, "\n")
                    cat("                  )")
                    })
     }
     
     
     # アプリケーションの実行
     shinyApp(ui = ui, server = server)

}

