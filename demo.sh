#!/bin/bash

# This is the project of Course SKR3307 Shell Programming
# Group members are:
# 1. Wen Yu 199657
# 2. Wang Yida 201406
# 3. Ma Zhiyuan 201464
# 4. ZHOU LINGPEI(201357)

# ----------------------------------------------PROGRAMMING SECTION------------------------------------------------------

# title_printing: print the title of the project

function bigTitle(){
echo "
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
  
 echo -e -n " Please Enter Your Choice: " 
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
  0 ) exitProgram; clear
   ;; 
  * ) echo "Invalid Choice !" 
   sleep 2 
   clear 
   ;; 
 esac 
done
}

# Modify with VIM editor 
function editList() 
{ 
 vim ./studentList.txt
} 
 
# Screen Help Function  
function showInfo() 
{ 
 clear 
 echo "This is the project of Course SKR3307 Shell Programming
Group members are:
1. Wen Yu 199657
2. Wang Yida 201406
3. Ma Zhiyuan 201464
4. Zhou Lingpei 201357" 
} 
 
# Exit
function exitProgram() 
{ 
 clear 
 exit 
}

# insertStudent: add new student info to the list
function insertStudent()
{
 clear
 echo "Enter NAME and METRIC number."
 echo -e "\c"

 if [ ! -f ./studentList.txt ]; then
  touch studentList.txt
 fi

 read NEW
 echo "$NEW" >> ./studentList.txt

 sort -o ./studentList.txt ./studentList.txt
 echo "Successful"
 sleep 2
}

# Delete a person in student list
function deleteStudent() { 
 clear 
 echo -e "Please input the NAME >>> " 
 read NAME 
 
 if [ ! -f ./studentList.txt ]; then 
 echo "List is empty, Please add it first. " 
 else 
  cp studentList.txt studentList.bak 
 
  grep "$NAME" ./studentList.bak > /dev/null 
  if [ $? != 0 ]; then 
  echo: "This person not exist." 
  else 
 grep -v "$NAME" ./studentList.bak > studentList.txt 
 echo "Already DELETE it successfully" 
  fi 
  rm -f studentList.bak 
 fi 
 sleep 1 
}
 
# Display the student list
function showList() {
  clear
  echo -e "\n\nThe information is: $NAME \n"
  awk '{print NR " - " $0}' ./studentList.txt
  echo -e "\n\n\n"
  read -n 1 -s -r -p "Press any key to continue"
  clear
}

# find function 
function findStudent()
{
 clear
 echo -e "Please Enter NAME >>> "
 read STUDENT
 # If there is no student
 if [ ! -f ./studentList.txt ]; then
  echo "List is empty, Please add it first! "
  sleep 2
  clear
  return
 fi
 # When no name is entered.
 if [ -z "$STUDENT" ]; then
  echo "You didn't enter a name!"
  echo -e "Please Enter NAME >>> "
 fi
 echo -e "\n\nThe information is: \n"

 grep "$STUDENT" ./studentList.txt > ./temp
 awk '{print NR " - " $0}' ./temp
 rm -f ./temp

 case "$?" in
  1 ) echo "No this student."
   ;;
  2 ) echo "You didn't enter any student."
   sleep 2
   findStudent
   ;;
 esac

 echo -e "\n\n\n"
 read -n 1 -s -r -p "Press any key to continue"
 clear
}

# Run
main
