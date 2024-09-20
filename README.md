# R-Classifying-UpperMiddle-Class

#### Results and Methodology
Our models predict whether a person makes over or under 50K a year.  In 1994 this corresponds to the upper middle class threshold.  

As this is a binary predictor, we begin by fitting logistic regression models.  The lambda min model is slightly more accurate than that our "optimal" lambda model we found using 5-fold cross-validation.  This model has a misclassification rate of 16.3% (83.7% accuracy).  While this is acceptable, we will attempt an alternate method of prediction, a decision tree.  After fitting the decision tree accuracy improved by approximately 1% compared to the logistic regression model.  

Our decision tree utilizes marital status, education, and capital gains as key nodes.  There are significantly more observations that are less than 50k, there is a concern for differences in recall and precision.  However, after calculating these rates there is no significant bias in the model.  


#### Data
The data set used in this part is extracted from the 1994 Census database.

##### Features (predictors):
+ `age:` continuous numeric
+ `workclass:` Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked.
+ `fnlwgt:` continuous numeric
+ `education:` Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, Assoc-voc, 9th, 7th-8th, 12th, Masters, 1st-4th, 10th, Doctorate, 5th-6th, Preschool
+ `education-num:` continuous numeric
marital-status: Married-civ-spouse, Divorced, Never-married, Separated, Widowed, Married-spouse-absent, Married-AF-spouse
+ `occupation:` Tech-support, Craft-repair, Other-service, Sales, Exec-managerial, Prof-specialty, Handlers-cleaners, Machine-op-inspct, Adm-clerical, Farming-fishing, Transport-moving, Priv-house-serv, Protective-serv, Armed-Forces
+ `relationship:`Wife, Own-child, Husband, Not-in-family, Other-relative, Unmarried
+ `race:` White, Asian-Pac-Islander, Amer-Indian-Eskimo, Other, Black
+ `sex:` Female, Male
+ `capital-gain:` continuous numeric
+ `capital-loss:` continuous numeric
+ `hours-per-week:` continuous numeric
+ `native-countr`y

##### Target (response):
`salary:` <=50K or >50K
