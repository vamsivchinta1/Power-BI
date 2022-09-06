
![image](https://user-images.githubusercontent.com/42124199/188653902-28f26890-ea4b-48d4-9919-137258f5b180.png)


![image](https://user-images.githubusercontent.com/42124199/188653156-c6785f3f-3e2e-43cb-adaf-a2f95d15172e.png)


```sql
Switcher # of Programs = 
    SWITCH(
        SUMX('Subtable to Switch','Subtable to Switch'[FIlters]),
        1, [(S) # of Programs],
        2, [Total Capacity]
    )
```
![image](https://user-images.githubusercontent.com/42124199/188653522-3c5ee103-4dee-4ff3-9bca-9129ecbf96e0.png)


``` sql
(S) # of Programs = 
    CALCULATE(
        DISTINCTCOUNT(Programs_fact_table[OIN]),
        Programs_fact_table[Program_status] = "OPEN"
    )
    
    
Total Capacity = 
    CALCULATE(
        SUM(Programs_dimension_table[Max_capacity]),
        FILTER(Programs_fact_table, Programs_fact_table[Open] < 2 )
    )
```
