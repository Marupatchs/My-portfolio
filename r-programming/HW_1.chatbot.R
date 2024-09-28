## Homework
## 1. Chatbot

df_pizza <- data.frame(pizza_id,pizza_menu,pizza_price)
pizza_id <- 1:4
pizza_menu <- c("Hawaiian pizza",
          "Double cheese pizza",
          "Spicy BBQ pizza",
          "Parma ham pizza")
pizza_price <- c(25, 30 ,35, 40)

df_drink <- data.frame(drink_id,drink_menu,drink_price)
drink_id <- 1:3
drink_menu <- c("Water",
           "Coke",
           "Thai tea")
drink_price <- c(5, 10, 15)


pizzeria <- function() {
  print("Hello welcome to pizzeria restaurant!")
  welcome <- readline("Would you like to order now?(yes/no): ")
  if (welcome == "yes") {
    print("This's our pizza")
    print(df_pizza)
    or_pizza <- readline("select your pizza: ")
    if (or_pizza %in% pizza_menu) {
      print("And this's our drink")
      print(df_drink)
    } else {
      print("Not in our order, Please try again")
      break
    }
    
    or_drink <- readline("select your drink:")
    if (or_drink %in% drink_menu) {
      print("This's good chioces")
    } else {
      print("Not in our order, Please try again")
      break
    }
    
    confirm <- readline("Do you want to confirm your order?(yes/no): ")
    if (confirm == "yes") {
      if (or_pizza %in% df_pizza$pizza_menu) {
        pizza_p <- df_pizza[df_pizza$pizza_menu == or_pizza,"pizza_price"]
      }
      if (or_drink %in% df_drink$drink_menu) {
        drink_p <- df_drink[df_drink$drink_menu == or_drink, "drink_price"]
      }
      total_price <- pizza_p + drink_p
      print(paste("Total price: ", total_price))
      print("Thank you for using our service, please come back again")
    } else {
      print("We hope to serve you again")
      break
    }
    
  } else {
    print("We hope to serve you again")
  }
} 








