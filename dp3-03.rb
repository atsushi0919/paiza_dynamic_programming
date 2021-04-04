def solve(input)
  n, x, a, y, b = input.split.map(&:to_i)

  dp = [0]
  (1..n + [a, b].max).each do |i|
    tmp_a = i > x ? dp[i - x] + a : a
    tmp_b = i > y ? dp[i - y] + b : b
    dp[i] = [tmp_a, tmp_b].min
  end
  dp[n..-1].min
end

puts solve(STDIN.read)
