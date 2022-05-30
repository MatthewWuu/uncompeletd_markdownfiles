function addsequence {
	local sum=0 	#use local keyword

	for element in $@
	do
		let sum=$sum+$element
	done

	echo "The sum is:$sum, the amount of arguments is:$#"
}
