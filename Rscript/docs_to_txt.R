library(officer)
file <- list.files("docs")
file <- gsub(".docx", "", file)

for(i in 1:length(file)){
  text <- read_docx(paste0("docs/", file[i], ".docx"))
  out <- docx_summary(text)$text
  writeLines(out, paste0("txt/", file[i], ".txt"))
  
}
