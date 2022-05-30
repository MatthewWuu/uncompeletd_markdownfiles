date|egrep "[Tus]"
if [[ $? -eq 0 ]] #detect if the last cmd succeed or not
then
	echo "THANKS Moses!"
else
	echo "Fuckyou!"
fi

