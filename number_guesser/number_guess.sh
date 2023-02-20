#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -q --no-align -c"
echo -e "\n~~ Welcome to the Number Guessing Game!\n"
echo -e "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT guesser_id FROM guesser WHERE username = '$USERNAME'")

#if new user add to DB else get stats
if [[ -z $USER_ID ]]
then
  $PSQL "INSERT INTO guesser(username) VALUES('$USERNAME')"
  USER_ID=$($PSQL "SELECT guesser_id FROM guesser WHERE username = '$USERNAME'")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM guesser WHERE guesser_id = $USER_ID")
  BEST_SCORE=$($PSQL "SELECT best_score FROM guesser WHERE guesser_id = $USER_ID")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_SCORE guesses."
fi

#random number generation
TARGET=$(( $RANDOM % 1000  + 1 ))
NUMBER_GUESSES=0

#deal with each guess
HANDLE_GUESS() {
  read GUESS
  #not an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    HANDLE_GUESS
  else
    #too low
    if (( $GUESS < $TARGET ))
    then
      echo -e "\nIt's higher than that, guess again:"
      ((NUMBER_GUESSES++))
      HANDLE_GUESS
    fi
    #too high
    if (( $GUESS > $TARGET ))
    then
      echo -e "\nIt's lower than that, guess again:"
      ((NUMBER_GUESSES++))
      HANDLE_GUESS
    fi
    #winner winner chicken dinner
    if (( $GUESS == $TARGET ))
    then
      ((NUMBER_GUESSES++))
      echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $TARGET. Nice job!"
      #update DB
      $PSQL "UPDATE guesser SET games_played = games_played + 1 WHERE guesser_id = $USER_ID"
      if [[ -z $BEST_SCORE ]] || (( $NUMBER_GUESSES < $BEST_SCORE ))
      then
        $PSQL "UPDATE guesser SET best_score = $NUMBER_GUESSES WHERE guesser_id = $USER_ID"
      fi
      exit
    fi
  fi
}

echo -e "Guess the secret number between 1 and 1000:"
HANDLE_GUESS
