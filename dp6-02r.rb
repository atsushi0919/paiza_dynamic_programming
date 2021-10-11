# 部分和問題 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_step1

INPUT1 = <<~"EOS"
  5 10
  7
  3
  4
  3
  2
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

def solve(input_lines)
  # 回答用の定数
  mod = 1_000_000_007

  # 入力受け取り
  input_lines = input_lines.split("\n")
  n, x = input_lines.shift.split.map(&:to_i)
  *a = input_lines.map(&:to_i)

  # dpテーブル初期化
  dp = Array.new(x + 1, 0)
  # おもりを選ばなければ重さの和 0 作ることができる
  dp[0] = 1

  # dpテーブル更新
  1.upto(n) do |i|
    x.downto(a[i - 1]) do |j|
      # a[i-1] を使って j を作れる組み合わせを足す
      dp[j] += dp[j - a[i - 1]]
    end
  end

  # x が作れる組み合わせ数 % 1_000_000_007 を返す
  dp[x] % mod
end

puts solve(STDIN.read)

#        | j
#  i     | 0  1  2  3  4  5  6  7  8  9 10 |
#  - ( 0)| 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 |
# [1]( 7)| 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 |
# [2]( 3)| 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1 |
# [3]( 4)| 1, 0, 0, 1, 1, 0, 0, 2, 0, 0, 1 |
# [4]( 3)| 1, 0, 0, 2, 1, 0, 1, 3, 0, 0, 3 |
# [5]( 2)| 1, 0, 1, 2, 1, 2, 2, 3, 1, 3, 3 |

=begin
1 ~ n の番号がついた n 個のおもりがあり、おもり i の重さは a_i です。
おもりを何個か選んで重さの和が x となるようにする方法が何通りあるか求めてください。
なお、同じおもりを2個以上選ぶことはできません。
重さが同じおもりが複数存在する場合、それらは区別して別のものとして扱うことにします。
答えは非常に大きくなる可能性があるので、答えを 1,000,000,007 で割った余りで出力してください。
=end
