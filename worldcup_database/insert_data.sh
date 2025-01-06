#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals
do
    # Insert winner team into `teams` table if not exists
    $PSQL "INSERT INTO teams (name) VALUES ('$winner') ON CONFLICT (name) DO NOTHING;"
    
    # Insert opponent team into `teams` table if not exists
    $PSQL "INSERT INTO teams (name) VALUES ('$opponent') ON CONFLICT (name) DO NOTHING;"
    
    # Get the team IDs for winner and opponent
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';" | xargs)
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';" | xargs)

    # Check if the game already exists in the `games` table
    game_exists=$($PSQL "SELECT COUNT(*) FROM games WHERE year=$year AND round='$round' AND winner_id=$winner_id AND opponent_id=$opponent_id AND winner_goals=$winner_goals AND opponent_goals=$opponent_goals;" | xargs)
    
    # Insert game data only if it doesn't already exist
    if [ "$game_exists" -eq 0 ]; then
        $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
        VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals);"
    fi
done