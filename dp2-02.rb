# 階段の上り方 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_stairs_step1

def solve(input_data)
  n, a, b = input_data.split.map(&:to_i)

  dp = [1]
  (1..n).each do |i|
    dp[i] = 0
    dp[i] = dp[i] + dp[i - a] if i >= a  # i-a 段目から1段上って i 段へ到達
    dp[i] = dp[i] + dp[i - b] if i >= b  # i-b 段目から2段上って i 段へ到達
  end
  dp[-1]
end

#puts solve(STDIN.read)

in1 = "11 3 4\n"
res1 = 3
puts solve(in1)
