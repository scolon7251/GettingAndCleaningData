##Question 3

#############################################################################################
# Load the Gross Domestic Product data for the 190 ranked countries in this data set:     
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Load the educational data from this data set:   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
#
# Match the data based on the country shortcode. 
# How many of the IDs match? 
# Sort the data frame in descending order by GDP rank. 
# What is the 13th country in the resulting data frame? 
#
# Original data sources: 
#   http://data.worldbank.org/data-catalog/GDP-ranking-table 
#   http://data.worldbank.org/data-catalog/ed-stats
#############################################################################################

#GDP Data--download CSV and put into object gdp_data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" 
f <- file.path(getwd(), "GDP.csv")
download.file(url, f, method = "curl")
gdp_data <- read.csv(f, skip = 4, nrows= 215, header = TRUE, stringsAsFactors=FALSE)
gdp_data <- subset(gdp_data, select = -c(3, 6:10))
colnames(gdp_data) <- c("CountryCode", "GDP_Rank", "Full_Name","GDP")


#Education Data--download CSV and put into object ed_stats
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
f <- file.path(getwd(), "edstats.csv")
download.file(url, f, method = "curl")
ed_stats <- read.csv(f, header = TRUE, stringsAsFactors=FALSE)

##Merge DataFrames
merged <- merge(gdp_data, ed_stats, all = TRUE, by = c("CountryCode"))

#Find how many ID's match
sum(!is.na(unique(gdp_data$GDP_Rank)))


#Sort by GDP_Rank in Descending Order, find 13th Country in resulting data frame
require(plyr)
merged <- arrange(merged, desc(GDP_Rank))
answer <- merged [13, 3]

