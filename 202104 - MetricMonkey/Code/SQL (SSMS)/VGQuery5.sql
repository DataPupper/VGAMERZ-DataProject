--Dropping rows from platform and genre withn less than 10 and price > $60 and no score--
delete from final_clean where Genre = 'Strategy' 
delete from final_clean where Platform = '2600' OR Platform = 'DC' OR Platform = 'GEN' 
delete from final_clean where Price > 60 AND Score IS NULL

--New table with each platfrom Console wise--
Select *,
	case
		when Platform LIKE 'PS%' then 'PlayStation'
		when Platform LIKE 'X%' then 'Xbox'
		when Platform LIKE '%[G,D,N,W]%' then 'Nintendo'
		when Platform = 'PC' then 'Computer'
	end as Console
into VG_Clean_Final from final_clean

--To display and check check if correct data has been alloted--
select Platform, Console from VG_Clean_Final

-- To dense rank so that same sales don't have different ranks--
WITH toupdate AS 
	(
      SELECT *, DENSE_RANK() OVER(ORDER BY Total_Sales DESC) as NewRank
      FROM VG_Clean_Final
	)
UPDATE toupdate
    SET Rank = NewRank; 

--Display new table--
select * from VG_Clean_Final order by Rank

--Incase rewrite required--
drop table VG_Clean_Final