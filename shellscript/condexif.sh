echo "start the program"

if [[ $1 -gt 1 ]] && [[ $1 -lt 7 ]]
then
	echo "$1 is between 3~7"
elif [[ $1 =~ "Junwei" ]] || [[ $1 =~ "Wu" ]] || [[ $1 =~ "wjw" ]]
then
	echo "$1 is a student/learner/man/leader"
else
	echo "wrong input"
fi

