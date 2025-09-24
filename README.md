#  Sleep Efficiency Analysis Using MATLAB


##  Project Goal
The goal of this project is to explore how various personal and lifestyle factors—such as gender, age, and smoking status—affect sleep efficiency. Using **MATLAB Online**, this project combines **exploratory data analysis (EDA)** and **hypothesis testing** to uncover statistically significant trends in a real-world sleep dataset.

---

##  Dataset Information

- **Source:** [Kaggle - Sleep Efficiency Dataset](https://www.kaggle.com/datasets)
- **Total Records:** 452 patients
- **Variables:** 15 (demographic, sleep, and lifestyle factors)
- **Missing Data:** Minor — caffeine (25), alcohol (14), awakenings (20), exercise (6)

**Sample Stats:**

| Metric               | Value     |
|----------------------|-----------|
| Mean Age             | 40.3 years |
| Mean Sleep Duration  | 7.47 hours |
| Mean Sleep Efficiency| 78.9%     |

---

## 📈 Key Visualizations

-  **Histogram:** Sleep efficiency is right-skewed (most patients at 80–95%)
-  **Boxplots:** Sleep duration and efficiency show minimal gender differences
-  **Scatterplots:** Weak relationship between age and sleep efficiency
-  **Correlation Matrix:** 
  - +0.79 between Deep Sleep % and Sleep Efficiency
  - –0.82 between Light Sleep % and Sleep Efficiency
  - –0.57 between Awakenings and Sleep Efficiency

---

## Hypothesis Testing Results

| # | Hypothesis | Test Type | Result |
|--|------------|-----------|--------|
| 1 | Do males and females differ in sleep efficiency? | 2-sample t-test |  No significant difference (p = 0.8311) |
| 2 | Is age correlated with sleep efficiency? | Pearson correlation |  Weak but significant (r = 0.0984, p = 0.0366) |
| 3 | Does smoking status affect sleep efficiency? | 2-sample t-test |  Strongly significant (p < 0.0001) |

---

##  Conclusions

- Gender does **not** significantly affect sleep efficiency.
- Age has a **weak but statistically significant** positive relationship with sleep efficiency.
- **Smoking** is significantly associated with **lower sleep efficiency**, highlighting the impact of lifestyle choices.

---



##  Tools & Languages

- MATLAB Online (2024+)
- MATLAB built-in statistical functions: `ttest2`, `corr`, `boxplot`, `fitlm`
- Plots: `histogram`, `scatter`, `heatmap`, `xline`, `boxplot`

---


Created by **Aakash Balamurugan**  



