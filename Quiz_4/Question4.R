##Question 4

##Load Data
gdp_data <- read.csv("gdp.csv", stringsAsFactors = FALSE, nrows = 195)

##Remove unnecessary columns
gdp_data <- subset(gdp_data, select = -c(3, 6:10))
country_data <-read.csv("country.csv", stringsAsFactors=FALSE)

##Name columns
colnames(gdp_data) <- c("CountryCode", "GDP_Rank", "Full_Name","GDP")

merged_data <- merge(gdp_data, country_data, by= "CountryCode")

#Find Notes where Fiscal year end and June are written
FY <- grepl("Fiscal year end", merged_data$Special.Notes)
June <- grepl("June", merged_data$Special.Notes)

##How many where Fiscal Year Ends in June?
sum(June == "TRUE")
              