
library(caTools)

heart_dataframe<-read.csv(url("http://dataaspirant.com/wp-content/uploads/2017/01/heart_tidy.csv"))

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

lr_model<-glm(V14 ~.,data=training_data, family=binomial)

lr_model

prediction<-predict(lr_model, type='response')

table(training_data$V14, prediction>0.5)




