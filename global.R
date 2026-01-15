cat("========== 诊断信息开始 ==========\n")
cat("1. 当前工作目录:", getwd(), "\n")
cat("2. 文件列表:", list.files(), "\n")

# 尝试加载数据
if(file.exists("data.RData")) {
  cat("3. 找到 data.RData，准备加载...\n")
  # 创建一个干净的环境来加载，避免干扰
  data_env <- new.env()
  load_result <- try(load("data.RData", envir = data_env), silent = TRUE)
  if(!inherits(load_result, "try-error")) {
    cat("4. 加载成功！加载的对象有:", ls(envir = data_env), "\n")
    # 检查是否有叫 fit1 的对象
    if("fit1" %in% ls(envir = data_env)) {
      cat("5. ★★★ 找到 'fit1'！其类别为:", class(data_env$fit1)[1], "\n")
      # 将 fit1 显式赋值到全局环境
      fit1 <<- data_env$fit1
      cat("6. 已将 fit1 赋值到全局环境。\n")
    } else {
      cat("5. ××× 警告：在 data.RData 中未找到名为 'fit1' 的对象。\n")
      cat("    请检查 data.RData，内部实际对象是:", ls(envir = data_env), "\n")
    }
  } else {
    cat("4. ××× 加载 data.RData 失败，错误信息:", load_result, "\n")
  }
} else {
  cat("3. ××× 错误：未在当前目录找到 data.RData 文件。\n")
}
cat("========== 诊断信息结束 ==========\n\n")
library(ggplot2)
library(shiny)
library(plotly)
library(stargazer)
library(compare)
library(rms)

#######################################################
#### Before publishing your dynamic nomogram:
####
#### - You may need to edit the following lines if
#### data or model objects are not defined correctly
#### - You could modify ui.R or server.R for
#### making any required changes to your app
#######################################################

load('data.RData')
source('functions.R')
mydata=data
t.dist <- datadist(mydata)
options(datadist = 't.dist')
m.summary <- 'raw'
covariate <- 'slider'
clevel <- 0.95

### Please cite the package if used in publication. Use:
# Jalali A, Alvarez-Iglesias A, Roshan D, Newell J (2019) Visualising statistical models using dynamic nomograms. PLOS ONE 14(11): e0225253. https://doi.org/10.1371/journal.pone.0225253


