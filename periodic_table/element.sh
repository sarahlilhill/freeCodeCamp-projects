#!/bin/bash

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"

if [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")
fi

if [[ -z $ATOMIC_NUMBER ]]
then
  echo "I could not find that element in the database."
  exit
fi

ELEMENT_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) LEFT JOIN types USING (type_id) WHERE atomic_number = $ATOMIC_NUMBER")
echo $ELEMENT_DATA | while read NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MP BAR BP
do
  echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
done
