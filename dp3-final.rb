def solve(input)
  n, x, a, y, b, z, c = input.split.map(&:to_i)

  dp = [0]
  (1..n + [a, b, c].max).each do |i|
    tmp_a = i > x ? dp[i - x] + a : a
    tmp_b = i > y ? dp[i - y] + b : b
    tmp_c = i > z ? dp[i - z] + c : c
    dp[i] = [tmp_a, tmp_b, tmp_c].min
  end
  dp[n..-1].min
end

puts solve(STDIN.read)
# in1 = "228 118 1460 178 7228 554 7705\n"
# puts solve(in1)
