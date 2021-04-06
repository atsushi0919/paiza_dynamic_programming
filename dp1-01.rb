# 2項間漸化式 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step0

def solve(input_data)
  x, d, k = input_data.split.map(&:to_i)

  dp = [x]
  (k - 1).times do
    dp << dp[-1] + d
  end
  dp[-1]
end

#puts solve(STDIN.read)

in1 = "0 7 9\n"
res1 = 56
puts solve(in1)
