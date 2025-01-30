create database insurance;
use insurance;
select * from insur;

-- the total number of individuals
SELECT COUNT(*) AS TotalIndividuals
FROM insur;

-- Count of males and females
SELECT sex, COUNT(*) AS NumberOfIndividuals
FROM insur
GROUP BY sex;

-- average age of the individuals
SELECT AVG(age) AS AverageAge
FROM insur;

-- highest and lowest BMI
SELECT MAX(bmi) AS HighestBMI, MIN(bmi) AS LowestBMI
FROM insur;

-- count of people are there in each region
SELECT region, COUNT(*) AS NumberOfPeople
FROM insur
GROUP BY region;

-- count of smokers and non-smokers 

SELECT smoker, COUNT(*) AS NumberOfSmokers
FROM insur
GROUP BY smoker;

-- average charge for smokers and non-smokers in each region wise
SELECT region, smoker, AVG(charges) AS AverageCharge
FROM insur
GROUP BY region, smoker;


-- top 3 individuals with the highest charges. Display their age, sex, BMI, and charges.
SELECT age, sex, bmi, charges
FROM insur
ORDER BY charges DESC
limit 3;

-- average BMI for males and females who have at least one child

SELECT sex, AVG(bmi) AS AverageBMI
FROM insur
WHERE children > 0  
GROUP BY sex;

-- In each region, how many individuals are there in each age group: 18-25, 26-35, 36-45, 46-55, and 56+?
SELECT region,
       CASE
           WHEN age BETWEEN 18 AND 25 THEN 'Young Adult'
           WHEN age BETWEEN 26 AND 35 THEN 'Adult'
           WHEN age BETWEEN 36 AND 45 THEN 'Middle-Aged'
           WHEN age BETWEEN 46 AND 55 THEN 'Mature Adult'
           ELSE 'Senior' 
       END AS AgeGroup,
       COUNT(*) AS NumberOfIndividuals
FROM insur
GROUP BY region, AgeGroup
ORDER BY region, AgeGroup;