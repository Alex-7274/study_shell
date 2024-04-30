#!/bin/bash

if ping -n 1 "www.baidu.com" >> log.txt; then
    echo "www.baidu.com is alive"
else
    echo "www.baidu.com is not alive"
fi
