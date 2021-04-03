def solve(input)
  n, a, b = input.split.map(&:to_i)
  dp = [1]
  (1..n).each do |i|
    dp[i] = 0
    if i >= a
      dp[i] = dp[i] + dp[i - a]  # i-a 段目から1段上って i 段へ到達
    end
    if i >= b
      dp[i] = dp[i] + dp[i - b]  # i-b 段目から2段上って i 段へ到達
    end
  end
  dp[-1]
end

puts solve(gets)
