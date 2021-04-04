# 3項間漸化式 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_boss

def solve(input_data)
  q, *k = input_data.split("\n").map(&:to_i)

  result = []
  k.each do |i|
    dp = []
    (1..i).each do |n|
      dp <<= n > 2 ? dp[-2] + dp[-1] : 1
    end
    result << dp[-1]
  end
  result
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  5
  1
  2
  3
  4
  3
EOS
res1 = [1,1,2,3,2]
puts solve(in1)
