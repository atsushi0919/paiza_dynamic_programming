# 最安値を達成するには 4 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_apples_boss

INPUT1 = <<~"EOS"
  9 2 100 3 125 5 200
EOS
OUTPUT1 = <<~"EOS"
  375
EOS

def solve(input_data)
  n, x, a, y, b, z, c = input_data.split.map(&:to_i)

  # dpテーブル初期化
  # 0 個購入: 0 円
  dp = [0]

  # dpテーブル更新
  1.upto(n + [a, b, c].max) do |i|
    tmp_a = i > x ? dp[i - x] + a : a
    tmp_b = i > y ? dp[i - y] + b : b
    tmp_c = i > z ? dp[i - z] + c : c

    # x 個, y 個, z個 買った場合の最安値を記録する
    dp << [tmp_a, tmp_b, tmp_c].min
  end

  # n 個以上購入時の最安値を返す
  dp[n..].min
end

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > 375
