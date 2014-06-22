# tidy data exercise, project 1
# import test file
test.frame <- read.table("./X_test.txt")
# import activity file
activity.frame <- read.table("./y_test.txt")
# import test
person.frame <- read.table("./subject_test.txt")
# 2 step merge to get to almost tidy data
almost.frame <- cbind(activity.frame, test.frame)
tidyA.frame <- cbind(person.frame, almost.frame)
# read features file
feature.frame <- read.table("./features.txt")
# convert to character vector
feature.vect2 <- as.character(feature.frame[,c(2)])
feature.vect1 <- c("Subject", "Activity")
feature.all <- c(feature.vect1,feature.vect2)
colnames(tidyA.frame) <- feature.all
# tidy data exercise, project 1
# import train file
train.frame <- read.table("./X_train.txt")
# import activity file
activity.frame <- read.table("./y_train.txt")
# import train file subjects
person.frame <- read.table("./subject_train.txt")
# 2 step merge to get to almost tidy data
almost.frame <- cbind(activity.frame, train.frame)
tidyB.frame <- cbind(person.frame, almost.frame)
# read features file
# feature.frame <- read.table("./features.txt")
# convert to character vector
# feature.vect2 <- as.character(feature.frame[,c(2)])
# feature.vect1 <- c("Subject", "Activity")
# feature.all <- c(feature.vect1,feature.vect2)
colnames(tidyB.frame) <- feature.all
# combine train and test
tidy.all <- rbind(tidyA.frame,tidyB.frame)
# use ply package for the arrange function
library(plyr)
# find the mean ans std columns names for the final data frame
# smaller data frame with new shorter list of mean and standard deviation variables
tidy.mean.std <- tidy.all[,c("Subject", "Activity",grep("(.*)-mean(.*)|(.*)-std(.*)", names(tidy.all),value=TRUE))] 
# reduce data to the average of each single activity by Subject 
tidy1 <- aggregate(tidy.mean.std[,3:length(tidy.mean.std)], by = list(Subject=tidy.mean.std$Subject, Activity=tidy.mean.std$Activity), mean)
# add factor variables for the six activities
tidy1$Activity <-factor(tidy1$Activity, labels=c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying"))
# now you have tidy data "tidy1" to write to a file
tidy1.ordered <- arrange(tidy1,Subject,Activity)
write.table(tidy1.ordered, file="tidy1.txt")