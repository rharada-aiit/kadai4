#!/bin/bash
# 引数の数が2であるかチェック
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 num1 num2" >&2
  exit 1
fi

# 引数が自然数かチェック ※ ここでは自然数に0を含むこととする

if ! [[ "$1" =~ ^[0-9]+$ && "$2" =~ ^[0-9]+$ ]]; then
  echo "Error: Both arguments must be natural numbers." >&2
  exit 1
fi

# 引数のオーバーフロー対策。18桁までとする
max_digits=18
if [ ${#1} -gt $max_digits ] || [ ${#2} -gt $max_digits ]; then
  echo "Error: Both arguments must be natural numbers." >&2
  exit 1
fi

# 最大公約数の計算（ユークリッドの互除法）
a=$1
b=$2

while [ "$b" -ne 0 ]; do
  r=$(( a % b ))
  a=$b
  b=$r
done

echo "$a"
