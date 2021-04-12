train_control<-trainControl(method="repeatedcv", number=10, repeats=3)
set.seed(3233)


knn_model<-train(V14 ~., data=training_data, method="knn", trControl=train_control, preProcess=c("center", "scale"), tuneLength=10)



knn_prediction<-predict(knn_model, newdata=testing_data)
knn_prediction


confusionMatrix(knn_prediction, testing_data$V14)