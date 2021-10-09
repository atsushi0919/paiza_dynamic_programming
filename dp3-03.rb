# 最安値を達成するには 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_apples_step2

INPUT1 = <<~"EOS"
  4 2 110 5 200
EOS
OUTPUT1 = <<~"EOS"
  200
EOS

def solve(input_data)
  n, x, a, y, b = input_data.split.map(&:to_i)

  # dpテーブル初期化
  # 0 個購入: 0 円
  dp = [0]

  # dpテーブル更新
  1.upto(n + [a, b].max) do |i|
    tmp_a = i > x ? dp[i - x] + a : a
    tmp_b = i > y ? dp[i - y] + b : b

    # x 個買った場合と y 個買った場合で安い方を記録する
    dp << [tmp_a, tmp_b].min
  end

  # n 個以上購入時の最安値を返す
  dp[n..].min
end

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > 200
