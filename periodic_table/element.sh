#!/bin/bash

if [[ -z $1  ]]
then
	echo "Please provide an element as an argument."
else
PSQL="psql -X -U freecodecamp -d periodic_table --tuples-only -c"
if [[ $1 =~ ^[0-9]+$ ]] 
then 
	NUMBER=$1
	ELEMENT="null"
else
	NUMBER=0
	ELEMENT=$1
fi
ELEMENT_RESULT=$($PSQL"select * from properties inner join elements using(atomic_number) inner join types using(type_id)  where atomic_number=$NUMBER OR symbol='$ELEMENT' OR name='$ELEMENT'")
if [[ -z $ELEMENT_RESULT ]]
then
	echo "I could not find that element in the database."
else
	echo "$ELEMENT_RESULT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR SYMBOL BAR NAME BAR TYPE
do
	echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
fi
fi
