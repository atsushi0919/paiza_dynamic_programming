# 最長増加連続部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_continuous_boss

def solve(input_data)
  n, *a = input_data.split("\n").map(&:to_i)

  dp = [1]
  (1..n - 1).each do |i|
    dp[i] = a[i - 1] >= a[i] ? dp[i - 1] + 1 : 1
  end
  dp.max
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  5
  187
  192
  115
  108
  109
EOS
ans1 = 3
puts solve(in1)
