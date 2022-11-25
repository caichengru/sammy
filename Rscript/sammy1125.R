library(readxl)
library(magrittr)
df <- read_excel("data/东盟十国、印度、中国自然灾害数据.xlsx") %>% as.data.frame()
names(df) <- df[5,]
df <- df[-c(1:5), ]

target <- unique(df$Country)[c(3, 5, 6, 7, 9)]

disaster <- unique(df$`Disaster Type`)[c(5, 4)]

year <- 1980:2021

out <- data.frame(row.names = 1:42)
out$year <- year


for(country in target){
  for(dis in disaster){
    n <- c()
    for(i in 1:length(year)){
      p <- which(df$Country == country & df$Year == year[i] & df$`Disaster Type` == dis) %>% length()
      n <- c(n, p)  
    }
    out[[paste0(country, "_", dis)]] <- n
  }
  
}
