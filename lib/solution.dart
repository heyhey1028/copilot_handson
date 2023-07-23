/// 問題：
/// 円定期預金の利息計算標準入力から「預け入れ金額 年数 利率（％）」という形式（スペース区切り）で
/// 入力を受け取り、満期の受取金額を標準出力に出力するプログラムを作成してください。
///
/// たとえば 1000000 3 0.01 という入力が与えられたときには、1000297を表示します。
/// なお、預け入れ期間は年単位で、利率は変動せずに一定と考えてください。
/// 0.5年などの少数単位での指定は受け付けません。
/// 利息の計算は「預け入れ金額 × 利率 × 預け入れ日数／365」の式により行われます。
/// 利息計算時に1円未満の端数が発生した場合は、それを切り捨てます。
/// 預け入れ期間が3年未満の場合、単利計算が適用され、3年以上の場合は複利計算が適用されます。
/// 複利の計算は、それまでの利息を預け入れ金額に組み入れて行うもので、半年毎の複利で計算されます。
/// なお、1年を半年毎に分けるときには、最初の半年は182日、次の半年は183日として計算します。うるう年は考慮しません。
///
/// 用語集
/// - 預入金額 deposit amount
/// - 受取金額 received amount
/// - 利率 interest rate
/// - 利息 interest
/// - 単利 simple interest
/// - 複利 compound interest
///
/// 条件：
/// - 利息計算の1円未満の端数は切り捨てる
/// - 最初の半年：182日
/// - 次の半年：183日
///
/// 必要な関数：
/// - 半年毎の複利で複利計算を行う関数
/// - 単利計算を行う関数

import 'dart:io';

void main(List<String> args) {
  final String? input = stdin.readLineSync();

  final List<String> inputList = input!.split(' ');
  final int deposit = int.parse(inputList[0]);
  final int year = int.parse(inputList[1]);
  final double interestRate = double.parse(inputList[2]);

  if (year < 3) {
    print(calculateSimpleInterest(deposit, year, interestRate));
  } else {
    print(calculateCompoundInterest(deposit, year, interestRate));
  }
}

/// 半年毎の複利で複利計算を行う関数
/// 引数：預け入れ金額、年数、利率
/// 返り値：満期の受取金額
/// 利息の計算は「預け入れ金額 × 利率 × 預け入れ日数／365」の式により行われる
/// 182日の運用した利息を元本に加えて、183日の運用した利息を計算する
/// これを年数分繰り返す
/// 利率は％表記なので、利率/100で計算する
int calculateCompoundInterest(int deposit, int year, double interestRate) {
  int receivedAmount = deposit;
  for (int i = 0; i < year; i++) {
    receivedAmount = (receivedAmount * (1 + interestRate / 100 * 182 / 365)).floor();
    receivedAmount = (receivedAmount * (1 + interestRate / 100 * 183 / 365)).floor();
  }
  return receivedAmount;
}

/// 単利計算を行う関数
/// 引数：預け入れ金額、年数、利率
/// 返り値：満期の受取金額
/// 利息の計算は「預け入れ金額 × 利率 × 預け入れ日数／365」の式により行われる
/// 利率は％表記なので、利率/100で計算する
int calculateSimpleInterest(int deposit, int year, double interestRate) {
  int receivedAmount = deposit;
  for (int i = 0; i < year; i++) {
    receivedAmount = (receivedAmount * (1 + interestRate / 100 * 365 / 365)).floor();
  }
  return receivedAmount;
}
