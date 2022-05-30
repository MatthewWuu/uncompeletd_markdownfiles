#nested loop
for number in 1{1..6}
do
	if [[ $number -eq 15 ]]&&[[ $number -gt 11 ]]
	then
		echo "we got 15!"
	fi
	for letter in {a..d}
	do
		echo "number:$number, letter:$letter"
		if [[ $letter = "c" ]] #use "_" to include the string when comparing!!
		then	#need space for "="! or you'll assign the value
			echo "we got c!!"
		fi
	done
	echo	"Outer loop moves forward one stride"
done

echo "finish."
