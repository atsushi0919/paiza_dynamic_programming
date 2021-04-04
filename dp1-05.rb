# 3項間漸化式 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_recursive_formula_step4

def solve(input_data)
  k = input_data.to_i

  dp = []
  (1..k).each do |n|
    dp <<= n > 2 ? dp[-2] + dp[-1] : 1
  end
  dp[-1]
end

#puts solve(STDIN.read)

in1 = "7\n"
res1 = 13
puts solve(in1)
