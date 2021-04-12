install.packages("e1071")
library(e1071)


nbclassifier=naiveBayes(V14 ~., data=training_data)

nbclassifier

nb_prediction=predict(nbclassifier, testing_data)
nb_prediction

confusionMatrix(nb_prediction, testing_data$V14)