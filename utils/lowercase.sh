for i in "$@";
do
	echo "Lowercasing filename: $i"
	rename -f 'y/A-Z/a-z/' "$i"
	mv -f "$i" `echo "$i" | sed s/[[:space:]]/-/g | sed s/_/-/g | sed s/--/-/g | sed s/--/-/g | tr -d '(' | tr -d ')' | tr -d ','`
done

trash icon- 