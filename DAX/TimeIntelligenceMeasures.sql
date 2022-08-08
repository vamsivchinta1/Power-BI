YTD Total Sales = TOTALYTD 
( 
    SUM('Sales OrderDetails'[Total Price]) 
    , Dates[Date]
)

Total Sales Previous Month = CALCULATE
(
    sum('Sales OrderDetails'[Total Price])
    , PREVIOUSMONTH(Dates[Date])
)
