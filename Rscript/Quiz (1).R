##### 可以挑出週週考的題目
Quiz <- function(TestType = c("W1","W2","W3","W4","W5","W6"),ID){
  seed <- ID
  outputList <- list()
  if(TestType == "W1"){
    source(file = "抽樣調查/Q4_16.R")
    output <- Q4_16(seed = seed)
    # 第一題
    outputList[[length(outputList)+1]] <- output$NO20
    # 第二題
    outputList[[length(outputList)+1]] <- output$NO22
    outputList[[length(outputList)+1]] <- output$NO24
  }
  
  if(TestType == "W2"){
    source(file = "抽樣調查/Q4_16.R")
    output <- Q4_16(seed = seed)
    # 第一題
    outputList[[length(outputList)+1]] <- output$NO21
    # 第二題
    outputList[[length(outputList)+1]] <- output$NO23
    # 第三題
    outputList[[length(outputList)+1]] <- output$NO25
  }
  
  if(TestType == "W3"){
    source(file = "抽樣調查/Q4_14.R")
    output <- Q4_14(seed = seed)
    # 第一題
    outputList[[length(outputList)+1]] <- output$NO56
    # 第二題
    outputList[[length(outputList)+1]] <- output$NO57
    # 第三題
    outputList[[length(outputList)+1]] <- output$NO58
  }
  
  if(TestType == "W4"){
    source(file = "抽樣調查/Q5_35.R")
    output <- Q5_35(seed = seed)
    # 第一題
    outputList[[length(outputList)+1]] <- output$NO98
    # 第二題
    outputList[[length(outputList)+1]] <- output$NO99
    # 第三題
    outputList[[length(outputList)+1]] <- output$NO107
  }
  
  if(TestType == "W5"){
    source(file = "抽樣調查/Q5_10.R")
    output <- Q5_10(seed = seed)
    # 第一題
    outputList[[length(outputList)+1]] <- output$NO88
    # 第二題
    outputList[[length(outputList)+1]] <- output$NO89
    #
    source(file = "抽樣調查/Q5_46.R")
    output <- Q5_46(seed = seed)
    # 第三題
    outputList[[length(outputList)+1]] <- output$NO176
  }
  
  if(TestType == "W6"){
    source(file = "抽樣調查/Q5_2.R")
    output <- Q5_2(seed = seed)
    # 第一題
    outputList[[length(outputList)+1]] <- output$NO85
    #
    source(file = "抽樣調查/Q5_42.R")
    output <- Q5_42(seed = seed)
    # 第二題
    outputList[[length(outputList)+1]] <- output$NO209
    # 第三題
    outputList[[length(outputList)+1]] <- output$NO213
  }
  
  return(outputList)
}

#Quiz(TestType = "W1",ID = 321)
#Quiz(TestType = "W2",ID = 328)
#Quiz(TestType = "W3",ID = 013548)
# Quiz(TestType = "W4",ID = 0680416)
