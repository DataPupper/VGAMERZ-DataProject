-- Step 1 to make new table clean_sales_revenue using clean_sales_price joined with game_scores--
select a.Rank, Name, Platform, Year, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales,
Global_Sales as Total_Sales,
[Final Price]as Price,
Score,
Global_Sales * [Final Price] as Total_Revenue
into clean_sales_revenue from clean_sales_price a 
LEFT JOIN game_scores b
ON lower(a.Name) = lower(b.Title) and lower(a.Platform) = lower(b.Plaftorm)

--step 2 & final step to display and check--
select * from clean_sales_revenue order by Rank

--step 3 to deleted unwanted rows--
delete from clean_sales_revenue where Rank IS NULL
delete from clean_sales_revenue where Rank > 500

-- Incase of rewrite required --
drop table clean_sales_revenue

--NOTE: Each step to be executed individually and not the whole code combined--