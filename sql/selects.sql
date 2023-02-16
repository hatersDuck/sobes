CREATE INDEX idx_IBL_bank_id ON IBL(bank_id);
CREATE INDEX idx_fact_ibl_id ON fact(IBL_id);

SELECT 
    strftime('%m', plan_date) AS month, pl.amount AS plan, SUM(fc.amount) AS fact
FROM  
    plan_ as pl
    LEFT JOIN fact as fc ON strftime('%m', fc.expences_date) = strftime('%m', pl.plan_date) 
    LEFT JOIN IBL ON IBL.id = fc.IBL_id
WHERE 
    pl.bank_id = 1 AND strftime('%Y', pl.plan_date) = '2022' AND IBL.bank_id = 1
GROUP BY month;

SELECT 
    strftime('%m', plan_date) AS month, pl.amount AS plan, SUM(fc.amount) AS fact
FROM  
    plan_ as pl
    LEFT JOIN fact as fc ON strftime('%m', fc.expences_date) = strftime('%m', pl.plan_date) 
    LEFT JOIN IBL ON IBL.id = fc.IBL_id
WHERE 
    pl.bank_id = 2 AND strftime('%Y', pl.plan_date) = '2021' AND IBL.bank_id = 2
GROUP BY month;
