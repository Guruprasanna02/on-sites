#!/bin/bash

while IFS= read -r line || [ -n "$line" ];
do
	echo $line > temp.txt
	col1=`awk -F"," '{print $1}' temp.txt`
	col2=`awk -F"," '{print $2}' temp.txt`
	col3=`awk -F"," '{print $3}' temp.txt`
        awk -v col1="$col1" -v col2="$col2" -v col3="$col3" -F"," 'col2==$1 {print col1","col2","col3","$2}' file2.txt >> partial.txt
done < file1.txt

while IFS= read -r line || [ -n "$line" ];
do
	echo $line > temp.txt
	col1=`awk -F"," '{print $1}' temp.txt`
        col2=`awk -F"," '{print $2}' temp.txt`
        col3=`awk -F"," '{print $3}' temp.txt`
	awk -v col1="$col1" -v col2="$col2" -v col3="$col3" -F"," 'col2==$3 {print $1","$2","$3","$4","col1","col3}' partial.txt >> final.txt
done < file3.txt

rm -r partial.txt
rm -r temp.txt
