##### 得到大考要用的題目
### 注意事項
#  在使用「創意題庫」的時候需要先把題目方向製作完成
#  題目方向需要準確紀錄［母體總數、母體平均、母體比例］
#  以上三個其中之一
#  以對應step1的部分

####### 使用的參數 ####
### ExamCH 要考試的章節
### ID
ExamCH <- 4 # 參數
ID <- 0905590

### 開始抽題目的頭 ####
ExamF <- function(ExamCH,ID){
  ##### 整理創作題庫的大表 ####
  ### 先將創作題目的xlsx疊再一起
  library(rio)
  Path <- file.path(paste0(getwd(),"/data/創作題庫.xlsx"))
  Data <- import_list(Path , rbind=TRUE)
  ### 挑選需要的欄位
  Data <- Data[,c(1:4,10,11)]
  Data <- Data[which(Data$考試分類 == "大考"),]
  Data <- Data[which(Data$章 == ExamCH),]
  times <- 0
  FinalExamOutput <- list()
  while(dim(Data)[1]>5){ # 要抽到什麼時候才要停，還需要再討論一下。
    times <- times+1
    print(times)
    TotalNumber <- c()
    
    while(length(TotalNumber)<1) {
      ###### step1 隨機抽題目方向 ####
      ### 用老師給出的基本要考的三個東西
      get1 <- sample(c("母體平均","母體總數","母體比例"),1)
      ###### step2 選題號 ####
      TotalNumber <- Data$題號[grep(pattern = get1,Data$題目方向)]
      TotalNumber <- names(table(TotalNumber))[table(TotalNumber)>1]
      if(length(TotalNumber) <1 ){next}
      get2 <- sample(TotalNumber,1) 
      
    }# while : length(TotalNumber)<1
    
    ###### step3 得到編號 ####
    get3 <- Data$編號[which(grepl(pattern = get1,Data$題目方向)&grepl(pattern = get2,Data$題號))]
    
    ###### step4 拿到考題跟答案
    RscriptPath <- paste0("抽樣調查/Rscript/","Q",ExamCH,"_",get2,".R")
    source(RscriptPath)
    output <- eval(parse(text = paste0("Q",ExamCH,"_",get2,"(",ID,")")))
    # return
    ExamOutput <- output[grep(paste0(get3,collapse = "|"),names(output))]
    
    ### 得到題目後要把他們從表裡面去除，以免一直重複得到
    Data <- Data[-grep(paste0(get3,collapse = "|"),Data$編號),]
    
    ### 把要輸出的list都疊再一起
    for(i in 1:length(ExamOutput)){
      FinalExamOutput[[length(FinalExamOutput)+1]] <- ExamOutput[[i]]
    }
    
  }# while : dim(Data)>5
  
  # return
  return(FinalExamOutput)
  
}

## 使用範例
FinalExamOutput <- ExamF(ExamCH = 4,ID = 123)



### 這個function要一直重複到沒有抽到題目，或是抽到5個題組為止?????
