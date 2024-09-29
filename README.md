<h1 align="center">Income Classification: Upper Middle Class Analysis</h1>


## Table of Contents 
- [Overview](#overview)
- [Data](#data)
- [Methodology](#methodology)
  - [Data Exploration](#data-exploration)
  - [Logistic Regression](#logistic-regression)
  - [Decision Tree](#decision-tree)
- [Installation](#installation)
- [Usage](#usage)
- [Future Work](#future-work)
- [Results](#results)

## Overview
This project analyzes income classification based on a dataset from the 1994 U.S. Census to predict whether an individual earns over or under $50,000 annually, representing the upper middle class threshold.

## Data
The dataset comprises various features from 100,000 individuals, including:

### Predictors
- **age**: Continuous numeric
- **workclass**: Categorical (e.g., Private, Self-emp)
- **education**: Categorical (e.g., Bachelors, HS-grad)
- **education-num**: Continuous numeric
- **marital-status**: Categorical (e.g., Married, Divorced)
- **occupation**: Categorical (e.g., Tech-support, Sales)
- **race**: Categorical (e.g., White, Black)
- **sex**: Categorical (e.g., Male, Female)
- **capital-gain**: Continuous numeric
- **capital-loss**: Continuous numeric
- **hours-per-week**: Continuous numeric
- **native-country**: Categorical

### Target
- **salary**: <=50K or >50K

## Methodology

### Data Exploration
Initial data exploration was performed to summarize variables and visualize distributions using ggplot2.

### Logistic Regression
1. Fit a logistic regression model using key predictors.
2. Use 5-fold cross-validation to optimize lambda values.
3. Evaluate misclassification rates.

### Decision Tree
1. Fit a decision tree model to the training data.
2. Analyze decision nodes and visualize the tree structure.
3. Calculate confusion matrix and assess performance metrics.

## Installation
To run this project, ensure you have the following R packages installed:
- `tidyverse`
- `cluster`
- `dplyr`
- `ggplot2`
- `rpart`
- `rpart.plot`
- `glmnet`

## Usage
1. Clone the repository to your local machine.
2. Load the dataset `salary.csv`.
3. Execute the R scripts provided to perform data analysis and modeling.

