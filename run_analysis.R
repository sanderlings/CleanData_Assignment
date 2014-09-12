setwd("C:/Users/Joanna/Documents/Z-Study/Coursera/DS3-Clean/CleanData_Assignment/")
library(reshape2)
library(plyr)

# read the test measurement data
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
# class(testdata)
# head(testdata)
# str(testdata)
# names(testdata)

# read the measurements names, then trim only the text column
colname <- read.table("./UCI HAR Dataset/features.txt")
# class(colname)
# head(colname)
# str(colname)
# names(colname)

colname2 <- subset(colname, select=c(V2))
# class(colname2)
# head(colname2)
# str(colname2)
# names(colname2)

# label the test data with the measurement names
names(testdata) <- colname$V2
# head(testdata)
# names(testdata)
# str(testdata)

# read the test activity
testact <- read.table("./UCI HAR Dataset/test/y_test.txt")
# class(testact)
# head(testact)
# str(testact)
# names(testact)

# label the column as "Activity"
names(testact) <- c("Activity")
# names(testact)
# head(testact)
# str(testact)

# read the test subject ID
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# class(testsub)
# head(testsub)
# str(testsub)
# names(testsub)

# label the column as "SubjectID"
names(testsub) <- c("SubjectID")
# names(testsub)
# head(testsub)
# str(testsub)

# combine the test set - subject ID, activity, measurement
testcmb <- cbind(testsub, testact, testdata)
# class(testcmb)
# head(testcmb)
# str(testcmb)
# names(testcmb)


# read the train set
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
# class(traindata)
# head(traindata)
# str(traindata)
# names(traindata)

# label the train data with the measurement names
names(traindata) <- colname$V2
# head(traindata)
# names(traindata)
# str(traindata)

# read the train activity
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt")
# class(trainact)
# head(trainact)
# str(trainact)
# names(trainact)

# label the column as "Activity"
names(trainact) <- c("Activity")
# names(trainact)
# head(trainact)
# str(trainact)

# read the test subject ID
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# class(trainsub)
# head(trainsub)
# str(trainsub)
# names(trainsub)

# label the column as "SubjectID"
names(trainsub) <- c("SubjectID")
# names(trainsub)
# head(trainsub)
# str(trainsub)

# combine the test set - subject ID, activity, measurement
traincmb <- cbind(trainsub, trainact, traindata)
# class(traincmb)
# head(traincmb)
# str(traincmb)
# names(traincmb)


# merge the test data with train data using rbind
#intersect(names(testcmb), names(traincmb))

mdata = rbind(testcmb, traincmb)
# class(mdata)
# head(mdata)
# str(mdata)
# names(mdata)


# grep only column names with mean and standard deviation 
mstd <- grep("mean\\(|std\\(", names(mdata), value=TRUE)
# mstd

# extract only the columns with names mean or std, also subjectID and activity
xdata <- subset(mdata, select=c("SubjectID", "Activity", mstd))
# class(xdata)
# head(xdata)
# str(xdata)
# names(xdata)


# replace the activity code with activity name
xdata$Activity <- replace(xdata$Activity, xdata$Activity==1, "1-WALKING")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==2, "2-WALKING_UPSTAIRS")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==3, "3-WALKING_DOWNSTAIRS")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==4, "4-SITTING")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==5, "5-STANDING")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==6, "6-LAYING")
# head(xdata$Activity, n=100)
# names(xdata)         


# group the numeric columns by subjectID, then by activity
tdata <- aggregate(xdata[3:68], by=list(xdata$SubjectID, xdata$Activity), FUN=mean)
# class(tdata)
# head(tdata)
# str(tdata)
# names(tdata)

# replace the generated names with appropriate names
colnames(tdata)[1] <- "SubjectID"
colnames(tdata)[2] <- "Activity"
# names(tdata)
# head(tdata)
# str(tdata)

# order by subjectID, then activity
tdata <- arrange(tdata, tdata$SubjectID, tdata$Activity)

# save file as txt
write.table(tdata, file="./tidyData.txt", row.name=FALSE)