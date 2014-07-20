# To have the script working, you have to copy the six data files onto the same work directory as text files.
# Answering question 1 which is reading all data and put them in one big file.
subject_train<- read.table("subject_train.txt")
x_train<- read.table("x_train.txt")
y_train<- read.table("y_train.txt")
subject_test<- read.table("subject_test.txt")
x_test<- read.table("x_test.txt")
y_test<- read.table("y_test.txt")
subject_temp<- rbind(subject_test, subject_train)
names(subject_temp) <- "V_subject" # change coloumn name to avoid duplication with x list
x_temp<- rbind(x_test, x_train)
y_temp<- rbind(y_test, y_train) 
names(y_temp) <- "V_y" # change coloumn name to avoid duplication with x list
all_temp<- cbind(subject_temp, x_temp)  
allData<- cbind(all_temp, y_temp)       # Put all in one file  
dim(allData)                            # Disply its dimentions (10299 X 563) 

# Answering question 2 which is extracting the mean and standerDev
allData_ordered<- allData[order(allData$V_subject, na.last=TRUE), ]
dim(allData_ordered)                    # Disply its dimentions (10299 X 563) 
TimeBodyAccMean_x<- allData_ordered$V1
TimeBodyAccMean_y<- allData_ordered$V2
TimeBodyAccMean_z<- allData_ordered$V3
TimeBodyAccSTD_x<- allData_ordered$V4
TimeBodyAccSTD_y<- allData_ordered$V5
TimeBodyAccSTD_z<- allData_ordered$V6
TimeGravityAccMean_x<- allData_ordered$V41
TimeGravityAccMean_y<- allData_ordered$V42
TimeGravityAccMean_z<- allData_ordered$V43
TimeGravityAccSTD_x<- allData_ordered$V44
TimeGravityAccSTD_y<- allData_ordered$V45
TimeGravityAccSTD_z<- allData_ordered$V46
TimeBodyAccJerkMean_x<- allData_ordered$V81
TimeBodyAccJerkMean_y<- allData_ordered$V82
TimeBodyAccJerkMean_z<- allData_ordered$V83
TimeBodyAccJerkSTD_x<- allData_ordered$V84
TimeBodyAccJerkSTD_y<- allData_ordered$V85
TimeBodyAccJerkSTD_z<- allData_ordered$V86
TimeBodyGyroMean_x<- allData_ordered$V121
TimeBodyGyroMean_y<- allData_ordered$V122
TimeBodyGyroMean_z<- allData_ordered$V123
TimeBodyGyroSTD_x<- allData_ordered$V124
TimeBodyGyroSTD_y<- allData_ordered$V125
TimeBodyGyroSTD_z<- allData_ordered$V126
TimeBodyGyroJerkMean_x<- allData_ordered$V161
TimeBodyGyroJerkMean_y<- allData_ordered$V162
TimeBodyGyroJerkMean_z<- allData_ordered$V163
TimeBodyGyroJerkSTD_x<- allData_ordered$V164
TimeBodyGyroJerkSTD_y<- allData_ordered$V165
TimeBodyGyroJerkSTD_z<- allData_ordered$V166
TimeBodyAccMagMean<- allData_ordered$V201
TimeBodyAccMagSTD<- allData_ordered$V202
TimeGravityAccMagMean<- allData_ordered$V214
TimeGravityAccMagSTD<- allData_ordered$V215
TimeBodyAccJerkMagMean<- allData_ordered$V227
TimeBodyAccJerkMagSTD<- allData_ordered$V228
TimeBodyGyroMagMean<- allData_ordered$V240
TimeBodyGyroMagSTD<- allData_ordered$V241
TimeBodyGyroJerkMagMean<- allData_ordered$V253
TimeBodyGyroJerkMagSTD<- allData_ordered$V254

FreqBodyAccMean_x<- allData_ordered$V266
FreqBodyAccMean_y<- allData_ordered$V267
FreqBodyAccMean_z<- allData_ordered$V268
FreqBodyAccSTD_x<- allData_ordered$V269
FreqBodyAccSTD_y<- allData_ordered$V270
FreqBodyAccSTD_z<- allData_ordered$V271
FreqBodyAccJerkMean_x<- allData_ordered$V345
FreqBodyAccJerkMean_y<- allData_ordered$V346
FreqBodyAccJerkMean_z<- allData_ordered$V347
FreqBodyAccJerkSTD_x<- allData_ordered$V348
FreqBodyAccJerkSTD_y<- allData_ordered$V349
FreqBodyAccJerkSTD_z<- allData_ordered$V350
FreqBodyGyroMean_x<- allData_ordered$V424
FreqBodyGyroMean_y<- allData_ordered$V425
FreqBodyGyroMean_z<- allData_ordered$V426
FreqBodyGyroSTD_x<- allData_ordered$V427
FreqBodyGyroSTD_y<- allData_ordered$V428
FreqBodyGyroSTD_z<- allData_ordered$V429
FreqBodyAccMagMean<- allData_ordered$V503
FreqBodyAccMagSTD<- allData_ordered$V504
FreqBodyBodyAccJerkMagMean<- allData_ordered$V516
FreqBodyBodyAccJerkMagSTD<- allData_ordered$V517
FreqBodyBodyGyroMagMean<- allData_ordered$V529
FreqBodyBodyGyroMagSTD<- allData_ordered$V530
FreqBodyBodyGyroJerkMagMean<- allData_ordered$V542
FreqBodyBodyGyroJerkMagSTD<- allData_ordered$V543

#Answring question 3 which is naming the dicriptive activities
y_data<- allData_ordered$V_y


#Answering question 4 is Done in step 2
#Answering question 5 which is creating a tidy data file
final_data<- cbind(allData_ordered$V_subject,TimeBodyAccMean_x,TimeBodyAccMean_y,TimeBodyAccMean_z,TimeBodyAccSTD_x,TimeBodyAccSTD_y,TimeBodyAccSTD_z)
final_data<- cbind(final_data, TimeGravityAccMean_x,TimeGravityAccMean_y,TimeGravityAccMean_z,TimeGravityAccSTD_x,TimeGravityAccSTD_y,TimeGravityAccSTD_z)
final_data<- cbind(final_data, TimeBodyAccJerkMean_x,TimeBodyAccJerkMean_y,TimeBodyAccJerkMean_z,TimeBodyAccJerkSTD_x,TimeBodyAccJerkSTD_y,TimeBodyAccJerkSTD_z)
final_data<- cbind(final_data, TimeBodyGyroMean_x,TimeBodyGyroMean_y,TimeBodyGyroMean_z,TimeBodyGyroSTD_x,TimeBodyGyroSTD_y,TimeBodyGyroSTD_z)
final_data<- cbind(final_data, TimeBodyGyroJerkMean_x,TimeBodyGyroJerkMean_y,TimeBodyGyroJerkMean_z,TimeBodyGyroJerkSTD_x,TimeBodyGyroJerkSTD_y,TimeBodyGyroJerkSTD_z)
final_data<- cbind(final_data, TimeBodyAccMagMean,TimeBodyAccMagSTD,TimeGravityAccMagMean,TimeGravityAccMagSTD,TimeBodyAccJerkMagMean,TimeBodyAccJerkMagSTD)
final_data<- cbind(final_data, TimeBodyGyroMagMean,TimeBodyGyroMagSTD,TimeBodyGyroJerkMagMean,TimeBodyGyroJerkMagSTD)

final_data<- cbind(final_data, FreqBodyAccMean_x,FreqBodyAccMean_y,FreqBodyAccMean_z,FreqBodyAccSTD_x,FreqBodyAccSTD_y,FreqBodyAccSTD_z)
final_data<- cbind(final_data, FreqBodyAccJerkMean_x,FreqBodyAccJerkMean_y,FreqBodyAccJerkMean_z,FreqBodyAccJerkSTD_x,FreqBodyAccJerkSTD_y,FreqBodyAccJerkSTD_z)
final_data<- cbind(final_data, FreqBodyGyroMean_x,FreqBodyGyroMean_y,FreqBodyGyroMean_z,FreqBodyGyroSTD_x,FreqBodyGyroSTD_y,FreqBodyGyroSTD_z)
final_data<- cbind(final_data, FreqBodyAccMagMean,FreqBodyAccMagSTD,FreqBodyBodyAccJerkMagMean,FreqBodyBodyAccJerkMagSTD,FreqBodyBodyGyroMagMean,FreqBodyBodyGyroMagSTD)
final_data<- cbind(final_data, FreqBodyBodyGyroJerkMagMean,FreqBodyBodyGyroJerkMagSTD,y_data)

dim(final_data)
str(final_data)
# Answering question 5 which is create a tidy data
colnames(final_data)[1] <- "SubjectID"
colnames(final_data)    # to show the colomns' names and ALL related to the average function

library(data.table)
tmp_dt <- as.data.table(final_data)

#library(plyr)    ## You might need it if you don't have downloaded it before!
final_dt<- ddply(tmp_dt, .(SubjectID, y_data), numcolwise(mean))

for (i in 1:180)
{
  if (final_dt$y_data[i] == 1) {final_dt$y_data[i] = "WALKING"}
  else if (final_dt$y_data[i] == 2) {final_dt$y_data[i] = "WALKING_UPSTAIRS"}
  else if (final_dt$y_data[i] == 3) {final_dt$y_data[i] = "WALKING_DOWNSTAIRS"}
  else if (final_dt$y_data[i] == 4) {final_dt$y_data[i] = "SITTING"}
  else if (final_dt$y_data[i] == 5) {final_dt$y_data[i] = "STANDING"}
  else if (final_dt$y_data[i] == 6) {final_dt$y_data[i] = "LAYING"}
  else {final_dt$y_data[i] = "NO ACTIVITY"}
}

unique(final_dt$SubjectID)  # to show the unique values of the Subject ordered 1 to 30
unique(final_dt$y_data)     # to show the unique vlaues of the activities in numbers before naming them 1-6

dim(final_dt) # the final dimensions of my data. Should be 180 by 68
write.table(final_dt, "TidyData.txt") # writing the data in table frame in output file named TidyData.txt




