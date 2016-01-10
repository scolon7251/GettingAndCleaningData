##Question 2

#############################################################################################
# Using the jpeg package read in the following picture of your instructor into R 
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
# 
# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?
#############################################################################################

install.packages("jpeg")
require("jpeg")

##Put URL into object
jpeg_url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

#Set file path and download file
f <- file.path(getwd(), "jeff.jpg")
jeff<- download.file(jpeg_url, f, method = "curl")

#Put downloaded image into object
read_jeff <- readJPEG(f, native=TRUE)

#Find 30th and 80th Quantiles
answer_2 <- quantile(read_jeff, probs = c(.3, .8))
