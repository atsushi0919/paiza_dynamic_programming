def solve(line)
  q, *k = line.split("\n").map(&:to_i)

  result = []
  k.each do |i|
    tmp_arr = []
    (1..i).each do |n|
      if n <= 2
        tmp_arr << 1
      else
        tmp_arr << tmp_arr[-2] + tmp_arr[-1]
      end
    end
    result << tmp_arr[-1]
  end
  result
end

in1 = <<~"EOS"
  5
  1
  2
  3
  4
  3
EOS

out1 = <<~"EOS"
  1
  1
  2
  3
  2
EOS

puts solve(in1)
#puts solve(STDIN.read)
