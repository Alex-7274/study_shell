#!/bin/bash
#生成一个100以内的随机数，提示用户猜数字；
#根据用户的输入，提示用户猜对了，猜大了，猜小了

# RANDOM 为系统自带的系统变量,值为 0‐32767的随机数
# 使用取余算法将随机数变为 1‐100 的随机数

num=$[RANDOM%100+1]
#echo "$num"
i=1
count=10

while(( $i<=10 ))
do
	read -p "计算机生成了一个随机数请你猜猜看：" n
	let "count--"
	echo -e "你还有 "$count" 次机会哦！\n"
	
	if [ $n -eq $num ]
	then
		echo "恭喜你，猜对啦"
		exit
	elif [ $n -gt $num ]
	then
		echo -e "sorry，你猜大了\n"
	else
		echo -e "sorry，你猜小了\n"
	fi
	let "i++"
done