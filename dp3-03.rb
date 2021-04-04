# 最安値を達成するには 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_apples_step2

def solve(input_data)
  n, x, a, y, b = input_data.split.map(&:to_i)

  dp = [0]
  (1..n + [a, b].max).each do |i|
    tmp_a = i > x ? dp[i - x] + a : a
    tmp_b = i > y ? dp[i - y] + b : b
    dp[i] = [tmp_a, tmp_b].min
  end
  dp[n..-1].min
end

#puts solve(STDIN.read)

in1 = "4 2 110 5 200\n"
ans1 = "200"
puts solve(in1)
