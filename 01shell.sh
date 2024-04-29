#!/bin/bash


echo "---此脚本文件用来进行shell的学习和实验---"
echo "today is `date` "

num=10
echo "num=$num"
read -p "请输入num的值：" num
echo "now num=$num"

read -p "依次输入多个数：" data1 data2
echo "data1=$data1 data2=$data2"

(
	#()内为子shell，不影响当前shell的值
	data=20
	echo "()里面data=$data"
)

str="ABCDEFGHIJKLMN"
echo "str的长度为:${#str}"

read -p "请输入一个文件名" fileName
[ -e $fileName ]
echo "此文件是否存在：$?"

read -p "请输入第一个数：" data1
read -p "请输入第二个数：" data2

test $data1 -eq $data2
echo "相等？$?"

test $data1 -gt $data2
echo "大于？$?"

test $data1 -lt $data2
echo "小于？$?"

sum=0
for i in {0..100..2}
do
	sum=$[i+sum]
done
echo "0到100偶数之和为：$sum"



if [ $USER=="root" ]
then
	echo "当前用户为管理员"
else
	echo "当前用户不是管理员"
fi


read -p "请输入要查询的文件名：" fname
if [ -e $fname ];then
	echo "此文件存在，"

	if [ -x $fname ];then
		echo "并且具有执行权限"
	else
		echo "但是不具备执行权限"
	fi
else
	echo "此文件不存在"
fi


read -p "请输入数字：" a
if [ $a = 0 ];then
	echo "0 是整数"
else
	let i=a+0 &> /dev/null
	if [ $? = 0 ];then
		echo " $a 是整数 "
	else
		echo " $a 不是整数"
	fi
fi


read -p "input number:" a
echo "your input is $a"
while [ $a -le 5 ];do
	let ++a
	echo "your input a is : $a"
done


read -p "please input 1 or 2:" num
case $num in 
	1)
		echo "you input 1"
		;;
	2)
		echo "you input 2"
		;;
	*)
		echo "you input shit"
		exit 1
esac


for i in {1..5}
do 
	echo 123
done


while date
do
	sleep 1
done


i=1
while (i<=10)
do
	let i++
	echo"$i"
done


read -p "Input a year number:" year
let "leap=$year%4==0&&$year%100!=0||$year%400==0"
if [ $leap -eq 0 ]
then
	echo "$year is not a leap year"
else
	echo "$year is a leap year"
fi


for ((i=0;i<5;i++))
do
	for((j=0;j<=i;j++))
	do
		echo -n "*"
	done
	echo ""
done


read -p "input a number biger then 20:" num
if [ $num -gt 20 ]
then
	let i=$num*$num
	echo "$i"
else
	echo "number is less then 20"
fi


a=0
read -p "input a number :" b
c=1
sum=0
while [ $b -gt 0 ]
do
	let "a=b%2"
	let "b=b/2"
	let "sum=sum+a*c"
	let "c=c*10"
done
echo "$sum"


cd 123/
for i in `cat studentlist.cvs`
do
	str="_homework.txt"
	file=123/$str
	if [ -f $file ]
	then
		echo "yes"
	else
		echo "no"
	fi
done