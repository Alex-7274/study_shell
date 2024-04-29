#!/bin/bash
#猜拳游戏，玩家出拳，电脑出拳，最后比对决出胜负；

echo "游戏规则：
玩家出石头：输入： 1 
玩家出剪刀：输入： 2 
玩家出抹布：输入： 3 "

echo "-----------------猜拳游戏开始---------------"
num=$[RANDOM%3+1]

read -p "请出招 1-3：" i
case $i in
1)
echo "你出的是石头"
  if [ $num -eq 1 ] 
  then
  echo "计算机出石头"
  echo "平 局"
    elif [ $num -eq 2 ] 
    then
      echo "计算机出剪刀"
      echo "你赢了"
  else
    echo "计算机出布"
    echo "计算机赢了"
  fi;;
2)
echo "你出的是剪刀"
  if [ $num -eq 1 ] 
  then
  echo "计算机出剪刀"
  echo "平 局"
  elif [ $num -eq 2 ] 
  then
    echo "计算机出布"
    echo "你赢了"
  else
    echo "计算机石头"
    echo "计算机赢了"
  fi;;
3)
echo "你出的是布"
  if [ $num -eq 1 ]
  then
  echo "计算机出布"
  echo "平 局"
    elif [ $num -eq 2 ]
    then
      echo "计算机出石头"
      echo "你赢了"
  else
    echo "计算机出剪刀"
    echo "计算机赢了"
  fi;;
*)
  echo "请输入正确的数字：（提示：输入1、2、3）"
esac