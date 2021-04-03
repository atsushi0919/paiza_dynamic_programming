def solve(k)
  tmp_arr = []
  (1..k).each do |n|
    if n <= 2
      tmp_arr << 1
    else
      tmp_arr << tmp_arr[-2] + tmp_arr[-1]
    end
  end
  tmp_arr[-1]
end

puts solve(gets.to_i)
