library(readr)
data1112_no_html <- read_csv("E:/UMD/Class Notes/INST737/Final Project/data1112_no_html.csv")

View(data1112_no_html)

data1112_no_html$code <- 0

data1112_no_html$code[grepl("<code>",data1112_no_html$body)
                      |grepl("<!-- language:",data1112_no_html$body) 
                      |grepl("<!--language:",data1112_no_html$body) == "TRUE"] <- 1

write.csv(data1112_no_html, file="data1127_no_html_code in answer.csv", row.names= FALSE)