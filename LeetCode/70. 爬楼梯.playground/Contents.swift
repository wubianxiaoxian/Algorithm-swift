//MARK: - 题目
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 示例 1：

 输入：n = 2
 输出：2
 解释：有两种方法可以爬到楼顶。
 1. 1 阶 + 1 阶
 2. 2 阶
 示例 2：

 输入：n = 3
 输出：3
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 2 阶
 3. 2 阶 + 1 阶

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    /*
     复杂度分析：
     - 时间复杂度：`O(n)`，单循环到 n。
     - 空间复杂度：`O(n)`，dpdp 数组用了 n 的空间。
    */

    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var temp = Array(repeating: 0, count: n + 1)
        temp[1] = 1
        temp[2] = 2
        for i in 3..<temp.count {
            temp[i] = temp[i - 1] + temp[i - 2]
        }
        return temp[n]
    }
    
    /*
     优化
     根据推导公式不难发现,我们要求的结果就是数组的最后一项,而最后一项又是前面数值叠加起来的,那么我们只需要两个变量保存 `i - 1` 和 `i - 2` 的值就可以了.
     - 时间复杂度：O(n)，单循环到 n。
     - 空间复杂度：O(1)，用到了常量的空间。
     */
    
    
    func climbStairs1(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var first = 1
        var second = 2
        for i in 3...n {
             let thrid = first + second
             first = second
             second = thrid
        }
        return second
    }
}



