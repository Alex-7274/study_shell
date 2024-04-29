#!/bin/bash

# 判断数组中最大的数
score=(10 20 30 40 50 60 70 80 90 100)
temp=0
for ((i=0; i<${#score[*]}; i++)); do
    if [ ${score[$i]} -gt $temp ]; then
        temp=${score[$i]}
    fi
done
echo "数组中最大的数是：$temp"


#循环ping网段中的主机
# for i in {1..10}; do
#     ping -c 2 -w 3 -i 0.3 192.168.110.$i >/dev/null
#     if [ $? -eq 0 ]; then
#         echo "192.168.110.$i is reachable"
#     else
#         echo "192.168.110.$i is not reachable"
#     fi
# done


#创建一个1-100内奇数组成的数组
for i in {1..100};do
    if [ $((i % 2)) -eq 1 ];then
        arr[$i]=$i
    fi
done
echo "${arr[*]}"


#将一个数组中不足60的元素提升到60
arr=(45 86 525 4563 5458 12 644 74 5 59)
for ((i=0; i<${#score[*]}; i++)); do
    if [ ${arr[$i]} -lt 60 ];then
        place=arr[$i] #取数组元素的位置
        old_val=${arr[$i]} #保留原数值
        arr[$i]=60 #赋予新数值
        echo "$place > $old_val ==> ${arr[$i]}"
    else
        place=arr[$i]
        echo "$place > ${arr[$i]}"
    fi
    done


# 列出当前目录下所有文件
# for i in $(ls);do
#     echo "$i"
# done
# echo "`date`"


#模拟计算器
# read -p "请输入第一个数：" num1
# read -p "请输入运算符（+ - * /）：" operator
# read -p "请输入第二个数：" num2
# result=$(echo "$num1 $operator $num2" | bc) #bc是许多 Linux 发行版和 Unix 系统中用于数学运算的一个工具，本机没安装。
# echo "计算结果为：$result"