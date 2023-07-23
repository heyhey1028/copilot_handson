/// 円定期預金の利息計算標準入力から「預け入れ金額 年数 利率（％）」という形式（スペース区切り）で入力を受け取り、満期の受取金額を標準出力に出力するプログラムを作成してください。
/// たとえば 1000000 3 0.01 という入力が与えられたときには、1000297を表示します。
/// なお、預け入れ期間は年単位で、利率は変動せずに一定と考えてください。
/// 0.5年などの少数単位での指定は受け付けません。
/// 利息の計算は「預け入れ金額 × 利率 × 預け入れ日数／365」の式により行われます。
/// 利息計算時に1円未満の端数が発生した場合は、それを切り捨てます。
/// 預け入れ期間が3年未満の場合、単利計算が適用され、3年以上の場合は複利計算が適用されます。
/// 複利の計算は、それまでの利息を預け入れ金額に組み入れて行うもので、半年毎の複利で計算されます。
/// なお、1年を半年毎に分けるときには、最初の半年は182日、次の半年は183日として計算します。
/// うるう年は考慮しません。

void main(List<String> args) {}
