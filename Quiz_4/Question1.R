##Question 1

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile="/Users/samuelcolon/Coursera/Getting_and_Cleaning_Data/Quiz_4/idaho.csv", method = "curl")

names(idaho_data)
idaho_data <- read.csv("idaho.csv")
splitNames <- strsplit(names(idaho_data), "wgtp")

#123rd Member of List
splitNames[[123]]
