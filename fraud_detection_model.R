
# Credit Card Fraud Detection in R
# Author: Aneesah Emran

# Load libraries
library(ggplot2)
library(caret)
library(pROC)
library(rpart)
library(dplyr)

# Load dataset
dataset <- read.csv("creditcard.csv")

# Explore dataset
dim(dataset)
head(dataset)
tail(dataset)
colSums(is.na(dataset))
names(dataset)

# Statistical summary
summary(dataset$Amount)
var(dataset$Amount)
sd(dataset$Amount)
sum(dataset$Amount > mean(dataset$Amount, na.rm = TRUE))

# Violin plot for amount by class
ggplot(dataset, aes(x = factor(Class), y = Amount)) +
  geom_violin(trim = FALSE, fill = "lightblue") +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(title = "Transaction Amount by Class", x = "Class", y = "Amount")

# Feature scaling
dataset$Amount <- scale(dataset$Amount)

# Train-test split
set.seed(123)
index <- createDataPartition(dataset$Class, p = 0.75, list = FALSE)
train_set <- dataset[index, ]
test_set <- dataset[-index, ]

# Logistic Regression Model
log_model <- glm(Class ~ Amount, family = binomial, data = train_set)
summary(log_model)

# Predict and evaluate
pred_probs <- predict(log_model, test_set, type = "response")
pred_classes <- ifelse(pred_probs > 0.5, 1, 0)

confusionMatrix(factor(pred_classes), factor(test_set$Class))

# ROC & AUC
roc_obj <- roc(test_set$Class, pred_probs)
plot(roc_obj, col = "blue", main = "ROC Curve - Logistic Regression")
auc(roc_obj)

# Decision Tree Model
tree_model <- rpart(Class ~ ., data = train_set, method = "class")
tree_preds <- predict(tree_model, test_set, type = "prob")[, 2]
tree_classes <- ifelse(tree_preds > 0.5, 1, 0)

confusionMatrix(factor(tree_classes), factor(test_set$Class))

# ROC & AUC for Decision Tree
tree_roc <- roc(test_set$Class, tree_preds)
plot(tree_roc, col = "green", main = "ROC Curve - Decision Tree")
auc(tree_roc)
