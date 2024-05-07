#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#$($PSQL "\\c worldcup")
#$($PSQL "create table teams(team_id SERIAL PRIMARY KEY, name varchar(50) not null unique), games(game_id SERIAL primary key, year INT not null, round varchar(15) not null, winner_goals int not null, opponent_goals int not null, winner_id int not null, opponent_id int not null, constraint foreign key(opponent_id) references teams(team_id), constraint foreign key(winner_id) references teams(team_id));")

echo $($PSQL "TRUNCATE TABLE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINNER_G OPPONENT_G  


do
	if [[ $WINNER != "winner"  ]] && [[ $YEAR != year ]];
	then
		#Check if 
   #Add Winner And Oppoonent to teams
	      echo $WINNER
	      echo $($PSQL "insert into teams(name) values('$WINNER');")
	      echo $OPPO
	      echo $($PSQL "insert into teams(name) values('$OPPO');")
		
	fi
done	
		
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINNER_G OPPONENT_G  
do
	if [[ $WINNER != "winner" ]]
	then
		#get winner_id
		
	WINNER_ID=$($PSQL "SELECT team_id FROM teams where name='$WINNER';")
		#get opponent_id
		OPPO_ID=$($PSQL "SELECT team_id FROM teams where name='$OPPO';")
		#if not found
		#insert each column
		echo $($PSQL "INSERT into games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) values ($YEAR,'$ROUND',$WINNER_G,$OPPONENT_G,$WINNER_ID,$OPPO_ID);")
	fi
done
