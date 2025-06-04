#!/bin/bash

# テスト1: 正常系（2と4 -> 2）
echo "Test 1: gcd.sh 2 4"
result=$(./gcd.sh 2 4)
if [ "$result" != "2" ]; then
    echo "Test 1 Failed: Expected 2, got $result"
    exit 1
fi

# テスト2: 引数不足
echo "Test 2: gcd.sh 3"
if ./gcd.sh 3 >/dev/null 2>&1; then
    echo "Test 2 Failed: Should have failed on missing argument"
    exit 1
fi

# テスト3: 数字でない入力
echo "Test 3: gcd.sh a b"
if ./gcd.sh a b >/dev/null 2>&1; then
    echo "Test 3 Failed: Should have failed on non-numeric input"
    exit 1
fi

echo "All tests passed!"
