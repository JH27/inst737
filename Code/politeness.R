#install packages html and politeness packages
install.packages(tm.plugin.webmining)
install.packages("politeness")
library(politeness)
library(tm.plugin.webmining)

# Read in the data
data1112 <- read.csv("C:/Users/JP/Documents/INST737/Project/data1112.csv")

#Remove all unecessary columns. Only keep body and id columns
data1112 <- data1112[,c("PostId","body")]

#Strip body column off of html
data1112$body_no_html <- apply(data1112, 1, function(x) {extractHTMLStrip(x['body'])})

#Get rid of all '\n' chars in the new column
data1112$body_no_html <- gsub('\\n', ' ', data1112$body_no_html)

#Remove original body column with html
data1112$body <- NULL

#Apply politeness package to new text column
df_politeness <- politeness(data1112$body_no_html, binary=TRUE)

#Combine politeness dataset with original dataset
data1112 <- cbind(data1112, df_politeness)

#Remove text column. Only keep id and politeness features
data1112$body_no_html <- NULL

#Write result to csv file
write.csv(data1112, file = "polite_no_body.csv", row.names = FALSE)
