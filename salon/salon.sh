#!/bin/bash
PSQL="psql -X -U freecodecamp -d salon -t -c"
#echo $($PSQL"TRUNCATE services, appointments, customers")
#display numbered list of services
SELECT_SERVICE() {
AVAILABLE_SERVICES=$($PSQL"select * from services") 
echo "$AVAILABLE_SERVICES" | while read ID BAR NAME 
do
	if [[  $NAME != "name" ]]
	then
	echo "$ID) $NAME"
	fi
done
#prompt for service
echo -e "\nPlease select service."
read SERVICE_ID_SELECTED

SERVICE_SELECTED=$($PSQL"SELECT name from services where service_id=$SERVICE_ID_SELECTED")


if [[ -z "$SERVICE_SELECTED" ]]
then
	SELECT_SERVICE "Service does not exist. Please reselect service."
else
	echo -e "\nPlease enter your phone."
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL"select customer_id from customers where phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
	echo -e "\nPlease enter your name."
	read CUSTOMER_NAME
	CUSTOMER_ENTRY=$($PSQL"insert into customers(phone, name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
	#get customer id
	CUSTOMER_ID=$($PSQL"select customer_id from customers where phone='$CUSTOMER_PHONE'")
fi
echo -e "\nPlease select service time."
read SERVICE_TIME
#if service doesn't exist
	APPOINTMENT_RESULT=$($PSQL"insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
	echo "I have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
fi	
}
SELECT_SERVICE
