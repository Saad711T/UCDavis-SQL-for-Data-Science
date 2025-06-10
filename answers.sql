-- first query
SELECT SUM(Value) FROM milk_production WHERE Year = 2023;

-- second query
SELECT State_ANSI FROM cheese_production WHERE Year = 2023 AND Period = 'APR' AND Value > 100000000;

-- third query
SELECT Year, SUM(Value) FROM coffee_production GROUP BY Year;

-- fourth query
SELECT AVG(Value) FROM honey_production WHERE Year = 2022;

-- fifth query
SELECT * FROM state_lookup;

-- sixth query

-- seventh query
SELECT SUM(y.Value)
FROM yogurt_production y
WHERE y.Year = 2022 AND y.State_ANSI IN (
    SELECT DISTINCT c.State_ANSI FROM cheese_production c WHERE c.Year = 2023);

-- eighth query
SELECT s.State
FROM state_lookup s
LEFT JOIN milk_production m ON s.State_ANSI = m.State_ANSI AND m.Year = 2023
WHERE m.State_ANSI IS NULL;

-- ninth query
SELECT s.State, c.Value
FROM state_lookup s
LEFT JOIN cheese_production c ON s.State_ANSI = c.State_ANSI AND c.Year = 2023 AND c.Period = 'APR';

-- tenth query
SELECT AVG(c.Value)
FROM coffee_production c
WHERE c.Year IN (
    SELECT h.Year FROM honey_production h WHERE h.Value > 1000000
);
