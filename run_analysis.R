setwd("C:/Users/Joanna/Documents/Z-Study/Coursera/DS3-Clean/CleanData_Assignment/")
library(reshape2)
library(plyr)

# read the test measurement data
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")

# read the measurements names, then trim only the text column
colname <- read.table("./UCI HAR Dataset/features.txt")
colname2 <- subset(colname, select=c(V2))

# label the test data with the measurement names
names(testdata) <- colname$V2

# read the test activity
testact <- read.table("./UCI HAR Dataset/test/y_test.txt")

# label the column as "Activity"
names(testact) <- c("Activity")

# read the test subject ID
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# label the column as "SubjectID"
names(testsub) <- c("SubjectID")

# combine the test set - subject ID, activity, measurement
testcmb <- cbind(testsub, testact, testdata)


# read the train set
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")

# label the train data with the measurement names
names(traindata) <- colname$V2

# read the train activity
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt")

# label the column as "Activity"
names(trainact) <- c("Activity")

# read the test subject ID
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# label the column as "SubjectID"
names(trainsub) <- c("SubjectID")


# combine the test set - subject ID, activity, measurement
traincmb <- cbind(trainsub, trainact, traindata)

# merge the test data with train data using rbind
mdata = rbind(testcmb, traincmb)

# grep only column names with mean and standard deviation 
mstd <- grep("mean\\(|std\\(", names(mdata), value=TRUE)

# extract only the columns with names mean or std, also subjectID and activity
xdata <- subset(mdata, select=c("SubjectID", "Activity", mstd))

# replace the activity code with activity name
xdata$Activity <- replace(xdata$Activity, xdata$Activity==1, "1-WALKING")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==2, "2-WALKING_UPSTAIRS")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==3, "3-WALKING_DOWNSTAIRS")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==4, "4-SITTING")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==5, "5-STANDING")
xdata$Activity <- replace(xdata$Activity, xdata$Activity==6, "6-LAYING")

# group the numeric columns by subjectID, then by activity
tdata <- aggregate(xdata[3:68], by=list(xdata$SubjectID, xdata$Activity), FUN=mean)

# replace the generated names with appropriate names
colnames(tdata)[1] <- "SubjectID"
colnames(tdata)[2] <- "Activity"

# order by subjectID, then activity
tdata <- arrange(tdata, tdata$SubjectID, tdata$Activity)

# save file as txt
write.table(tdata, file="./tidyData.txt", row.name=FALSE)