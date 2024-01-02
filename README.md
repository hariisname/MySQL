# Healthcare Insurance Data Analysis

## Project Overview :
i took a insurance dataset from kaggle and i did analysis by using sql with help of mysql software,
and i explored some insights from a dataset containing information about the individuals, 
including their age, gender, BMI, smoking status, number of children, region, and medical charges.

## Brief Introduction :
The purpose of this project is to analyze the insurance dataset to find patterns, and key characteristics within the data.
the project aims to provide valuable insights for insurance companies to make informed decisions, 
such as adjusting premium rates, understanding regional health trends, and developing targeted policies.

## Problem Statement :
The project addresses the need for data-driven decision-making in the insurance industry. 
It aims to solve challenges related to understanding the factors are like medical charges, identifying patterns in smoking habits, 
and gaining regional insights to optimize insurance offerings.

## Insights : 
actually this project have columns are :- ID, Age(int), Gender(varchar), Bmi(float), Smoker(varchar)(Yes/No), Children(varchar)(0,1,2,3,4,5,>5), Region(varchar)(se,ne,sw,nw), Charges(float)
based on this data i got insights are :-
	- this dataset have 1338 records/ entities(select count(*) from insurance)
	- based on each region i have records are sw=325, se=364, nw=325 and ne=324
	- in this dataset having female columns are 662 it means near to half of the data 
	- the southEast region has highest average charges and 2nd highest is northEast
	- the maximum charges is 63770.42801
	- the minimum charges is 1121.8739
	- compare to female, male average charges is high
	- male candidates are smoking more
  
## Conclusions:
the analysis of this dataset gave valuable insights, this are crucial for decision-making in the insurance industry.ent boosting for cost prediction. The project used Python for data analysis and machine learning, Excel for data cleaning, transformation, and visualization, and SQL for data management and retrieval.
