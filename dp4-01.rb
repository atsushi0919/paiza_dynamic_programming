def solve(input_data)
  n, *a = input_data.split("\n").map(&:to_i)

  dp = [1]
  (1..n - 1).each do |i|
    dp[i] = a[i - 1] <= a[i] ? dp[i - 1] + 1 : 1
  end
  dp.max
end

puts solve(STDIN.read)
#in1 = "5\n160\n178\n170\n190\n190\n"
#puts solve(in1)
