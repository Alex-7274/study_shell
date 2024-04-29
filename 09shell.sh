#!/bin/bash

#读取.txt文件并显示文件内容
if [ -e user.txt ]; then
    cat user.txt
else
    echo "user.txt文件不存在"
fi

#
echo -e "\\n"
alias psa='ps -ef'
#创建一个名为back的shell函数
back() {
    cd ..
    ls
}
#调用函数
# back


#正则表达式查找
awk + 正则表达式
awk '{if ($0 ~ /./) print}' log.txt
awk '{if ($0 ~ /(^[a-zA-Z\s]+)/) print}' log.txt
awk '{if ($0 ~ /^([0-9]+)$/) print}' log.txt



#读取in.txt文本的内容，在每行内容后加上时间，然后重定向输出到out.txt
if [ -e in.txt ]; then
    while IFS= read -r line; do
        echo "$line  $(date)" >> out.txt
    done < in.txt
else
    echo "in.txt文件不存在，正在创建..."
    touch in.txt
    echo "请输入一些文本，然后按Ctrl+D结束："
    cat > in.txt
fi




#目录遍历与统计
# 指定目录路径
dir_path="/e/Develop/shelltest"
# 初始化计数器
dir_count=0
file_count=0
# 遍历指定目录下的所有子目录和文件
while IPS= read -r -d '' item;do
    if [ -d "$item" ];then
        let dir_count++;
    elif [ -f "$item" ];then
        let file_count++;
    fi
done < <(find "$dir_path" -mindepth 1 -print0)

echo "$dir_path 总共有 $dir_count 个目录。"
echo "$dir_path 总共有 $file_count 个文件。"




#判断正负数
read -p "please enter a number:" num
if [[ "$num" =~ ^-?[0-9]+$ ]];then #[[]]支持字符串的模式匹配，使用=~操作符时甚至支持shell的正则表达式。
    if [ "$num" -gt 0 ];then
        echo "$num is an even number and bigger than zero"
    elif [ "$num" -lt 0 ];then
        echo "$num is an even number and less than zero"
    else 
        echo "$num is 0"
    fi
else
    echo "$num is not an even number"
fi




# 统计文本文件里每个单词出现的次数，并按照出现次数从高到低排序
if [ ! -f out.txt ]; then
    echo "文件data.txt不存在"
fi
awk '{for(i=1;i<=NF;i++) word[$i]++} END {for(w in word) print w, word[w]}' out.txt | sort -k2 -nr




# 搜索当前目录及其子目录中包含特定关键字"zy"的所有.txt文件
find . -type f -name "*.txt" -exec grep -l "zy" {} +




# 编写一个bash脚本，实现以下功能：
# 提示用户输入一个数字。
# 判断用户输入的数字是否在1到100之间（包含1和100）。
# 如果在范围内，输出"输入的数字在范围内"；如果不在范围内，输出"输入的数字不在范围内"。
# 如果用户输入的不是数字，输出"输入的不是数字，请重新输入"。
read -p "please enter a number:" num
if [[ "$num" =~ ^[0-9]+$ ]]; then
    if [ $num -ge 1 ] && [ $num -le 100 ];then
        echo "right"
    else
        echo "wrong"
    fi
else 
    echo "is not a number"
fi




# 编写一个bash脚本，实现以下功能：
# 读取用户输入的字符串。
# 将字符串中的所有小写字母转换为大写字母。
# 将转换后的字符串中的空格替换为下划线。
# 输出处理后的字符串。
read -p "please enter a string:" str
echo $str | tr [a-z] [A-Z] | tr ' ' '_' #tr命令主要用于压缩重复字符，删除文件中的控制字符以及进行字符转换操作。
echo "abcd 1234 " | tr [abcd] [efgh] | tr ' ' '-'




# 定义一个包含若干数字的数组（例如numbers=(1 3 5 7 9)）。
# 使用循环遍历数组中的每个元素。
# 对于每个元素，判断它是否是质数。
# 输出数组中的所有质数。
for num in {1..10}; do
    is_prime=1
    if [ $num -eq 1 ]; then
        is_prime=0
    else
        for ((i=2;i<=num/2;i++)); do
            if [ $((num%i)) -eq 0 ]; then
                is_prime=0
                break
            fi
        done
    fi

    if [ $is_prime -eq 1 ]; then
        echo "$num 是质数"
    fi
done




# 编写一个bash脚本，实现以下功能：
# 获取当前日期和时间。
# 计算并输出三天后的日期。
# 计算并输出当前时间两小时后的时间。
# 将计算得到的三天后的日期和两小时后的时间保存到一个文本文件中。
echo "now time is $(date)"
echo "three days later is $(date -d "+3 days" '+%Y-%m-%d')"
echo "two hours later is $(date -d "+2 hours" '+%H:%M:%S')"
echo "now time is $(date)" >> log.txt
echo "three days later is $(date -d "+3 days" '+%Y-%m-%d')" >> log.txt
echo "two hours later is $(date -d "+2 hours" '+%H:%M:%S')" >> log.txt



#该脚本接受一个目录作为参数，并递归地搜索该目录及其子目录中的所有.txt文件，并输出它们的完整路径。
place=`pwd`
echo "$place"
find "$place" -type f -name "*.txt"




# 获取磁盘使用情况
# 使用df命令获取根目录的磁盘使用情况，然后通过grep和awk提取使用率
# 将结果输出到日志文件中
disk_usage=$(df -h | grep / | awk '{print $1 $5}')
echo "$disk_usage"
echo "$disk_usage" >> log.txt



#显示进程，杀死进程
echo "正在进行的进程列表："
ps -ef
read -p "please enter pid:" pid
if [[ $pid =~ ^[0-9]+$ ]];then
    kill $pid
    echo "$pid is killed"
else
    echo "please enter right pid"
fi