-- Data Cleaning

SELECT *
FROM layoffs.layoffs;

-- Drop duplicates
-- Standardize the Data 
-- Null Values or blsnk values
-- Remove irrelevant columns


create table layoffs_staging
like layoffs;

select*
from layoffs_staging;

insert layoffs_staging
select*
from layoffs;

select*
from layoffs_staging;

select*,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
)row_num
from layoffs_staging;

-- create cte to check for duplicates
with duplicate_cte as
(
select*,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
)row_num
from layoffs_staging
)
select*
from duplicate_cte
;

with rank_cte as
(
select*,
DENSE_RANK () over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
)rank_num
from layoffs_staging
)
select*
from rank_cte
;

-- confirm if the data are really duplicate

select*
from layoffs_staging
where company = 'Cazoo';

-- we created another a table to delete the duplicates
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
   `row_id` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from layoffs_staging2;


insert into layoffs_staging2
select*,
row_number() over(
partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions
)row_id
from layoffs_staging;

DELETE
FROM layoffs_staging2
where row_id > 1;
select*
from layoffs_staging2
where row_id > 1;

select*
from layoffs_staging2;

-- standarding data 
SELECT company,(TRIM(company))
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET industy = 'Crypto'
WHERE industry LIKE 'crypto%';

SELECT*
FROM layoffs_staging2
where country like 'United States%'
;

SELECT DISTINCT country,company
FROM layoffs_staging2
ORDER BY 1
;
UPDATE layoffs_staging2
SET country = trim(trailing '.' from country)
where country like 'United States%';

SELECT *
FROM layoffs_staging2
ORDER BY 1;
-- Formating date
SELECT`date`
from layoffs_staging2;



SELECT `date`,
str_to_date(`date`,'%Y-%m-%d')
from layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`,'%Y-%m-%d');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT*
from layoffs_staging2;

-- Working with null
SELECT*
from layoffs_staging2
where industry is NULL
or industry = '';

SELECT*
from layoffs_staging2
where company = 'Airbnb';

select t1.industry,t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL OR t1.industry = ''
AND t2.industry IS NOT NULL
;
UPDATE layoffs_staging2
SET industry = NULL
where industry = '';

SELECT*
from layoffs_staging2;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;


SELECT *
from layoffs_staging2
where total_laid_off is null
 and percentage_laid_off is NULL;

DELETE
from layoffs_staging2
where total_laid_off is null
 and percentage_laid_off is NULL;

SELECT company,industry
FROM layoffs_staging2
;

ALTER TABLE layoffs_staging2
DROP COLUMN row_id;

SELECT*
FROM layoffs_staging2;


















































