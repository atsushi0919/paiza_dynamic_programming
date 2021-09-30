INPUT1 = <<~"EOS"
  10
  7 6 10 2 5 4 8 3 9 1
EOS
OUTPUT1 = <<~"EOS"
  1 2 3 4 5 6 7 8 9 10
  19
EOS

def merge(ary, left, mid, right)
  # 2つの部分データ列のサイズ
  nl = mid - left
  nr = right - mid

  # コピー & 番兵
  ary_l = 0.upto(nl - 1).map { |i| ary[left + i] } << Float::INFINITY
  ary_r = 0.upto(nr - 1).map { |i| ary[mid + i] } << Float::INFINITY

  # 2つの部分データ列をマージして ary[left] ~ A[right-1] に書き込む
  lindex = 0
  rindex = 0
  left.upto(right - 1) do |i|
    if ary_l[lindex] < ary_r[rindex]
      ary[i] = ary_l[lindex]
      lindex += 1
    else
      ary[i] = ary_r[rindex]
      rindex += 1
      $count += 1
    end
  end
  ary
end

def merge_sort(ary, left, right)
  if left + 1 < right
    mid = (left + right) / 2

    merge_sort(ary, left, mid)
    merge_sort(ary, mid, right)
    ary = merge(ary, left, mid, right)
  end
  ary
end

def solve(input_lines)
  n, *ary = input_lines.split.map(&:to_i)

  $count = 0
  [merge_sort(ary, 0, n).join(" "), $count].join("\n")
end

puts solve(STDIN.read)

=begin
マージソート (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sort_efficient/sort_efficient__merge
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
マージソート (昇順) は、データ列を二分し、それぞれをマージソートした後それらを「マージ (統合) 」することを繰り返すソートアルゴリズムです。マージソートは、問題を小さな問題に分割して解くことを繰り返すことによって元の問題の答えを得る手法である「分割統治法」に基づいたアルゴリズムです。

マージソート (昇順) は以下のようなアルゴリズムです。データ列を二分してマージソートを行う merge_sort と、昇順にソートされた2つの部分データ列をマージする merge から成ります。


// アルゴリズムが正しく実装されていることを確認するために導入するカウンタ変数、ソート処理には関係がないことに注意
count <- 0

/**
    部分データ列 A[left] ~ A[mid-1], A[mid] ~ A[right-1] はそれぞれ整列済み
    2つの部分データ列をマージし、A[left] ~ A[right-1] を整列済みにする
*/
merge(A : 配列, left : 整数, mid : 整数, right : 整数)
    // 2つの部分データ列のサイズ
    nl <- mid-left
    nr <- right-mid

    // 部分データ列をコピー
    for i = 0 to nl-1
        L[i] <- A[left+i]
    for i = 0 to nr-1
        R[i] <- A[mid+i]
    
    // 番兵
    L[nl] <- INF
    R[nr] <- INF
    
    // 2つの部分データ列をマージして A[left] ~ A[right-1] に書き込む
    lindex <- 0
    rindex <- 0

    for i = left to right-1
        if L[lindex] < R[rindex] then
            A[i] <- L[lindex]
            lindex++
        else
            A[i] <- R[rindex]
            rindex++
            count++

/**
    A[left] ~ A[right-1] をマージソートする
    配列 A をマージソートするには merge_sort(A, 0, n) を呼び出す
*/
merge_sort(A : 配列, left : 整数, right : 整数)
    if left+1 < right
        mid = (left + right) / 2
        merge_sort(A, left, mid)
        merge_sort(A, mid, right)
        merge(A, left, mid, right)


このプログラムでは番兵と呼ばれるテクニックを使っています。
これは、処理を行う範囲の境界部分に特殊なデータを置いておくことで、プログラムをすっきりさせるテクニックです。
番兵を使わずに上のプログラムを書こうとすると、データ列をマージする処理において
lindex や rindex がそれぞれ nl, nr 未満であるかどうかを確かめながら複雑な条件分岐の処理を書く必要が出てきます。
今回は、入力の最大値より大きい数 INF を2つのデータ列の末尾に配置することで、番兵を実現しています。

マージソートの計算量を考えます。merge_sort ではデータ列を2つに分割していますが、
この分割は入力されるデータ列のサイズ n に対して約 log n 段行われます (上図参照) 。
そして、各段のマージに合計 O(n) かかるため、マージソート全体の計算量は O(n log n) です。



では、要素数 n の数列を昇順にソートするマージソートのプログラムを、上の疑似コードに従って実装してください。アルゴリズムが正しく実装されていることを確認するために、数列をソートした結果に加え、マージソート後の count の値を出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
n
A_1 A_2 ... A_n

・ 入力はすべて整数
・ 1行目に、数列の要素数 n が与えられます。
・ 2行目に、数列の要素 A_1, A_2, ... , A_n が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
2行出力してください。
1行目に、ソート後の数列 A' の各要素を半角スペース区切りで出力してください。
2行目に、count を出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。


A'_1 A'_2 ... A'_n
count
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n ≦ 500,000
・ -1,000,000,000 ≦ A_i ≦ 1,000,000,000 (1 ≦ i ≦ n)

入力例1
10
7 6 10 2 5 4 8 3 9 1

出力例1
1 2 3 4 5 6 7 8 9 10
19
=end
