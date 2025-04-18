# Credit-Card-Fraud-Detection
Machine Learning model to detect fraudulent credit card transactions using Python
# Credit Card Fraud Detection

This project uses machine learning algorithms in R to detect fraudulent transactions in a credit card dataset. The work includes dataset exploration, feature engineering, model training (Logistic Regression & Decision Trees), and performance evaluation using ROC-AUC and hypothesis testing.

## 📊 Dataset Overview

- **Features**: Time, Amount, Class (Fraud or Not), plus anonymized PCA components
- **Goal**: Classify transactions as fraud or normal
- **Preprocessing**:
  - Handled null values
  - Scaled Amount feature
  - Visualized distributions using violin and scatter plots

## 🧠 Models Used

1. **Logistic Regression**
   - Evaluated with Confusion Matrix, ROC Curve, AUC
2. **Decision Tree**
   - Compared to Logistic Regression
   - Performed statistical significance testing (p-value)

## 🔬 Key Findings

- Dataset is highly imbalanced
- Decision Trees showed a slightly better AUC performance than Logistic Regression
- Statistical tests conducted to validate model comparison
- ROC curves and median AUC scores were used for multi-run evaluation

## 📂 Structure

- `technical_report.pdf`: Full write-up and results
- `images/`: Plots and visuals (to be uploaded)
- `fraud_model.R`: R code used for analysis (upload if available)
- `data/`: Dataset (omit if restricted; link to Kaggle instead)

## 🛠 Tools & Languages

- R  
- ggplot2, dplyr, caret, pROC  
- RStudio

## 📌 Future Work

- Implement Random Forest, SVM, or Neural Networks
- Apply SMOTE or other resampling methods for class imbalance
- Explore anomaly detection methods

## 👩‍💻 Author

Aneesah Emran  
[LinkedIn](https://www.linkedin.com/in/aneesah-emran-64aa1215a)
