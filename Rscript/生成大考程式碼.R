library(readxl)

# 學生人數 
n_student <- 30

# 題目數
n_quit <- 30

# 題庫
testbank <- read_excel("data/RtestBank.xlsx")
testbank <- testbank[which(testbank$class == "每學期第一個月"), ]

# output

for(count in 1:1){
  
  print(count)
  Output <- c()
  
  Output <- c(Output, "**統計學 期中考**")
  Output <- c(Output, "  ")
  Output <- c(Output, "**班級   ____________    座號   _________    姓名___________________________________**")
  Output <- c(Output, "  ")
  
  sample_list <- sample(1:NROW(testbank), n_quit)
  for(i in 1:n_quit){
    text_out <- paste(i, ". ", testbank$question[sample_list[i]], sep = "")
    Output <- c(Output, text_out)
    Output <- c(Output, "  ")
    
  }
  Output <- c(Output, "  ")
  Output <- c(Output, "---")
}

writeLines(Output, "題目.txt")
# write.table(Output,file = "題目.txt",row.names = F,col.names = F, sep = "\n")
