-- Step 1 to make new table clean_sales--
select * ,
	(NA_Sales + EU_Sales + JP_Sales + Other_Sales) as Global_Sales1
into clean_sales from vgsales

-- Last step for final table display --
select * from clean_sales

-- Step 2 to drop the global sales col with rounding errors--
alter table clean_sales drop column Global_Sales

-- Step 3 to change name of the new and correct global sales 1 to global sales-- 
sp_rename 'clean_sales.Global_Sales1', 'Global_Sales', 'COLUMN';

-- Step 4 to dense rank so that same sales don't have different ranks--
WITH toupdate AS 
	(
      SELECT *, DENSE_RANK() OVER(ORDER BY Global_Sales DESC) as NewRank
      FROM clean_sales
	)
UPDATE toupdate
    SET Rank = NewRank;

-- Incase of rewrite required --
drop table clean_sales

-- NOTE: Each step needs to be run individually! DO NOT combined and run as a whole! --