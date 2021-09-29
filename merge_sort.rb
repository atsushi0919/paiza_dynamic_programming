INPUT1 = <<~"EOS"
  10
  8 5 9 2 6 3 7 1 10 4
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
    # 比較回数
    count += 1

    sorted_ary <<
    if ary_l.length == 0
      ary_r.shift
    elsif ary_r.length == 0
      ary_l.shift
    elsif ary_l[0] > ary_r[0]
      ary_r.shift
    else
      ary_l.shift
    end
  end
  [sorted_ary, count]
end

ary = [8, 5, 9, 2, 6, 3, 7, 1, 4]

p merge_sort(ary)
