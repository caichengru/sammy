library(readxl)
library(tidyverse)
df <- read_excel("data/印尼泰国菲律宾数据3.xlsx", sheet = 2) %>% as.data.frame()

df_out <- read_excel("data/印尼泰国菲律宾数据3.xlsx", sheet = 5)%>% as.data.frame()

# Indonesia
df <- read_excel("data/印尼泰国菲律宾数据3.xlsx", sheet = 2) %>% as.data.frame()
Indonesia_storm <- df %>% group_by(Year...6) %>% summarise(sum(`Total Damages, Adjusted ('000 US$)...8`)) %>% as.data.frame()
Indonesia_flood <- df %>% group_by(Year...1) %>% summarise(sum(`Total Damages, Adjusted ('000 US$)...3`)) %>% as.data.frame()


# The Phi
df <- read_excel("data/印尼泰国菲律宾数据3.xlsx", sheet = 4) %>% as.data.frame()

sheet_4 <- df %>% group_by(`Disaster Type...2`, Year...1) %>% summarise(sum(`Total Damages, Adjusted ('000 US$)...3`)) %>% as.data.frame()
ThePhi_storm <- sheet_4[sheet_4$`Disaster Type...2` == "Storm",] %>% as.data.frame()
ThePhi_flood <- sheet_4[sheet_4$`Disaster Type...2` == "Flood",] %>% as.data.frame()

# Thai
df <- read_excel("data/印尼泰国菲律宾数据3.xlsx", sheet = 3) %>% as.data.frame()
sheet_3 <- df %>% group_by(`Disaster Type...2`, Year...1) %>% summarise(sum(`Total Damages, Adjusted ('000 US$)...3`)) %>% as.data.frame()
Thai_storm <- sheet_3[sheet_3$`Disaster Type...2` == "Storm",] %>% as.data.frame()
Thai_flood <- sheet_3[sheet_3$`Disaster Type...2` == "Flood",] %>% as.data.frame()




input <- Indonesia_storm
for(i in 2:NROW(df_out)){
  n <- which(input[, 1] == df_out[i, 1])
  if(length(n) == 0){
    next
  }
  df_out[i, 2] <- input[n, 2]
}

input <- Indonesia_flood
for(i in 2:NROW(df_out)){
  n <- which(input[, 1] == df_out[i, 1])
  if(length(n) == 0){
    next
  }
  df_out[i, 3] <- input[n, 2]
}

input <- ThePhi_storm
for(i in 2:NROW(df_out)){
  n <- which(input[, 2] == df_out[i, 1])
  if(length(n) == 0){
    next
  }
  df_out[i, 4] <- input[n, 3]
}

input <- ThePhi_flood
for(i in 2:NROW(df_out)){
  n <- which(input[, 2] == df_out[i, 1])
  if(length(n) == 0){
    next
  }
  df_out[i, 5] <- input[n, 3]
}

input <-Thai_storm
for(i in 2:NROW(df_out)){
  n <- which(input[, 2] == df_out[i, 1])
  if(length(n) == 0){
    next
  }
  df_out[i, 6] <- input[n, 3]
}

input <-Thai_flood
for(i in 2:NROW(df_out)){
  n <- which(input[, 2] == df_out[i, 1])
  if(length(n) == 0){
    next
  }
  df_out[i, 7] <- input[n, 3]
}

openxlsx::write.xlsx(df_out, "sammy.xlsx")
