# 最安値を達成するには 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_apples_step0

def solve(input_data)
  n, a, b = input_data.split.map(&:to_i)

  dp = [0, a]
  (2..n).each do |i|
    dp[i] = [dp[i - 1] + a, dp[i - 2] + b].min
  end
  dp[-1]
end

#puts solve(STDIN.read)

in1 = "5 100 150\n"
ans1 = "400"
puts solve(in1)
