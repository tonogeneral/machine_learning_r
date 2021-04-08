#Código de curso Machine learning en R
# Fecha: 07-04-2021


heart_dataframe<-read.csv(url("http://dataaspirant.com/wp-content/uploads/2017/01/heart_tidy.csv"))

str(heart_dataframe)
head(heart_dataframe)

anyNA(heart_dataframe)
na.omit(heart_dataframe)

names(heart_dataframe)

names(heart_dataframe)[1] <- "V1"
names(heart_dataframe)[2] <- "V2"
names(heart_dataframe)[3] <- "V3"
names(heart_dataframe)[4] <- "V4"
names(heart_dataframe)[5] <- "V5"
names(heart_dataframe)[6] <- "V6"
names(heart_dataframe)[7] <- "V7"
names(heart_dataframe)[8] <- "V8"
names(heart_dataframe)[9] <- "V9"
names(heart_dataframe)[10] <- "V10"
names(heart_dataframe)[11] <- "V11"
names(heart_dataframe)[12] <- "V12"
names(heart_dataframe)[13] <- "V13"
names(heart_dataframe)[14] <- "V14"

na.omit(heart_dataframe)

y <- heart_dataframe

split<-createDataPartition(y = heart_dataframe$V14, p=0.6, list=FALSE)

training_data<-heart_dataframe[split,]
testing_data <- heart_dataframe[-split,]

summary(heart_dataframe)



training_data[["V14"]]=factor(training_data[["V14"]])
testing_data[["V14"]]=factor(testing_data[["V14"]])
ggplot(data=heart_dataframe,aes(x=V14))+geom_histogram(binwidth=1)


library(caret)
library(ggplot2)

#heart_dataframe<-read.csv(url("https://dataaspirant.com/wp-content/uploads/2017/01/heart_tidy.csv"))

#ggplot(data=heart_dataframe,aes(x=X63))+geom_histogram(binwidth=1)

train_control<-trainControl(method="repeatedcv",number=10,repeats=3)


svm_train<-train(V14 ~.,data=training_data,method="svmLinear",
                 trControl=train_control,preProcess=c("center","scale"),tuneLength=10)

svm_train

testing_predictions<-predict(svm_train, newdata=testing_data)
testing_predictions

cm <- confusionMatrix(testing_predictions,testing_data$V14)

total <- cm$table[1,1] + cm$table[1,2] + cm$table[2,1] + cm$table[2,2]
total
writeLines(toString(total), "output.txt")


library("caret")


data(Titanic)
titanic_dataframe = as.data.frame(Titanic)

names(titanic_dataframe)




