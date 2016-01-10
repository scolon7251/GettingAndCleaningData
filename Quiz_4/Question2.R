##Question 2

url2= "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2, destfile="/Users/samuelcolon/Coursera/Getting_and_Cleaning_Data/Quiz_4/gdp.csv", method = "curl")
gdp_data <-read.csv("gdp.csv", stringsAsFactors=FALSE)
gdp_data <- subset(gdp_data, select = -c(3, 6:10))
gdp_data <- gdp_data[-c(195:325),]
colnames(gdp_data) <- c("CountryCode", "GDP_Rank", "Full_Name","GDP")

##Removes Commas
gdp <- as.numeric(gsub(",", "", gdp_data$GDP))

##Calculate Mean of Column
mean(gdp, na.rm = TRUE)
