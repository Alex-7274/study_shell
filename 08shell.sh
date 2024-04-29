#!/bin/bash

#01
echo "hello world"

#02 创建linux用户
# useradd "$1"
# echo "$2" | passwd --stdin "$1"

#03 备份日志
# tar -czf log-`date +%Y-%m-%d`.tar.gz /var/log

#04 一键部署LNMP
# yum ‐y install httpd
# yum ‐y install mariadb mariadb‐devel mariadb‐server
# yum ‐y install php  php‐mysql
# systemctl start httpd mariadb
# systemctl enable httpd mariadb

#05 监控硬盘容量
disk_size=$(df / | awk 'NR==2 {print $4}')
if [ $disk_size -lt 512000 ]; then
    echo "disk size is not enough: $disk_size kb"
else
    echo "disk size is enough: $disk_size kb"
fi

#06 对三个数进行升序排序
read -p "输入第一个数：" num1
read -p "输入第二个数：" num2
read -p "输入第三个数：" num3
p=0
if [ $num1 -gt $num2 ]; then
    p=$num1
    num1=$num2
    num2=$p
fi
if [ $num1 -gt $num3 ]; then
    p=$num1
    num1=$num3
    num3=$p
fi
if [ $num2 -gt $num3 ]; then
    p=$num2
    num2=$num3
    num3=$p
fi
echo "$num1 $num2 $num3"

#07 连续点名器
# while :
# do
# line=`cat user.txt | wc -l`
# num=$[RANDOM%line+1]
# sed -n "${num}p" user.txt
# sleep 3
# clear
# done

#08 打印国际象棋棋盘
for i in {1..8}
do
  	for j in {1..8}
  	do
  		sum=$[i+j]
		if [  $[sum%2] -eq 0 ];then #用奇偶来决定颜色
 			echo -ne "\033[46m  \033[0m"
		else
			echo -ne "\033[47m  \033[0m"
		fi
  	done
  	echo
done

#09 斐波那契数列
read -p "请输入斐波那契数列的长度：" N
a=0
b=1
echo "斐波那契数列的前$N个数是："
for (( i=0; i<N; i++ ))
do
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
done
echo -e "\\n"

#10 根据计算机当前时间,返回问候语.
tm=$(date +%H)
if [ $tm -le 11 ];then
	msg="早上好！"
elif [ $tm -gt 11 -a $tm -le 13 ];then
  	msg="中午好！"
elif [ $tm -gt 13 -a $tm -le 18 ];then
  	msg="下午好！"
else
  	msg="晚上好！"
fi
echo "当前时间是:$(date +"%Y‐%m‐%d %H:%M:%S")"
echo -e "\033[34m$msg\033[0m"