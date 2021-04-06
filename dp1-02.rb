# 2項間漸化式 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step1

def solve(input_data)
  x, d, q, *k = input_data.split.map(&:to_i)

  k.map do |n|
    a = [x]   # n = 1
    (n - 1).times do |i|
      a << a[-1] + d   # n >= 2
    end
    a[-1]
  end
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  0 7
  5
  1
  2
  3
  4
  5
EOS
res1 = [0, 7, 14, 21, 28]
puts solve(in1)
