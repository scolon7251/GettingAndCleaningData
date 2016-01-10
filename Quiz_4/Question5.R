##QuantMod Code

install.packages("quantmod")
library("quantmod")
amzn = getSymbols("AMZN", auto.assign=FALSE)
sampleTimes= index(amzn)
View(sampleTimes)
addmargins(table(year(sampleTimes), weekdays(sampleTimes)))

##Table shows 250 total values collected in 2012, 47 of which on Monday.  