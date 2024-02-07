library(nycflights13)
library(tidyverse)

# C3.2
# A shorter way to select flights that departed in January or February
# %in% means "is in" or "is one of"
flights |> # used on row, not change the ordinal data
  filter(month %in% c(1, 2))

flights |> # just arrange the data, not change the ordinal data
  arrange(year, month, day, dep_time)

# Remove duplicate rows, if any
flights |>
  distinct()

# Find all unique origin and destination pairs
flights |>
  distinct(origin, dest)

# to keep all columns, instead return just selected columns
# `.keep_all` default is `FALSE`
flights |>
  distinct(origin, dest, .keep_all = TRUE)
# Note that it will just return the first unique one.

flights |>
  count(origin, dest, sort = TRUE)
# The `count` is recommend by the books to count the unique row.
# But even just using `distinct`, the result will also show the tibble 's size

# Exercise 1
# arrival delay for tow or more hours
flights |>
  filter(arr_delay >= 120)
# flew to Houston
flights |>
  filter(dest %in% c("IAH", "HOU"))
# were operated by United, American, or Delta
# use `airlines` to check the carrier
flights |>
  filter(carrier %in% c("UA", "AA", "DL"))
# departed in summer (July, August, and September)
flights |>
  filter(
    month %in% c(7:9),
  )
# arrived more than two hours late, but didn't leave late
flights |>
  filter(arr_delay >= 120, dep_delay <=0)
# were delayed by at least an hour, but made up over 30 minutes in flight
flights |>
  filter(arr_delay >= 60, air_time > 30)

# Exercise 2
# Find the most departure delayed flights
flights |>
  arrange(desc(dep_delay)) |>
  slice_head(n = 1)
# Find the earliest departure flights
flights |>
  arrange(dep_time) |>
  slice_head(n = 5)

# Exercise 3
# Sort flights with time in the air
flights |>
  arrange(arr_time - dep_time)

# Exercise 4
# Was there a flight on every day
flights |>
  distinct(year, month, day) |>
  count() # yes, the result is 365

# Exercise 5
# the farthest flights and the least flights
flights |>
  arrange(distance) |>
  slice_head(n = 1)
flights |>
  arrange(desc(distance)) |>
  slice_head(n = 1)

# Exercise 6
# If want to use `filter` and `arrange` together, the order is matter
# Depending on  specific analysis.
# Generally, if you're filtering a large dataset and only need a subset of rows to be sorted, it's better to filter first to reduce the amount of data being sorted.
# However, if you need to sort the entire dataset and then filter based on specific criteria, arranging first might be more appropriate.
