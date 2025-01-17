#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
SERVICE_NAME

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?"

MAIN_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1) $SERVICE_NAME"
    fi

    echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
    read SERVICE_ID_SELECTED

    case $SERVICE_ID_SELECTED in
        1) SERVICE_NAME='cut' APPOINTMENT_MENU ;;
        2) SERVICE_NAME='color' APPOINTMENT_MENU ;;
        3) SERVICE_NAME='perm' APPOINTMENT_MENU ;;
        4) SERVICE_NAME='style' APPOINTMENT_MENU ;;
        5) SERVICE_NAME='trim' APPOINTMENT_MENU ;;
        *) MAIN_MENU "I could not find that service. What would you like today?"
    esac
    
}

APPOINTMENT_MENU(){
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
        # get new customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # insert new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    fi

    # get time info
    echo -e "\nWhat time would you like your color, $CUSTOMER_NAME?"
    read SERVICE_TIME
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # get service_id
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$SERVICE_NAME'")
    # insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID', '$SERVICE_TIME')")
    echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        
}

MAIN_MENU
