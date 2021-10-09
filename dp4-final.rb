# 最長増加連続部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_continuous_boss

INPUT1 = <<~"EOS"
  5
  187
  192
  115
  108
  109
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

def solve(input_lines)
  # 入力受け取り
  n, *a = input_lines.split("\n").map(&:to_i)

  # dpテーブル初期化
  dp = [1]

  # dpテーブル更新
  # 前の値以下ならカウントアップ
  # そうでないならカウント 1 にもどる
  1.upto(n - 1) do |i|
    dp[i] = a[i - 1] >= a[i] ? dp[i - 1] + 1 : 1
  end

  # 最長の値を返す
  dp.max
end

puts solve(STDIN.read)
