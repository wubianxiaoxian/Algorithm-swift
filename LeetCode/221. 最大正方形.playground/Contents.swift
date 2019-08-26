//MARK: - 题目
/*
 在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
 示例:
 输入:
 
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 
 输出: 4
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximal-square
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        let m = matrix.count
        let n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        var maxsqlen = 0
        for i in 1...m {
            for j in 1...n {
                if matrix[i-1][j-1] == "1" {
                    dp[i][j] = min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1]) + 1
                    maxsqlen = max(maxsqlen, dp[i][j])
                }
            }
        }
        return maxsqlen * maxsqlen
    }
}
//MARK: - 思路
/*
 我们用 0 初始化另一个矩阵 dp，维数和原始矩阵维数相同；
 dp(i,j) 表示的是由 1 组成的最大正方形的边长；
 从 (0,0)(0,0)(0,0) 开始，对原始矩阵中的每一个 1，我们将当前元素的值更新为
 
 dp(i, j)= min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1])
 
 我们还用一个变量记录当前出现的最大边长，这样遍历一次，找到最大的正方形边长 maxsqlen，那么结果就是 maxsqlen * maxsqlen 。
 */
