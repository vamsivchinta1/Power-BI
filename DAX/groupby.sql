EVALUATE
SUMMARIZECOLUMNS (
    'Product'[Brand],                             -- Groups by Brand
    'Date'[Year],                                 -- Groups by Year
    "Sales Amount",                               -- Adds a new column named Sales Amount
        SUMX (                                    -- Starts an iteration, inside a filter context
            Sales,                                -- Iterates sales of the given brand and year
            Sales[Quantity] * Sales[Net Price]    -- Multiplication, executed in the row context
        )                                         -- After SUMX there is no longer a row context
)
