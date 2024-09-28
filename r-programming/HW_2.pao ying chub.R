## Homework
## 2. pao ying chub

round_game <- 1
rpc <- c("rock", "paper", "scissors")
player_score <- 0
computer_score <- 0

rpc_game <- function() {
  print("Welcome to Rock-Paper-Scissors Game!!")
  print("You can choose your Rock-Paper-Scissors to beat me!")
  ayr <- readline("Are you Ready?(y/n):")
  if (ayr == "y") {
    print ("Let's start")
  } else {
    print ("Until next time!")
    break
  }
  
  while (round_game <= 10) {
    print(paste ("Round", round_game))
    player_turn <- readline("Your turn!: ")
    com_turn <- sample(rpc, 1)
    print(paste("Computer turn: ", com_turn))
    if (player_turn == com_turn) {
      print("IT's tie!")
    } else if (player_turn == "rock" && com_turn == "scissors" ||
              player_turn == "paper" && com_turn == "rock"     ||
              player_turn == "scissors" && com_turn == "paper" ) {
      print("You're here to WIN!")
      player_score <- player_score + 1
    } else {
      print("You lose")
      computer_score <- computer_score + 1
    }
  
    round_game = round_game + 1
  }
  
  print("Final Score is")
  if (player_score > computer_score) {
    print("You're WIN!")
    print("Winer Winer Chicken Dinner!")
  } else {
    print("Computer is Win!")
  }
  
  again <- readline("Do you want to play again?(y/n): ")
  if (again == "y") {
    rpc_game()
  }
}

