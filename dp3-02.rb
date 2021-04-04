# 最安値を達成するには 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_apples_step1

def solve(input_data)
  n, a, b = input_data.split.map(&:to_i)

  dp = [0]
  (1..n + 4).each do |i|
    tmp_a = i > 2 ? dp[i - 2] + a : a
    tmp_b = i > 5 ? dp[i - 5] + b : b
    dp[i] = [tmp_a, tmp_b].min
  end
  dp[n..-1].min
end

#puts solve(STDIN.read)

in1 = "4 110 200\n"
anw1 = "200"
puts solve(in1)
