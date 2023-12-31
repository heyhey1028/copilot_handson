/// 和暦文字列をDateTimeに変化する関数
/// 引数：和暦の年、月、日を含む文字列 ex. 令和01年01月01日, 昭和64年1月7日
/// 返り値：DateTime ex. DateTime(2019, 1, 1)
///
/// 各年号の開始日
/// '明治': 1868
/// '大正': 1912
/// '昭和': 1926
/// '平成': 1989
/// '令和': 2019
///
/// 元年は1年目として扱う

