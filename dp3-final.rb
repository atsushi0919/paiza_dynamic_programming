# 最安値を達成するには 4 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_apples_boss

def solve(input_data)
  n, x, a, y, b, z, c = input_data.split.map(&:to_i)

  dp = [0]
  (1..n + [a, b, c].max).each do |i|
    tmp_a = i > x ? dp[i - x] + a : a
    tmp_b = i > y ? dp[i - y] + b : b
    tmp_c = i > z ? dp[i - z] + c : c
    dp[i] = [tmp_a, tmp_b, tmp_c].min
  end
  dp[n..-1].min
end

#puts solve(STDIN.read)

in1 = "9 2 100 3 125 5 200\n"
ans1 = "375"
puts solve(in1)
