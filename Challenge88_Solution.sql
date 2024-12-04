
WITH unpivoted AS (
    SELECT 
        `Transaction Number`, 
        Item_Number_1 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_2 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_3 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_4 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_5 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_6 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_7 AS Item FROM challenge88
    UNION ALL
    SELECT 
        `Transaction Number`, 
        Item_Number_8 AS Item FROM challenge88
),
normalized_transactions AS (
    SELECT 
        `Transaction Number`,
        GROUP_CONCAT(Item ORDER BY Item ASC) AS sorted_items
    FROM unpivoted
    WHERE Item IS NOT NULL 
    GROUP BY `Transaction Number`
)

SELECT 
    COUNT(DISTINCT sorted_items) AS Number_of_Combinations
FROM normalized_transactions;
