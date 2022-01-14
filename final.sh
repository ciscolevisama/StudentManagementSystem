#!/bin/bash

# This is the project of Course SKR3307 Shell Programming
# Group members are:
# 1. Wen Yu 199657
# 2. Wang Yida 201406
# 3. Ma Zhiyuan 201464
# 4. ZHOU LINGPEI(201357)

# ----------------------------------------------PROGRAMMING SECTION------------------------------------------------------

# Color variable: additional attributes

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'

# /////

# title_printing: print the title of the project

function bigTitle(){
echo -e "${GREEN}
   ______          __         __                    
  / __/ /___ _____/ /__ ___  / /_                   
 _\ \/ __/ // / _  / -_) _ \/ __/                   
/___/\__/\_,_/\_,_/\__/_//_/\__/                 __ 
  /  |/  /__ ____  ___ ____ ____ __ _  ___ ___  / /_
 / /|_/ / _ \`/ _ \/ _ \`/ _ \`/ -_)  ' \/ -_) _ \/ __/
/_/__/_/\_,_/_//_/\_,_/\_, /\__/_/_/_/\__/_//_/\__/ 
  / __/_ _____ / /____/___/                         
 _\ \/ // (_-</ __/ -_)  ' \                        
/___/\_, /___/\__/\__/_/_/_/                        
    /___/                                           
"
}

# main function: the entrance of the system
function main(){
clear 
while : 
do 
 echo "" 
 bigTitle
 echo "" 
 echo "1. FIND STUDENT" 
 echo "2. INSERT STUDENT" 
 echo "3. REMOVE STUDENT" 
 echo "4. SHOW LIST" 
 echo "5. EDIT LIST" 
 echo "6: INFORMATION" 
 echo "0: EXIT PROGRAM" 
 echo "" 
  
 echo -e -n "Please Enter Your Choice: ${NC}" 
 read choice 
 
 case $choice in 
  1 ) findStudent;  
   ;; 
  2 ) insertStudent; clear 
   ;; 
  3 ) deleteStudent; clear 
   ;; 
  4 ) showList;  
   ;; 
  5 ) editList; clear 
   ;; 
  6 ) showInfo;  
   ;;
  7 ) editList2; clear  
   ;;
  0 ) exitProgram; clear
   ;; 
  * ) echo -e "${RED}Invalid Choice !${NC}" 
   sleep 1
   clear 
   ;; 
 esac 
done
}

# Edit with VIM editor 
function editList() { 
 
}

# Edit with command
function editList2(){
 clear
 echo -e "${BLUE}\n\nThe information is: $NAME \n${NC}"
 cat ./studentList.txt
 echo -e "${BLUE}\nInput the NAME of the student you want to edit: ${YELLOW}"
 read NAME
 if [ "$NAME" = "" ]; then
  echo -e "${RED}Invalid Input${NC}"
  sleep 2
  return 0
  else
   GET=`grep "$NAME" ./studentList.txt`
   if [ -n "$GET" ]; then
    grep -v "$NAME" ./studentList.txt > ./temp
    mv ./temp ./studentList.txt
    rm -f ./temp
    echo -e "${Blue}Enter the new record${NC}"
    insertStudent
   else
    echo -e "${RED}Student${YELLOW} ${NAME} ${RED}was not found ${NC}"
   fi
 fi
 echo -e "\n\n\n"
 read -n 1 -s -r -p "Press any key to continue"
 clear
}
 
# Screen Help Function  
function showInfo() { 
 
} 
 
# Exit
function exitProgram() { 
 clear 
 exit 
}

# insertStudent: add new student info to the list
function insertStudent(){
clear
 echo "Enter name and mark."
 echo -e "\c"

 if [ ! -f ./studentlist ]; then
  touch studentlist
 fi

 read NWE
 echo "$NEW" >> ./studentlist

 sort -o ./studntlist ./studentlist
 echo "Successful"
 sleep 2
 
}

# Delete a person in student list
function deleteStudent() { 
 
}
 
# Display the student list
function showList() {
  
}

# find function 
function findStudent(){
clear
 echo -e "Please Enter Name >>>\c"
 read STUDENT
# If there is no student
 if [ ! -f ./studentList.txt ]; then
  echo "You mush enter marks !"
  sleep 2
  clear
  return
 fi
 # When no name is entered.
 if [ -z "$STUDENT" ]; then
  echo "You didn't enter a name!"
  echo -e "Please Enter Name >>>\c"
 fi
 echo "The information is: $NAME"


 grep "$STUDENT" ./studentList.txt 2> /dev/null

 case "$?" in
  1 ) echo "No this student."
   ;;
 2 ) echo "You didn't enter any student."
   sleep 2
   find # Continue querying 
   ;;
 esac
 
}

# Run
main
