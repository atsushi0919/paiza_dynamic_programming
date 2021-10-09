# 最長減少部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_boss

INPUT1 = <<~"EOS"
  5
  109
  110
  108
  103
  100
EOS
OUTPUT1 = <<~"EOS"
  4
EOS

def solve(input_data)
  # 入力受け取り
  n, *a = input_data.split("\n").map(&:to_i)

  # dpテーブル初期化
  dp = [1]

  # dpテーブル更新
  1.upto(n - 1).each do |i|
    # 木 i のみからなる部分列の長さ
    dp[i] = 1
    0.upto(i - 1).each do |j|
      if a[j] > a[i]
        # 最後が木 j であるような減少部分列の末尾に木 i をくっつける
        dp[i] = [dp[i], dp[j] + 1].max
      end
    end
  end

  # 最大値を返す
  dp.max
end

puts solve(STDIN.read)
