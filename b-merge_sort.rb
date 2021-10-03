INPUT1 = <<~"EOS"
  10
  7 6 10 2 5 4 8 3 9 1
EOS
OUTPUT1 = <<~"EOS"
  1 2 3 4 5 6 7 8 9 10
  19
EOS

def merge_sort(ary, count = 0)
  # 要素が 1 個になるまで分割する
  al = ary.length
  return [ary, count] if al == 1

  mid = al / 2
  ary_l, cl = merge_sort(ary[..mid - 1])
  ary_r, cr = merge_sort(ary[mid..])
  count = cl + cr

  # 分割した要素を昇順で統合していく
  sorted_ary = []
  while ary_l.length > 0 || ary_r.length > 0
    sorted_ary <<
    if ary_l.length == 0
      count += 1
      ary_r.shift
    elsif ary_r.length == 0
      ary_l.shift
    elsif ary_l[0] > ary_r[0]
      count += 1
      ary_r.shift
    else
      ary_l.shift
    end
  end
  [sorted_ary, count]
end

def solve(input_lines)
  _, *ary = input_lines.split.map(&:to_i)
  sorted_ary, count = merge_sort(ary)
  [sorted_ary.join(" "), count]
end

puts solve(STDIN.read)
