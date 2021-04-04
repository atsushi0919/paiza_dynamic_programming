def solve(input)
  n, a, b = input.split.map(&:to_i)

  dp = [0]
  (1..n + 4).each do |i|
    tmp_a = i > 2 ? dp[i - 2] + a : a
    tmp_b = i > 5 ? dp[i - 5] + b : b
    dp[i] = [tmp_a, tmp_b].min
  end
  dp[n..-1].min
end

puts solve(STDIN.read)
