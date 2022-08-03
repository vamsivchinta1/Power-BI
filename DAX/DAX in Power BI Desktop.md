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
# Filter Contexts (aka the Calculate Function)
```sql
CALCULATE(<expression>, [[<filter1>], <filter2>]…)
```
## Boolean Expression Filters
```sql
Revenue Red = CALCULATE([Revenue], 'Product'[Color] = "Red")

Revenue Red or Blue = CALCULATE([Revenue], 'Product'[Color] IN {"Red", "Blue"})

Revenue Expensive Products = CALCULATE([Revenue], 'Product'[List Price] > 1000)
```
## Table Expression Filters
```sql
Revenue Red =
CALCULATE(
    [Revenue],
    FILTER(
        'Product',
        'Product'[Color] = "Red"
    )
)

Revenue High Margin Products =
CALCULATE(
    [Revenue],
    FILTER(
        'Product',
        'Product'[List Price] > 'Product'[Standard Cost] * 2
    )
)
```

![image](https://user-images.githubusercontent.com/42124199/182619754-40ca87af-fc5d-455a-8389-ac3b214b85a2.png)
```sql
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
```
![image](https://user-images.githubusercontent.com/42124199/182620506-67d2da5d-72d0-4db4-a715-f6663d6c35ef.png)

```sql   
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
```
# Context Transition
```sql
Customer Segment =
VAR CustomerRevenue = CALCULATE(SUM(Sales[Sales Amount]))
RETURN
    IF(CustomerRevenue < 2500, "Low", "High")
```
