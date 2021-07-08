-- Step 1 to make new table final_clean using clean_sales_revenue--
select * ,
(2017-Year) as [Years in Market],
(Total_Sales/(2017-Year)) as [Sales Per Year],
((Total_Revenue)/(2017-Year)) as [Revenue Per Year]
into final_clean from clean_sales_revenue

--Step 2 to display--
select * from final_clean order by Rank

-- Incase of rewrite required --
drop table final_clean

--NOTE: Each step to be executed individually and not the whole code combined--