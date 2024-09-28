## Let's see my data transformation portfolio

## Let's see below

## resturant

## load libraries
library(tidyverse)
library(RSQLite)

## create connect
con <- dbConnect(SQLite(), "resturant.db")

## create dataframe for database
# staff table
staff <- data.frame(
  staff_id = 1:3,
  staff_name = c("Maruko", "Anx", "Ploy"),
  position = c("Manager", "Server", "Server"),
  salary = c(50000, 48000, 48000)
)

# menu table
menu <- data.frame(
  menu_id = 1:9,
  menu_name = c("Hawaiian pizza", "Double cheese pizza", "Spicy BBQ pizza", "Corn Soup", "Masharoom Soup", "French fries", "Onion rings", "Watermelon", "Coke"),
  category = c("Pizza", "Pizza", "Pizza", "Soup", "Soup", "Side dish", "Side dish", "Drink", "Drink"),
  price = c(100, 120, 120, 50, 60, 75, 80, 55, 35)
)

# membership table
membership <- data.frame(
  membership_id = 1:13,
  membership_name = c("DK", "Dino", "Mingyu", "The 8", "Jeonghan", "Hoshi", "Jun", "Wonwoo", "Vernon", "S.coups", "Joshua", "Seungkwan", "Woozi"),
  age = c(36, 13, 27, 21, 45, 18, 25, 28, 34, 51, 49, 23, 42),
  discount = c(8, 10, 8, 5, 8, 5, 10, 10, 5, 8, 5, 5, 8),
  country = c("South Korea", "South Korea", "Thailand", "China", "South Korea", "South Korea", "China", "South Korea", "USA", "South Korea", "USA", "South Korea", "South Korea")
)

# order_detail table
order_detail <- data.frame(
  order_id = 1:13,
  membership_id = c(4, 1, 8, 9, 10, 7, 11, 12, 6, 5, 2, 13, 3),
  order_date = c("2022-12-01", "2022-12-02", "2022-12-03", "2022-12-04", "2022-12-05", "2022-12-06", "2022-12-07", "2022-12-08", "2022-12-09", "2022-12-10", "2022-12-11", "2022-12-12", "2022-12-13"),
  total_price = c(135, 155, 120, 125, 60, 75, 350, 155, 240, 100, 120, 180, 510),
  staff_id = c(2, 2, 3, 1, 1, 3 ,1 , 2, 2, 1, 1, 3, 3)
)

## write table into a database
dbWriteTable(con, "staff", staff)
dbWriteTable(con, "menu", menu)
dbWriteTable(con, "membership", membership)
dbWriteTable(con, "order_detail", order_detail)

## get data from a database
dbGetQuery(con, "select * from staff")
dbGetQuery(con, "select * from menu")
dbGetQuery(con, "select * from membership")
dbGetQuery(con, "select * from order_detail")

## disconnect database
dbDisconnect(con)

