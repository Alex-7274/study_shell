#!/bin/bash


read -p "请输入y继续：" yn
if [ $yn = "y" ];
then
	echo "继续"
else
	echo "停止"
fi

read -p "请输入yes/no: " choice
case $choice in
	yes | y* | Y*)
		echo "yes"
		;;
	no | n* | N*)
		echo "no"
		;;
	*)
		echo "other"
		;;
esac



sum=0
for i in {1..100}
do
	sum=$[i+sum]
done
echo "sum=$sum"

for filename in `ls`
do
	if [ -d $filename ];then
		echo "$filename是文件夹"
	elif [ -f $filename ];then
		echo "$filename是普通文件"
	fi
done

$$

str="abc:def:ghi:jkl"
echo ${str//:/123}



read -p "请输入文件夹的名字：" dirname
if [ -e $dirname ];then
	echo "$dirname是存在的 即将进入文件夹"
	cd $dirname
	if [ -e 123.txt ];then
		echo "删除已存在的123.txt"
		rm 123.txt
	else
		echo "创建123.txt"
		touch 123.txt
	fi
else
	echo "该文件不存在 即将创建文件夹"
	mkdir $dirname
	echo "文件夹已创建 即将进入"
	cd $dirnema
	echo "已创建123.txt"
	touch 123.txt
	
fi