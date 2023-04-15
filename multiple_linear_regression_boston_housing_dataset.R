
#GROUP -  5S
#AP20110010380 - KAVYASREE KUNA
#AP20110010787 - DV SAI CHAITANYA
#AP20110010369 - SALLA TONY PREETH
#AP20110010782 - SITA CHANDRA
#AP20110010718 - SAMPATH KUMAR GOSHIKA

#The Boston Housing Dataset contains information about the housing values in suburbs of Boston, Massachusetts. It has 506 samples (rows) and 14 features (columns), including the target variable medv (median value of owner-occupied homes in $1000s). The features are:
  
 # crim: per capita crime rate by town
#zn: proportion of residential land zoned for lots over 25,000 sq.ft.
#indus: proportion of non-retail business acres per town
#chas: Charles River dummy variable (1 if tract bounds river; 0 otherwise)
#nox: nitric oxides concentration (parts per 10 million)
#rm: average number of rooms per dwelling
#age: proportion of owner-occupied units built prior to 1940
#dis: weighted distances to five Boston employment centers
#rad: index of accessibility to radial highways
#tax: full-value property-tax rate per $10,000
#ptratio: pupil-teacher ratio by town
#black: 1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town
#lstat: % lower status of the population
#medv: median value of owner-occupied homes in $1000s


url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/housing/housing.data"
data_text <- readLines(url)


file_path <- "boston_housing.csv"
writeLines(data_text, file_path)


Boston <- read.csv(file_path, header = FALSE, sep = "")


str(Boston)


set.seed(123)
train_index <- sample(1:nrow(Boston), size = round(0.7*nrow(Boston)), replace = FALSE)
train_data <- Boston[train_index, ]
test_data <- Boston[-train_index, ]


model <- lm(V14 ~ ., data = train_data)


summary(model)


predictions <- predict(model, newdata = test_data)


mse <- mean((predictions - test_data$medv)^2)
cat("Mean Squared Error:", mse, "\n")


plot(predictions, test_data$medv, xlab = "Predicted", ylab = "Actual", main = "Actual vs Predicted")
abline(0, 1, col = "red")
