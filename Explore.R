########## EXPLORATORY DATA ANALYSIS ###########

an_dat<-read.csv("train.csv")

#Tabulate variables

table(an_dat$AnimalType)

table(an_dat$OutcomeType)

table(an_dat$OutcomeSubtype)

table(an_dat$OutcomeType,an_dat$OutcomeSubtype)

table(an_dat$SexuponOutcome)

table(an_dat$Breed)

table(an_dat$Color)

table(an_dat$AgeuponOutcome)

#Recode age variable- all over the place
#Turn age variable into character vector
an_dat$AgeuponOutcome<-as.character(an_dat$AgeuponOutcome)

#Create extra column for days

grep("day",an_dat$AgeuponOutcome)
grep("week",an_dat$AgeuponOutcome)
grep("month",an_dat$AgeuponOutcome)
grep("month",an_dat$AgeuponOutcome)


#State all ages in days.
#7 days in a week, 30 days in a month, 365 days in a year.

an_dat$AgeInDays<- rep(NA,nrow(an_dat))
an_dat$AgeInDays[grep("day",an_dat$AgeuponOutcome)]<-an_dat$AgeuponOutcome[grep("day",an_dat$AgeuponOutcome)]
table(an_dat$AgeInDays)

library(plyr)
an_dat$AgeuponOutcome <- sub("^$", "No Age",an_dat$AgeuponOutcome )

j<-strsplit(an_dat$AgeuponOutcome," ")
k<-unlist(j)
df <- data.frame(matrix(unlist(j), nrow=nrow(an_dat),ncol = 2, byrow=T),stringsAsFactors=FALSE)

new_dat<-cbind(an_dat,df)


