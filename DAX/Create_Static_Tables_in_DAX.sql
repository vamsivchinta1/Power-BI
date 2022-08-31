# calculated table with the union of different rows
Segments_UnionRows =
UNION (
    ROW ( "Price Range", "Low", "Min Price", CURRENCY ( 0 ), "Max Price", CURRENCY ( 10 ) ),
    ROW ( "Price Range", "Medium", "Min Price", 10, "Max Price", 100 ),
    ROW ( "Price Range", "High", "Min Price", 100, "Max Price", 9999999 )
)

# A better alternative is the new DATATABLE function
Segments_Datatable =
  DATATABLE (
      "Price Range", STRING,
      "Min Price", CURRENCY,
      "Max Price", CURRENCY,
      {
          { "Low", 0, 10 },
          { "Medium", 10, 100 },
          { "High", 100, 9999999 }
      }
  )
