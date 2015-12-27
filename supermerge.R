#read in test and training duplicate data
#start in root folder
labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = 
                        c("activityInd", "activity"))
names <- read.table("./UCI HAR Dataset/features.txt")

#trainfolder
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
trainx <- read.table("./UCI HAR Dataset/train/X_train.txt") #get column names from the features.txt
trainy <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names="activityy")

#testfolder
testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
testact <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
testx <- read.table("./UCI HAR Dataset/test/X_test.txt") #get column names from the features.txt
testy <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names="activityy")

#begin merging
subject<- rbind(testsubj, trainsub)
act <- rbind(testact, trainact)
xdat <- rbind(testx, trainx)
names(xdat) <- names[,2]
meansx <- xdat[,grep("mean",names(xdat))]
tidyset <- cbind(subject, act, meansx)
library(dplyr)
#I know I've done this without dplyr before...but can't find how, oh well, thanks google
tidyset4<-tidyset %<>% group_by(activity, subject) %>% summarise_each(funs(mean))
write.table(tidyset4, "tidyset.txt", row.names = FALSE)

#ydat <- rbind(testy, trainy)
#names(ydat) <- names[,2]
#6meansy <- ydat[grepl("*mean*",names(ydat)) | grepl("*std*",names(ydat)),]