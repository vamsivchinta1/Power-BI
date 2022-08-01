# Power-BI
Reference information for using PBI to build Reports and Dashboards

# Overview
- 2 Powerful Engines that run PBI
  - Power Query Editor
  - Model Relationships + DAX
  
# Data Modeling in PBI
- Data Tables
  - fact tables that record transactions
  - tall and skinny table structures
    - have lots of rows (millions of rows)
    - tend to not have many columns
  - located at the bottom
- Lookup Tables
  - dimensions tables that describe who, what, where, when, and how
  - located at the top
![image](https://user-images.githubusercontent.com/42124199/181768927-2fca84cd-f4f9-4f6f-8bfe-58157233c31c.png)

# Data Analytics Expressions (DAX)
[DAX Function Reference Guide](https://docs.microsoft.com/en-us/dax/dax-function-reference)
- DAX is a formula language for working with relational data
- DAX includes a library of over 200 functions, operators, and constructs, providing immense flexibility in creating formulas to calculate results for just about any data analysis need.
- Two Types of Measures
  - implicit measures - these are measures auto-created by aggregating columns using PBI's embedded controls
  - explicit measures - these are measures we've created manually using DAX
  - 3 key reasons why you should always use Explicit measures!
    1. Control
    2. Re-Use
    3. Connected Reports
    


# usful links: 
- [Power BI Tutorial From Beginner to Pro](https://www.youtube.com/watch?v=AGrl-H87pRU&t=282)
- [Use DAX in PBI Desktop Training Modules](https://docs.microsoft.com/en-us/learn/paths/dax-power-bi/)
