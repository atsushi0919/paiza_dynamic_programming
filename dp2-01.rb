def solve(input)
  n = input.to_i

  dp = [1]
  (1..n).each do |i|
    dp[i] = 0
    if i >= 1
      dp[i] = dp[i] + dp[i - 1]  # i-1 段目から1段上って i 段へ到達
    end
    if i >= 2
      dp[i] = dp[i] + dp[i - 2]  # i-2 段目から2段上って i 段へ到達
    end
  end
  dp[-1]
end

puts solve(gets)
