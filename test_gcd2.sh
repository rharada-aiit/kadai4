#!/bin/bash

tmp=./tmp/$$

ERROR_EXIT () {
    cat ${tmp}-error
    rm -f ${tmp}*
    exit 1
}

GCD_SCRIPT="./gcd.sh"

# --- 正常系テスト ---
echo "# --- 正常系テスト ---"

echo "test1-1: 正常系（2と4）"
echo "入力値: 2 4"
echo "期待値: 2"
$GCD_SCRIPT 2 4 > ${tmp}-result-1
echo "出力値: $(cat ${tmp}-result-1)"
echo "2" > ${tmp}-ans-1
diff ${tmp}-result-1 ${tmp}-ans-1 || echo "error in test1-1: 入力値=2 4" >> ${tmp}-error

echo "test1-2: 正常系（12と8）"
echo "入力値: 12 8"
echo "期待値: 4"
$GCD_SCRIPT 12 8 > ${tmp}-result-2
echo "出力値: $(cat ${tmp}-result-2)"
echo "4" > ${tmp}-ans-2
diff ${tmp}-result-2 ${tmp}-ans-2 || echo "error in test1-2: 入力値=12 8" >> ${tmp}-error

echo "test1-3: 正常系（13と7：互いに素）"
echo "入力値: 13 7"
echo "期待値: 1"
$GCD_SCRIPT 13 7 > ${tmp}-result-3
echo "出力値: $(cat ${tmp}-result-3)"
echo "1" > ${tmp}-ans-3
diff ${tmp}-result-3 ${tmp}-ans-3 || echo "error in test1-3: 入力値=13 7" >> ${tmp}-error

echo "test1-4: 正常系（5と5）"
echo "入力値: 5 5"
echo "期待値: 5"
$GCD_SCRIPT 5 5 > ${tmp}-result-4
echo "出力値: $(cat ${tmp}-result-4)"
echo "5" > ${tmp}-ans-4
diff ${tmp}-result-4 ${tmp}-ans-4 || echo "error in test1-4: 入力値=5 5" >> ${tmp}-error

echo "test1-5: 正常系（0と5）"
echo "入力値: 0 5"
echo "期待値: 5"
$GCD_SCRIPT 0 5 > ${tmp}-result-5
echo "出力値: $(cat ${tmp}-result-5)"
echo "5" > ${tmp}-ans-5
diff ${tmp}-result-5 ${tmp}-ans-5 || echo "error in test1-5: 入力値=0 5" >> ${tmp}-error

echo "test1-6: 正常系（5と0）"
echo "入力値: 5 0"
echo "期待値: 5"
$GCD_SCRIPT 5 0 > ${tmp}-result-6
echo "出力値: $(cat ${tmp}-result-6)"
echo "5" > ${tmp}-ans-6
diff ${tmp}-result-6 ${tmp}-ans-6 || echo "error in test1-6: 入力値=5 0" >> ${tmp}-error

echo "test1-7: 正常系（0と0）"
echo "入力値: 0 0"
echo "期待値: 0"
$GCD_SCRIPT 0 0 > ${tmp}-result-7
echo "出力値: $(cat ${tmp}-result-7)"
echo "0" > ${tmp}-ans-7
diff ${tmp}-result-7 ${tmp}-ans-7 || echo "error in test1-7: 入力値=0 0" >> ${tmp}-error

# --- 異常系テスト ---
echo "# --- 異常系テスト ---"

echo "test2-1: 異常系（引数なし）"
echo "入力値: （なし）"
echo "期待値: Usage: ./gcd.sh num1 num2"
$GCD_SCRIPT > ${tmp}-result-8 2>&1
echo "出力値: $(cat ${tmp}-result-8)"
echo "Usage: ./gcd.sh num1 num2" > ${tmp}-ans-8
diff ${tmp}-result-8 ${tmp}-ans-8 || echo "error in test2-1: 入力値=（なし）" >> ${tmp}-error

echo "test2-2: 異常系（引数が1つ）"
echo "入力値: 3"
echo "期待値: Usage: ./gcd.sh num1 num2"
$GCD_SCRIPT 3 > ${tmp}-result-9 2>&1
echo "出力値: $(cat ${tmp}-result-9)"
echo "Usage: ./gcd.sh num1 num2" > ${tmp}-ans-9
diff ${tmp}-result-9 ${tmp}-ans-9 || echo "error in test2-2: 入力値=3" >> ${tmp}-error

echo "test2-3: 異常系（非数値入力）"
echo "入力値: a b"
echo "期待値: Error: Both arguments must be natural numbers."
$GCD_SCRIPT a b > ${tmp}-result-10 2>&1
echo "出力値: $(cat ${tmp}-result-10)"
echo "Error: Both arguments must be natural numbers." > ${tmp}-ans-10
diff ${tmp}-result-10 ${tmp}-ans-10 || echo "error in test2-3: 入力値=a b" >> ${tmp}-error

echo "test2-4: 異常系（負の値: -5 10）"
echo "入力値: -5 10"
echo "期待値: Error: Both arguments must be natural numbers."
$GCD_SCRIPT -5 10 > ${tmp}-result-11 2>&1
echo "出力値: $(cat ${tmp}-result-11)"
echo "Error: Both arguments must be natural numbers." > ${tmp}-ans-11
diff ${tmp}-result-11 ${tmp}-ans-11 || echo "error in test2-4: 入力値=-5 10" >> ${tmp}-error

echo "test2-5: 異常系（引数が3つ）"
echo "入力値: 1 2 3"
echo "期待値: Usage: ./gcd.sh num1 num2"
$GCD_SCRIPT 1 2 3 > ${tmp}-result-12 2>&1
echo "出力値: $(cat ${tmp}-result-12)"
echo "Usage: ./gcd.sh num1 num2" > ${tmp}-ans-12
diff ${tmp}-result-12 ${tmp}-ans-12 || echo "error in test2-5: 入力値=1 2 3" >> ${tmp}-error

echo "test2-6: 異常系（小数: 3.5 2）"
echo "入力値: 3.5 2"
echo "期待値: Error: Both arguments must be natural numbers."
$GCD_SCRIPT 3.5 2 > ${tmp}-result-13 2>&1
echo "出力値: $(cat ${tmp}-result-13)"
echo "Error: Both arguments must be natural numbers." > ${tmp}-ans-13
diff ${tmp}-result-13 ${tmp}-ans-13 || echo "error in test2-6: 入力値=3.5 2" >> ${tmp}-error

echo "test2-7: 異常系（極度に大きい数: 99999999999999999999999999 2）"
echo "入力値: 99999999999999999999999999 2"
echo "期待値: Error: Both arguments must be natural numbers."
$GCD_SCRIPT 99999999999999999999999999 2 > ${tmp}-result-14 2>&1
echo "出力値: $(cat ${tmp}-result-14)"
echo "Error: Both arguments must be natural numbers." > ${tmp}-ans-14
diff ${tmp}-result-14 ${tmp}-ans-14 || echo "error in test2-7: 入力値=99999999999999999999999999 2" >> ${tmp}-error

# --- エラー判定 ---
if [ -f ${tmp}-error ]; then
    ERROR_EXIT
fi

rm -f ${tmp}*

echo "全てのテストが終了しました"

