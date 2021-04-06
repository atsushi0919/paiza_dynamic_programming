# 特殊な2項間漸化式 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step2

def solve(input_data)
  x, d1, d2, k = input_data.split.map(&:to_i)

  a = [x]
  while a.size < k
    if a.size.even?
      a << a[-1] + d1
    else
      a << a[-1] + d2
    end
  end
  a[-1]
end

#puts solve(STDIN.read)

in1 = "5 -7 10 5"
res1 = 11

in2 = "-675 464 153 146"
res2 = 43902
puts solve(in1)
