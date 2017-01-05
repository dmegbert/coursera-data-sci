#Week 1 of Getting and Cleaning Data

#create a data directory if it doesn't exist
if(!file.exists("data")) {
    dir.create("data")
}

#use this for reproducibility sake, doesn't matter what file type
#important args: url, destfile, method
# download.file()
# use method - curl if https:// on a mac

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")

#add the date
dateDownloaded <- date()
dateDownloaded

cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)

#many files have ` or " so quote = "" can fix that issue if read in as one long vector

#reading in excel files
library(xlsx)
cameraDataX <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, header = TRUE)
head(cameraDataX)

#reading specific columns and rows
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
cameraDataSubset

# write.xlsx will write out an excel file
# XLConnect is better for writing and manipulating Excel files
# in general, .csv or tab separated better - faster and universal

# Reading in XML into R
# Use XML Library

library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternal = TRUE)

#root node is wrapper for entire document
rootNode <- xmlRoot(doc)
xmlName(rootNode)

#shows next level down
names(rootNode)

#access elements similar to a list
#shows first food element
rootNode[[1]]

#shows just name - belgian waffle
rootNode[[1]][[1]]

#gets all text out
xmlSApply(rootNode, xmlValue)

#use XPath to get more
# /node - top level node
# //node - node at any level
# node[@attr-name] node with an attribute name
# node[@attr-name='bob'] Node with attribute name = 'bob'

#Get the items on the menu and prices

#returns all food names
xpathSApply(rootNode, "//name", xmlValue)

#returns all prices
xpathSApply(rootNode, "//price", xmlValue)

fileUrl <- "http://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl, useInternalNodes = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
teams
doc

#Reading data from JSON
# use jsonlite package
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/dmegbert/repos")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner$login)

# Writing data frames to JSON
# Setting pretty = True adds indentation
myjson <- toJSON(iris, pretty = TRUE)
cat(myjson)

# write it back to 
iris2 <- fromJSON(myjson)
head(iris2)

#data.table is a faster version of data frame

library(data.table)

#Quiz stuff...

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/community.csv", method = "curl")
communityData <- read.csv("./data/community.csv")
head(communityData)
propValues <- communityData$VAL
View(propValues)
propValues <- propValues == 24
richProp <- dplyr::filter(communityData, communityData$VAL == 24)
View(richProp)


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/gas.xlsx", method = "curl")
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse("./data/restaurant.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlSApply(rootNode, xmlValue)
xmlName(rootNode)
xpathSApply(rootNode, "//zipcode", xmlValue)
doc

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/idaho.csv", method = "curl")
communityData <- fread("./data/idaho.csv")
DT <- communityData
head(communityData)
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
mean(DT$pwgtp15,by=DT$SEX)
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
