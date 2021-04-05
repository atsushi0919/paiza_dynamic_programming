# 最長減少部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_boss

def solve(input_data)
  n, *a = input_data.split("\n").map(&:to_i)

  dp = [1]
  (1...n).each do |i|
    dp[i] = 1
    (0...i).each do |j|
      if a[j] > a[i]
        dp[i] = [dp[i], dp[j] + 1].max
      end
    end
  end
  dp.max
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  5
  109
  110
  108
  103
  100
EOS
ans1 = 4
puts solve(in1)
