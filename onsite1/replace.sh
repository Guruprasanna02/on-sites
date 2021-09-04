#!/bin/bash

if [[ "$1" == "name" ]]
then
	while IFS=',' read -r name  employeeId phone salaries email year
	do
		if [[ "\"$2"\" == "$name" ]]
		then
			echo \""$3"\","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
		else
			echo "$name","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
        	fi
	done < final.txt

elif [[ "$1" == "employeeId" ]]
then
	while IFS=',' read -r name  employeeId phone salaries email year
        do
                if [[ "$2" == "$employeeId" ]]
		then
                        echo "$name","$3","$phone","$salaries","$email","$year" >> replace.txt
                else
                        echo "$name","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
        	fi
        done < final.txt

elif [[ "$1" == "phone" ]]
then
	while IFS=',' read -r name  employeeId phone salaries email year
        do
                if [[ "$2" == "$phone" ]]
		then
                        echo "$name","$employeeId","$3","$salaries","$email","$year" >> replace.txt
                else
                        echo "$name","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
                fi

        done < final.txt

elif [[ "$1" == "salaries" ]]
then
	while IFS=',' read -r name  employeeId phone salaries email year
        do
                if [[ "$2" == "$salaries" ]]
		then
                        echo "$name","$employeeId","$phone","$3","$email","$year" >> replace.txt
                else
                        echo "$name","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
                fi

        done < final.txt

elif [[ "$1" == "email" ]]
then
	while IFS=',' read -r name  employeeId phone salaries email year
        do
                if [[ \""$2"\" == "$email" ]]
                then
                        echo "$name","$employeeId","$phone","$salaries",\""$3"\","$year" >> replace.txt
                else
                        echo "$name","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
                fi

        done < final.txt

else
	while IFS=',' read -r name  employeeId phone salaries email year
        do
                if [[ "$2" == "$year" ]]
                then
                        echo "$name","$employeeId","$phone","$salaries","$email","$3" >> replace.txt
                else
                        echo "$name","$employeeId","$phone","$salaries","$email","$year" >> replace.txt
                fi
        done < final.txt

fi



