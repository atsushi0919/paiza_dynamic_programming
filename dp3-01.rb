def solve(input)
  n, a, b = input.split.map(&:to_i)

  dp = [0, a]
  (2..n).each do |i|
    dp[i] = [dp[i - 1] + a, dp[i - 2] + b].min
  end
  dp[-1]
end

puts solve(STDIN.read)
