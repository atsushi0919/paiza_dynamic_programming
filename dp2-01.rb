# 階段の上り方 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_stairs_step0

def solve(input_data)
  n = input_data.to_i

  dp = [1]
  (1..n).each do |i|
    dp[i] = 0
    dp[i] = dp[i] + dp[i - 1] if i >= 1  # i-1 段目から1段上って i 段へ到達
    dp[i] = dp[i] + dp[i - 2] if i >= 2  # i-2 段目から2段上って i 段へ到達
  end
  dp[-1]
end

#puts solve(STDIN.read)

in1 = "3\n"
ans1 = "3"
puts solve(in1)
