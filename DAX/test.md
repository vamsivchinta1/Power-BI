# Iterator Functions
the following two measure definitions will produce the same result with the same performance.
```sql
// Single-column summarization function
Revenue = SUM(Sales[Sales Amount])

// iterator function
Revenue =
SUMX(
    Sales,
    Sales[Sales Amount]
)
```


// 
Revenue Red = CALCULATE([Revenue], 'Product'[Color] = "Red")

Revenue Red or Blue = CALCULATE([Revenue], 'Product'[Color] IN {"Red", "Blue"})

Revenue Expensive Products = CALCULATE([Revenue], 'Product'[List Price] > 1000)

Revenue High Margin Products =
CALCULATE(
    [Revenue],
    FILTER(
        'Product',
        'Product'[List Price] > 'Product'[Standard Cost] * 2
    )
)

// for reference
// CALCULATE(<expression>, [[<filter1>], <filter2>]…)


// Filter Modifier Functions ---------------------------
Revenue % Total Region =
    VAR CurrentRegionRevenue = [Revenue]
    VAR TotalRegionRevenue =
        CALCULATE(
            [Revenue],
            REMOVEFILTERS('Sales Territory')
        )
    RETURN
        DIVIDE(
            CurrentRegionRevenue,
            TotalRegionRevenue
        )
    
Revenue % Total Country =
    VAR CurrentRegionRevenue = [Revenue]
    VAR TotalCountryRevenue =
        CALCULATE(
            [Revenue],
            REMOVEFILTERS('Sales Territory'[Region])
        )
    RETURN
        DIVIDE(
            CurrentRegionRevenue,
            TotalCountryRevenue
        )
//-----------------------------------------------------------
Revenue % Total Group =
VAR CurrentRegionRevenue = [Revenue]
VAR TotalGroupRevenue =
    CALCULATE(
        [Revenue],
        REMOVEFILTERS(
            'Sales Territory'[Region],
            'Sales Territory'[Country]
        )
    )
RETURN
    DIVIDE(
        CurrentRegionRevenue,
        TotalGroupRevenue
    )
    
Revenue % Total Country =
VAR CurrentRegionRevenue = [Revenue]
VAR TotalCountryRevenue =
    CALCULATE(
        [Revenue],
        REMOVEFILTERS('Sales Territory'[Region])
    )
RETURN
    IF(
        ISINSCOPE('Sales Territory'[Region]),
        DIVIDE(
            CurrentRegionRevenue,
            TotalCountryRevenue
        )
    )
//-----------------------------------------------------------