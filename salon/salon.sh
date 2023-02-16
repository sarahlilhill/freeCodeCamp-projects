#!/bin/bash

PSQL="psql -X -q --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~Welcome to the Virtual Barbershop! ~~\n"

MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #get & list services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo -e "What service would you like to book?"
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  #request selection, check valid
  read SERVICE_ID_SELECTED
  if [[ -z $($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED") ]]
  then
    MENU "Invalid Service Selection, please try again..."
  #if valid get phone number
  else
    SELECTED_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo -e "Please enter your phone number:"
    read CUSTOMER_PHONE
    #check if already in database, add if not
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "No previous record found, please enter your name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #get appointment time
    echo -e "What time would you like your $(echo $SELECTED_SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
    read SERVICE_TIME
    #insert into appointments table
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $(echo $SELECTED_SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  fi
}

MENU
