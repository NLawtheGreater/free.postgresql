#!/bin/bash
#SECRET=$(shuf -i 1-1000 -n 1)
SECRET=$((1 + RANDOM % 1000))
PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
USER_CHECK=$($PSQL"select * from number where name='$USERNAME'")
USER_ID=$($PSQL"select user_id from number where name='$USERNAME'")
BEST_GAME=$($PSQL"select best_game from number where name='$USERNAME'")

#IFS="|"
#echo "$IFS"
#echo "$USER_CHECK" | IFS="|" read USER_ID USERNAME PLAYED BEST_GAME

#echo -e "$USER_CHECK\n";
#echo "played:$PLAYED  $USER_ID best_game:$BEST_GAME")

PLAYED=$($PSQL "select games_played from number where name ='$USERNAME'")
if [[ ! -z $USER_CHECK ]]
then
	echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST_GAME guesses."
else
	echo "Welcome, $USERNAME! It looks like this is your first time here."
		PLAYED=0
	WAT=$($PSQL"insert into number(name,games_played) values ('$USERNAME',$PLAYED)")
fi

let PLAYED=1+$PLAYED
NUL=$($PSQL"update  number set games_played=$PLAYED where name='$USERNAME'")

TRIES=1
#echo "played:$PLAYED  $USER_ID best_game:$BEST_GAME"

echo "Guess the secret number between 1 and 1000:"
#echo -e "\n$INPUT and $SECRET\n"
while read INPUT
#while  [ $INPUT -ne $SECRET ]
do
if [[ !  "$INPUT" =~ ^[0-9]+$ ]]
then
	echo "That is not an integer, guess again:"
elif [[ $INPUT -gt $SECRET ]]
then
	echo "It's lower than that, guess again:"
elif [[ $INPUT -lt $SECRET ]]
then
	echo "It's higher than that, guess again:"
elif [[ $INPUT -eq $SECRET ]]
then
	if [ -z $BEST  ] || [ $TRIES -lt $BEST ]
	then
		UPDATE=$($PSQL"update number set best_game=$TRIES where name='$USERNAME';")
		echo "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
		break
	else
		echo "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
		break
	fi
fi
let TRIES=$TRIES+1
done
