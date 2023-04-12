# Effectiveness of Different Policies Aimed to Reduce Traffic Deaths - Data Exploration and Regression Analysis

## Overview

This project aims to study the effectiveness of different policies in reducing vehicle fatality rate (VFR) due to alcohol-involved accidents. The data consists of 336 observations from 48 states across 7 years from 1982-1988. The policies focused on in this study are beertax, jaild, comserd, and mlda. This readme file outlines the data exploration and regression analysis carried out in this project.

## Data Tools

The data exploration and analysis were conducted using various tools such as Python, Jupyter Notebook, and R. The data was first cleaned and organized in Python, and exploratory analysis was carried out using various libraries such as Pandas, Matplotlib, and Seaborn. The regression analysis was performed in R, using packages such as plm and stargazer.

## Data Exploration

We began by exploring the data and analyzing variables that we thought could be significant in our model. We used control variables such as state unemployment rate, per capita personal income, GSP rate of change, % of young drivers, % residing in dry counties, and population variables. The panel data was found to be balanced, and the mean VFR was 0.6593, while the mean beertax was $0.5132 per case of beer. Graphs and charts were used to interpret the policies and variables, and the findings were summarized in Table 1.1 and Table 1.2.

## Regression Analysis

We conducted a pooled OLS regression analysis with cluster-robust standard errors, which showed that none of the variables were significant at the 5% level except for per capita personal income, per capita pure alcohol consumption, and % Mormon. However, we found an endogeneity problem in this model, and thus, we used the fixed effects model to control for unobserved heterogeneity. The findings from the fixed effects model showed that the magnitude of beertax increased but remained insignificant, while the coefficients for jaild and comserd increased significantly. We found that a mandatory jail sentence is expected to increase VFR by 0.213, while mandatory community service is expected to decrease VFR by 0.2.

## Conclusion

In conclusion, our analysis suggests that mandatory community service and mandatory jail sentences are more effective in reducing VFR due to alcohol-involved accidents than beertax and mlda policies. However, further research is needed to address the endogeneity problem in the data.

## Contributors

* Milena Agudelo
* Adreanna Thai
* Luomeng Wei
* Muhannad Dojki
