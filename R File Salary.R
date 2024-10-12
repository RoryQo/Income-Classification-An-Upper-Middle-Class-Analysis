## ----warning=F,message=F-------------------------------------------
library(tidyverse)
library(cluster)
library(dplyr)
library(ggplot2)
library(rpart)
library(rpart.plot)
library(glmnet)

salary_US0 = read_csv("salary.csv", show_col_types = FALSE)

salary_US1 <- salary_US0 %>% filter(`native-country`=="United-States")


## ------------------------------------------------------------------
#summary each variable
salary_US2 <- as.data.frame(unclass(salary_US1), stringsAsFactors=TRUE)
summary(salary_US2)


## ------------------------------------------------------------------
salary_US3 <- salary_US2 %>% select(-c(native.country,fnlwgt,education,relationship))


## ------------------------------------------------------------------
ggplot(data=salary_US3,mapping=aes(x=sex,y=salary))+geom_bin2d()


## ------------------------------------------------------------------
# Create for for regression
form_full <- as.formula("salary~age+workclass+education.num+
 marital.status+occupation+race+sex+capital.gain+
 capital.loss+hours.per.week")
set.seed(99)

# Split data for training and testing
train6 <- salary_US3 %>% sample_frac(size = 0.8)
test6 <- salary_US3 %>% setdiff(train6)

# Find best lambda with 5 fold cross validation
predictors <- model.matrix(form_full, data = train6)
fit1 <- cv.glmnet(predictors, train6$salary, family = "binomial")
fit1$lambda.1se

# Plot fit
plot(fit1)


## ------------------------------------------------------------------
# Fit model with predictors, data, and binomial model

fit2 <- glmnet(predictors, train6$salary, family = "binomial", lambda = 0.004)
fit2


## ------------------------------------------------------------------
# Create function to return misclass rate
logistic.misclassrate <- function(dataset, y, fit, form){
 misclass_lr <- dataset %>% 
 mutate(pred.logistic = predict(fit, newx = model.matrix(form, data = dataset), 
 type = "class")) %>% 
 mutate(misclassify = ifelse(y != pred.logistic, 1,0)) %>%
 summarize(misclass.rate = mean(misclassify))
return(misclass_lr$misclass.rate)
}


logistic.misclassrate(test6,test6$salary,fit2,form_full)



## ------------------------------------------------------------------
# Find lambda min
fit1$lambda.min

# Fit logistic regression with lambda
fit3 <- glmnet(predictors, train6$salary, family = "binomial", lambda = 0.0001)
logistic.misclassrate(test6,test6$salary,fit3,form_full)


## ----message=F,warning=F-------------------------------------------
set.seed(99)

# Split the data
train1 <- salary_US3 %>% sample_frac(size = 0.8)
test1 <- salary_US3 %>% setdiff(train1)
library(glmnet)


## ----warning=F-----------------------------------------------------
# Select form for tree
form<- as.formula(
"salary ~sex+age+workclass+education.num+
 marital.status+occupation+race+sex+capital.gain+
 capital.loss+hours.per.week")

# Select form and data for model
mod_lr2 <- glm(form, data=train1,family=binomial)


## ----warning=F,fig.width = 8---------------------------------------
# Fit and plot model
mod_tree <- rpart(form,data=train1)
rpart.plot(mod_tree)


## ------------------------------------------------------------------
prop.table(table(salary_US3$salary))


## ------------------------------------------------------------------

confusMatrix <- function (data, y, mod) 
 { confMatrix <- data %>%
 mutate(pred = predict(mod, newdata = data, type ="class"),y=y) %>%
 select (y, pred) %>% table() }
misclass <- function(confusion) {
misclass <- 1- sum(diag(confusion))/sum(confusion)
return(misclass)}
cMat <- confusMatrix(salary_US3, salary_US3$salary, mod_tree)
cMat


## ------------------------------------------------------------------
Rates<-c("Misclass", "True Positive", "True Negative")
Values<-c( misclass(cMat),cMat[1,1]/sum(cMat[,1]), cMat[2,2]/sum(cMat[,2]))

cbind(Rates,Values)

