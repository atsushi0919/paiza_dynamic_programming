# 特殊な2項間漸化式 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step3

def solve(input_data)
  x, d1, d2, q, *k = input_data.split.map(&:to_i)

  k.map do |n|
    a = [x]
    while a.size < n
      if a.size.even?
        a << a[-1] + d1
      else
        a << a[-1] + d2
      end
    end
    a[-1]
  end
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  3 7 -4
  5
  1
  2
  3
  4
  10
EOS
res1 = [3, -1, 6, 2, 11]
puts solve(in1)
