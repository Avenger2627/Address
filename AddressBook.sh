#!/bin/bash -x
echo "welcome to adress book"
declare -A address
echo "maximum slots is 10"
for ((i=0;i<10;i++))
do
address[$i,0]=" "
done
function Address(){

        read -p "Enter First name: " Firstname
        address[$1,0]=$Firstname
         read -p "Enter Last name: " Lastname
        address[$1,1]=$Lastname
         read -p "Enter Contact Number: " Mobnum
        address[$1,2]=$Mobnum
        read -p "Enter City: " city
        address[$1,3]=$city
         read -p "Enter State: " state
        address[$1,4]=$state
         read -p "Enter pin: " pin
        address[$1,5]=$pin
}
function display()
{
count=1
for ((i=0;i<=5;i++))
do
echo "Slot:$count"
	((count++))
	for ((j=0;j<=6;j++)) do
        echo  ${address[$i,$j]}
    done
done

}
function insert()
{

count=0
stop=$1
empty=" "
for ((i=0;i<=10;i++))
do
if [[ " ${address[$i,0]} " =~ " $empty " ]]
then
        Address $i
        ((count++))
        echo "next"
else
        continue
fi
if [ $count -eq $stop ]
then
        break
fi
done
}
#existing Address
address[0,0]=Imran 
address[0,1]=Shaikh
address[0,2]=9089765478
address[0,3]=Pune
address[0,4]=Maharashtra
address[0,5]=411015
address[1,0]=Irshad
address[1,1]=Shaikh
address[1,2]=9089798899
address[1,3]=Mumbai
address[1,4]=Maharashtra
address[1,5]=410101

function edit()
{
position=$(($1-1))
echo "1.First Name 2.Last Name 3.mobile Number 4.City 5.State 6.Pin"
read -p "Select Number from the above Fields to Edit: " field
case $field in
        1)read -p "ReEnter Firstname: " edit
        address[$position,0]=$edit;;
        2)read -p "ReEnter Lastname: " edit
        address[$position,1]=$edit;;
        3)read -p "ReEnter Mobile number: " edit
        address[$pos,2]=$edit;;
        4)read -p "ReEnter City: " edit
        address[$position,3]=$edit;;
        5)read -p "ReEnter State: " edit
        address[$position,4]=$edit;;
        6)read -p "ReEnter Pin: " edit
        address[$position,5]=$edit;;
        *);;
esac
}
function delete()
{

read -p "Enter Slot Number to Delete: " pos
pos=$(($pos-1))
echo "Adress Deleted"
for((i=0;i<6;i++))
do
	echo {$address[$pos,$i]}

done
for ((i=0;i<6;i++));do 
address[$pos,$i]=' ';done
}


while [ true ]
do
echo "1.Display the Address 2.Insert 3.Edit 4.Delete 5.Exit"
read -p  "Enter Your Choice: " choice
case $choice in
	1)display;;
	2)read -p "How Many Address will u Add: " num
		insert $num;;
	3)read -p  "Enter The Adreess Slot Number  to Edit :" e
		edit $e;;
	4)delete;;
	5)exit;;
	*)echo "Enter Your Correct Choice.......";;
		
esac

done