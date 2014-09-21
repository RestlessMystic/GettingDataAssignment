
# Reading the training data

train.sub <- read.table("train/subject_train.txt")
train.x <- read.table("train/X_train.txt")
train.y <- read.table("train/Y_train.txt")
colnames(train.y) <- "y"
colnames(train.sub) <- "sub"

# Combining the Training Data
train.data <- cbind.data.frame(train.x, train.sub, train.y)

# Reading the Testing data
test.sub <- read.table("test/subject_test.txt")
test.x <- read.table("test/X_test.txt")
test.y <- read.table("test/Y_test.txt")
colnames(test.y) <- "y"
colnames(test.sub) <- "sub"
# Combining the Testing Data
test.data <- cbind.data.frame(test.x, test.sub, test.y )


###################          PART 1        ####################
################### Merging both Data Sets ################### 

dframe <- rbind.data.frame(train.data, test.data)


###################          PART 2        ####################
############# Choosing only mean n std columns ################ 

feat <- read.table("features.txt")
mean <- grep("mean()",x = feat$V2)  #mean
std <- grep("std()",x = feat$V2)    #std
collist <- c(mean, std, 562, 563)     # Combining mean, std, subject and y_train

data <- dframe[,sort(collist)]            # Subsetting data to choose mean and std columns

# Naming columns, just for my understanding
col.n <- c(as.character(feat$V2[feat$V1 %in% collist]), "SubjectList", "TrainY")
colnames(data) <- col.n



###################          PART 3        ####################
############# Attaching Descriptive Activity Names ############ 

data$TrainY <- as.factor(data$TrainY)
levels(data$TrainY) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS" , "SITTING", "STANDING", "LAYING")

###################          PART 4        ####################
############# Attaching Descriptive Activity Names ############ 


