#Question 5
require(data.table)

#GDP Data--download CSV, put into object gdp_data and subset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" 
f <- file.path(getwd(), "GDP.csv")
download.file(url, f, method = "curl")
gdp_data <- read.csv(f, skip = 4, nrows= 215, header = TRUE, stringsAsFactors=FALSE)
gdp_data <- subset(gdp_data, select = -c(3, 6:10))

#Change column names
colnames(gdp_data) <- c("CountryCode", "GDP_Rank", "Full_Name","GDP")

#Education Data--download CSV and put into object ed_stats
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
f <- file.path(getwd(), "edstats.csv")
download.file(url, f, method = "curl")
ed_stats <- read.csv(f, header = TRUE, stringsAsFactors=FALSE)

##Merge DataFrames
merged <- merge(gdp_data, ed_stats, all = TRUE, by = c("CountryCode"))

#Order according to GDP Ranking
merged <- arrange(merged, GDP_Rank)

#Split into 5 quantiles according to GDP Ranking
breaks <-quantile(merged$GDP_Rank, probs = seq(0, 1, 0.2), na.rm = TRUE)

#Arrange Merged according to quantile grouping
merged$quantileGDP <- cut(merged$GDP_Rank, breaks=breaks, na.rm=TRUE)

#Create table showing how many "Lower middle income group" countries fall into each quantile
merged <- data.table(merged)
merged[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
                                                         