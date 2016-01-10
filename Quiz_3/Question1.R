##Question 1

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" 
f <- file.path(getwd(), "ss06hid.csv")
download.file(url, f, method = "curl")
acs_data <- read.csv((f))

agricultureLogical<-which(acs_data$ACR==3 & acs_data$AGS==6)
agricultureLogical[1:3]