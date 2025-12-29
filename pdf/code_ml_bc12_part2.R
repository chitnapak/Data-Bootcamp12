## load library
library(tidyverse)
library(caret)
library(mlbench)
library(MLmetrics)


## 1. split data (train 80%, test 20%)
## 2. train model
## 3. score (predict)
## 4. evaluate compare train vs. test error (accuracy)

## predict diabetes
data("PimaIndiansDiabetes")

## clean missing values
df <- PimaIndiansDiabetes %>%
  drop_na()

## split data
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.8*n)
train_df <- df[id, ]
test_df <- df[-id, ]

## train model
set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE,
                     summaryFunction = prSummary,
                     classProbs = TRUE)

k_grid <- data.frame(k = c(3,5,7,9)) #set k

model <- train(diabetes ~ .,
               data = train_df,
               method = "knn",
               metric = "AUC",
               trControl = ctrl,
               ## grid search
               tuneGrid = k_grid,
               # standardization
               preProcess = c("center", "scale"))

# center and scale : standardization
## z = (x-x_bar) / sd

# normalization
# norm_x = (x-min_x) / (max_x - min_x)

## random forest
model <- train(diabetes ~ .,
               data = train_df,
               method = "rf",
               metric = "AUC",
               trControl = ctrl,
               ## grid search
               ## tuneGrid = k_grid,
               ## standardization
               preProcess = c("center", "scale"))

## knn (done)
## decision tree
## random forest
## regularization
## ensemble model (concept)




