#!/bin/bash
#根据输入的数值，判断你的等级；

read -p "请输入你的成绩(0-100) : " grade

if [ $grade -ge 90 ] && [ $grade -le 100 ]
then
	echo "优秀！"
elif [ $grade -ge 80 ] && [ $grade -le 89 ]
then
	echo "良好."
elif [ $grade -ge 60 ] && [ $grade -le 79 ]
then
	echo "及格..."
else
	echo "你！不！及！格！"
fi

#-ge == >=
#-le == <=