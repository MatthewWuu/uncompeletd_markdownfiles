echo "list the shellfiles on current directory"

for shellfile in *.sh
do
	echo "shell file: $shellfile"
done

echo "list the shellfile on the spesific directory"

for shellfile2 in ../*.sh
do
	echo "shell files:$shellfile2"
done

chara=(a b c d e f g)

for cha in ${chara[*]}		#no spaces in the braces;the variable name can be anything
do
	echo "here: $cha"
done

echo "amount of elements in this array:${#chara[*]}"

