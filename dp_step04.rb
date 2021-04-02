def solve(k)
  arr = []
  (1..k).each do |n|
    if n <= 2
      arr << 1
    else
      arr << arr[n - 3] + arr[n - 2]
    end
  end
  arr[-1]
end

puts solve(gets.to_i)
