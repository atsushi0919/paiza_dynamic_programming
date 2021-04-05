# 最長部分増加列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_step0

def solve(input_data)
  n, *a = input_data.split("\n").map(&:to_i)

  dp = [1]
  (1...n).each do |i|
    dp[i] = 1  # 木 i のみからなる部分列の長さ
    (0...i).each do |j|
      if a[j] < a[i]
        dp[i] = [dp[i], dp[j] + 1].max  # 最後が木 j であるような増加部分列の末尾に木 i をくっつける
      end
    end
  end
  dp.max
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  5
  100
  102
  101
  91
  1999
EOS
ans1 = 3
puts solve(in1)
