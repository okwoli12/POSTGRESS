create table "sales_data"(
"SALES_ID" numeric,
"SALES_REP" text,
"EMAILS" varchar,	
"BRANDS" text,
"PLANT_COST" numeric,
"UNIT_PRICE" numeric,
"QUANTITY" numeric,
"COST" numeric,
"PROFIT" numeric,
"COUNTRIES" text,
"REGION" text,
"MONTHS" text,
"YEARS" numeric
);
-- question one
select sum("PROFIT") as "total_profit"
from "sales_data"

-- question two
select "TERRITORY", sum("PROFIT") as "total_profit"
from "sales_data"
(select *,
case when "COUNTRIES" in ('Nigeria','Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "sales_data") as "table_one"
group by "TERRITORRY"

-- question 3
select "COUNTRIES", sum("PROFIT") as "total_profit"
from "sales_data"
where "YEARS" =2019
group by "COUNTRIES"
order by "total_profit" desc
-- question 4
select sum("PROFIT") as "total_profit", "YEARS"
from "sales_data"
group by "YEARS"
order by "total_profit" desc
-- question 5
select "MONTHS", "YEARS", sum("PROFIT") as "total_profit"
from "sales_data"
group by "MONTHS", "YEARS"
order by "total_profit"
limit 5
-- 	question 6
select ("PROFIT")
from "sales_data"
where "MONTHS" = 'December' and "YEARS" = 2018
order by "PROFIT"
-- QUESTION 7
select "MONTHS", sum("PROFIT")/sum("COST")*100 as "profit_perc"
from "sales_data"
where "YEARS" =2019
group by "MONTHS"

-- question 8
select "BRANDS", sum("PROFIT") as "total_profit"
from "sales_data"
where "COUNTRIES" = 'senegal'
group by "BRANDS"
order by "total_profit" desc

question B1
select "BRANDS", sum("QUANTITY") as "gty"
from
(select *,
case when "COUNTRIES" in ('Nigeria','Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "sales_data") as "table_1"
where "YEARS" in (2019,2018) and "TERRITORY" = 'Francophone'
group by "BRANDS"
order by "gty" desc
limit 3;
-- question B2
select "BRANDS", sum("QUANTITY") as "qty"
from "sales_data"
where "COUNTRIES" = 'Ghana'
group by "BRANDS"
order by "qty" desc
limit 2;
question B3
select "BRANDS", sum("QUANTITY") as "qty"
from "sales_data"
where "COUNTRIES" = 'Nigeria' and "BRANDS" not like '%malt'
group by "BRANDS"
order by "qty" desc

-- question B4 formula 1
select "BRANDS", sum("QUANTITY") as "gty"
from
(select *,
case when "COUNTRIES" in ('Nigeria','Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "sales_data") as "table_1"
where "BRANDS" like '%malt' and "TERRITORY"= 'Anglophone' and "YEARS" in (2018,2019)
group by "BRANDS"


-- B4 formula 2
select "BRANDS", sum("QUANTITY") as "Qty"
from "sales_data"
where "BRANDS" like '%malt' and "COUNTRIES" in ('Ghana','Nigeria') and "YEARS" in (2018,2019)
group by "BRANDS"
order by "Qty" desc
-- question B5
select "BRANDS", sum("QUANTITY") as "Qty"
from "sales_data"
where "COUNTRIES" = 'Nigeria' and "YEARS" = 2019
group by "BRANDS"
order by "Qty" desc
-- question B6
select "BRANDS", sum("QUANTITY") as "qty"
from "sales_data"
where "REGION" = 'southsouth' and "COUNTRIES" = 'Nigeria'
group by "BRANDS"
order by "qty" desc
-- question B7
select sum("QUANTITY") as "QTY"
from "sales_data"
where "COUNTRIES" = 'Nigeria' and "BRANDS" not like '%malt'

-- question B8
select "REGION", sum("QUANTITY") as "Qty"
from "sales_data"
where "BRANDS" = 'budweiser' and "COUNTRIES" ='Nigeria'
group by "REGION"
order by "Qty" desc
-- question B9
select "REGION", sum("QUANTITY") as "Qty"
from "sales_data"
where "BRANDS" = 'budweiser' and "COUNTRIES" ='Nigeria' and "YEARS" = 2019
group by "REGION"
order by "Qty" desc
-- question C1
select "COUNTRIES", sum("QUANTITY") as "Qty"
from "sales_data"
where "BRANDS" not like '%malt'
group by "COUNTRIES"
order by "Qty" desc

-- question C2
select "SALES_REP", sum("QUANTITY") as "Qty"
from "sales_data"
where "BRANDS" = 'budweiser' and "COUNTRIES" ='Senegal'
group by "SALES_REP"
order by "Qty" desc
-- question C3
select "COUNTRIES", sum("PROFIT") as "total_profit"
from "sales_data"
where "MONTHS" in ('October','November','December') and "YEARS" =2019
group by "COUNTRIES"
order by "total_profit" desc
-- C3b
select*,
case when "MONTHS" in ('October','November','December') then 'Q4'
else 'others'ens as "QUARTERS"