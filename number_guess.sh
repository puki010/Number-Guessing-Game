#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"
RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo -e "\nEnter your username:"
read USER_NAME
USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username LIKE '$USER_NAME'")

if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO usernames(username) VALUES('$USER_NAME')")
  USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username LIKE '$USER_NAME'")
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id, games_played, best_game) VALUES($USER_ID, 0, 1000)")
else
  USER_SELECT=$($PSQL "SELECT games_played, best_game FROM usernames FULL JOIN games USING(user_id) WHERE user_id = $USER_ID")
  echo $USER_SELECT | while IFS='|' read GP BG
  do
    echo -e "\nWelcome back, $USER_NAME! You have played $GP games, and your best game took $BG guesses."
  done
fi

echo -e "\nGuess the secret number between 1 and 1000:"
echo $RANDOM_NUMBER
read GUSSED_NUMBER
GAME_PLAYED=0
while [[ ! $RANDOM_NUMBER == $GUSSED_NUMBER ]]
do
if [[ ! $GUSSED_NUMBER =~ ^[0-9]+$ ]]
then
  echo -e "\nThat is not an integer, guess again:"
  read GUSSED_NUMBER
elif [[ $RANDOM_NUMBER -lt $GUSSED_NUMBER ]]
then
  echo -e "\nIt's lower than that, guess again:"
  read GUSSED_NUMBER
else
  echo -e "\nIt's higher than that, guess again:"
  read GUSSED_NUMBER
fi
GAME_PLAYED=$(($GAME_PLAYED + 1))
done
GAME_PLAYED=$(($GAME_PLAYED + 1))
echo -e "\nYou guessed it in $GAME_PLAYED tries. The secret number was $GUSSED_NUMBER. Nice job!"

#Updating the database based on the user info while gaming so far
USER_SELECT=$($PSQL "SELECT games_played, best_game FROM games WHERE user_id = $USER_ID")
echo $USER_SELECT | while IFS='|' read GP BG
do
  GAMES_PLAYED=$(($GP + 1))
  UPDATE_GAMES=$($PSQL "UPDATE games SET games_played = $GAMES_PLAYED WHERE user_id = $USER_ID")
  if [[ $GAME_PLAYED -lt $BG ]]
  then
  UPDATE_BEST=$($PSQL "UPDATE games SET best_game = $GAME_PLAYED WHERE user_id = $USER_ID")
  fi
done
