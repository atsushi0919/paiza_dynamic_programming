def solve(line)
  q, *k = line.split("\n").map(&:to_i)
  exit

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

solve(in1)
#solve(STDIN.read)
