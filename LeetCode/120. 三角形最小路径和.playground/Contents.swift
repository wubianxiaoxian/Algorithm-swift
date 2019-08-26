//MARK: - 题目
/*
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 
 例如，给定三角形：
 
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 说明：
 
 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/triangle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var resultTriangle = triangle
        let count = resultTriangle.count
        if count < 1 {
            return 0
        }
        if count == 1 {
            return resultTriangle[0][0]
        }
        var i = count - 2
        while i >= 0  {
            for j in 0..<resultTriangle[i].count {
                let minValue =  min(resultTriangle[i + 1][j], resultTriangle[i + 1][j + 1]) + resultTriangle[i][j]
                resultTriangle[i][j] = minValue
            }
            i -= 1
        }
        return resultTriangle[0][0]
    }
}
//MARK: - 思路
/*
（如果你只用额外空间复杂度O(n)的条件）
 1、从顶部到底部的最小路径和等于从底部到顶部的最小路径和
 2、从倒数第二层开始，从底层到每一层每个数字的最小路径长度等于，从底层到该层的下层相邻数字的最小路径长度中的较小值，加上该层该数字的值。
 */
