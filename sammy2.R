library(readxl)
library(magrittr)

df <- read_excel("data/印尼泰国菲律宾数据4_1.xlsx", sheet = 5) %>% as.data.frame()

Indonesia <- df[-1, 4] %>% .[-length(.)] %>% as.numeric()

Philippines <- df[-1, 8] %>% .[-length(.)] %>% as.numeric()

Thailand <- df[-1, 12] %>% .[-length(.)] %>% as.numeric()

cor(Indonesia, Philippines)

dat <- data.frame(Indonesia = Indonesia,
                  Philippines = Philippines,
                  Thailand = Thailand)

cor_mat <- Hmisc::rcorr(as.matrix(dat))
out <- data.frame(cor_mat$r)
openxlsx::write.xlsx(out, "output/sammy2.xlsx")
