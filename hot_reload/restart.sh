#!/bin/bash

files=()


echo Carry on with your work.... Container will be restarted automatically on a change!
unset files

lastMod=()
unset lastMod
for entry in login.local/*
do
  files+=("${entry}")
  lastMod+=($(ls --time-style=+%H%M%s%N -l ${entry} | awk "{print(\$6)}"))
done

for entry in login.local/src/*
do
  files+=("${entry}")
  lastMod+=($(ls --time-style=+%H%M%s%N -l ${entry} | awk "{print(\$6)}"))
done

newMod=()
while(true)
do
    unset newMod
    for entry in login.local/*
    do
        newMod+=($(ls --time-style=+%H%M%s%N -l ${entry} | awk "{print(\$6)}"))
    done
    for entry in login.local/src/*
    do
        newMod+=($(ls --time-style=+%H%M%s%N -l ${entry} | awk "{print(\$6)}"))
    done

    for ((i=0; i<${#files[@]}; i++))
    do    
        if [ "${lastMod[i]}" != "${newMod[i]}" ]
        then    
            echo "Change detected, Restarting docker container..."
            cd login.local
            docker-compose build
            docker-compose up -d
            cd ..
            unset lastMod
            for ((j=0; j<${#files[@]}; j++))
            do     
                lastMod+=("${newMod[j]}")   
            done         
        fi
    done

sleep 5s
done
