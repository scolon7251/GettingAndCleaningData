#Question 4

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

#Average GDP Ranking for High income:OECD
merged <- arrange(merged, Income.Group)
high_OECD <- subset(merged, Income.Group == "High income: OECD")
mean(high_OECD[,2])

##Average GDP Ranking for High income: nonOECD
high_nonOECD <- subset(merged, Income.Group == "High income: nonOECD")
mean(high_nonOECD[,2], na.rm=TRUE)


