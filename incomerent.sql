--create income_data table
CREATE TABLE income_data (
    user_id VARCHAR,
    date DATE,
    amount FLOAT
);

--create rent_data table
CREATE TABLE rent_data (
    user_id VARCHAR,
    date DATE,
    charge_type VARCHAR,
    amount FLOAT,
    paid FLOAT
);

--Rename the columns 
ALTER TABLE income_data
RENAME COLUMN amount TO income_amount;

ALTER TABLE rent_data
RENAME COLUMN amount TO rent_amount;
			  
--create new table incomerent by joining two tables 
CREATE TABLE incomerent AS(
SELECT inc.user_id,
	inc.income_amount,
	re.rent_amount
FROM income_data AS inc
	INNER JOIN rent_data AS re
	ON (inc.user_id = re.user_id));

--calculate the rent to income ratio.
SELECT user_id , (SUM (rent_amount)/ SUM(income_amount))*100
FROM incomerent
GROUP BY user_id;