#!/bin/bash


read -p "请输入你的100m跑步成绩：" sec
if [ $sec -gt 0 ] && [ $sec -le 10 ];then
	read -p "请输入你的性别：" sex
	if [ $sex == "男" ];then
		echo "恭喜你入围男子组100m决赛！"
	elif [ $sex == "女" ];then
		echo "恭喜你入围女子组100m决赛！"
	else
		echo "请输入正确的性别（男 女）"
	fi
else
	echo "你已被淘汰"
fi