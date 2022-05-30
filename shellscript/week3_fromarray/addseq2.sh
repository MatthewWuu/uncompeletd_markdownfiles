function addseq2 {
	sum=0

	for element in $@
	do
		let sum=$sum+$element
	done

	echo "the sum of this sequence is $sum"
}
