rename -f 'y/A-Z/a-z/' *

for i in *;
do
	mv "$i" `echo "$i" | sed s/[[:space:]]/-/g | sed s/_/-/g | sed s/--/-/g | sed s/--/-/g | tr -d '(' | tr -d ')' | tr -d ','`
done

trash icon- 