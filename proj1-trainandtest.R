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