INPUT1 = <<~"EOS"
  10
  8 5 9 2 6 3 7 1 10 4
EOS

def merge_sort(ary, count = 0)
  # 要素が 1 個になるまで分割する
  al = ary.length
  return [ary, count] if al == 1

  mid = al / 2
  ary_l, cl = merge_sort(ary[..mid - 1], count)
  ary_r, cr = merge_sort(ary[mid..], count)
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
  p [sorted_ary, count]
  [sorted_ary, count]
end

ary = [8, 5, 9, 2, 6, 3, 7, 1, 4]
p merge_sort(ary)
#merge_sort([8, 5, 9, 2, 6, 3, 7, 1, 10])

=begin
マージソート
マージソート（Merge Sort）は分割統治法に基づく高速なアルゴリズムで、次のように実装することができます。

merge(A, left, mid, right)
  n1 = mid - left;
  n2 = right - mid;
  L[0...n1], R[0...n2] を生成
  for i = 0 to n1-1
    L[i] = A[left + i]
  for i = 0 to n2-1
    R[i] = A[mid + i]
  L[n1] = INFTY
  R[n2] = INFTY
  i = 0
  j = 0
  for k = left to right-1
    if L[i] <= R[j]
      A[k] = L[i]
      i = i + 1
    else 
      A[k] = R[j]
      j = j + 1

mergeSort(A, left, right)
  if left+1 < right
    mid = (left + right)/2;
    mergeSort(A, left, mid)
    mergeSort(A, mid, right)
    merge(A, left, mid, right)
n 個の整数を含む数列 S を上の疑似コードに従ったマージソートで昇順に整列するプログラムを作成してください。また、mergeにおける比較回数の総数を報告してください。

入力
１行目に n、２行目に S を表す n 個の整数が与えられます。

出力
１行目に整列済みの数列 S を出力してください。数列の隣り合う要素は１つの空白で区切ってください。２行目に比較回数を出力してください。

制約
n≤500,000
0≤Sの要素≤109
入力例 1
10
8 5 9 2 6 3 7 1 10 4
出力例 1
1 2 3 4 5 6 7 8 9 10
34

def msort(a)
  l = a.length
  if l <= 1
    return a
  end
  al = msort(a[0..((l-1)/2)])
  ar = msort(a[((l+1)/2)..(l-1)])
  i = 0
  while i < l do
    if al[0] < ar[0]
      a[i] = al.shift
    else
      a[i] = ar.shift
    end
    i += 1
    if al.length == 0
      while i < l do
        a[i] = ar.shift
        i += 1
      end
    elsif ar.length == 0
      while i < l do
        a[i] = al.shift
        i += 1
      end
    end
  end
  return a
end
=end
