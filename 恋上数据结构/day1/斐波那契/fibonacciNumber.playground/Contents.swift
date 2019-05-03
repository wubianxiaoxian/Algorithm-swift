/*
 斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.

 给定 N，计算 F(N)
 */

func fib(_ N: Int) -> Int {
    if N == 0 {
        return 0
    }
    if N == 1 {
        return 1
    }
    var first = 0
    var second = 1
    for _ in 1...(N - 1) {
        second += first
        first = second - first
    }
    return second
}

print(fib(20))
