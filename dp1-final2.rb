# 3項間漸化式 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_boss

def solve(input_data)
  q, *k = input_data.split("\n").map(&:to_i)

  k.map do |i|
    dp = []
    while dp.size < i
      dp <<= dp.size > 1 ? dp[-2] + dp[-1] : 1
    end
    dp[-1]
  end
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
res1 = [1, 1, 2, 3, 2]
puts solve(in1)
