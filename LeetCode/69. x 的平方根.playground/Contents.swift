//MARK: - 题目
/*
 实现 int sqrt(int x) 函数。
 
 计算并返回 x 的平方根，其中 x 是非负整数。
 
 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
 
 示例 1:
 
 输入: 4
 输出: 2
 
 示例 2:
 
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
 由于返回类型是整数，小数部分将被舍去。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func mySqrt(_ a: Int) -> Int {
        var x:Int = a
        while x * x > a {
            x = (x + a/x)/2
        }
        return x
    }
    func mySqrtTwo(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var left = 1
        var right = x / 2
        while left < right {
            let mid = (left + right + 1) >> 1
            let square = mid * mid
            if square > x {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
    
    
    func mySqrtThree(_ x: Int) -> Int {
        if x == 0 {
            return 0
        }
        var left = 1
        var right = x / 2
        while left < right {
            let mid = (left + right + 1) >> 1
            let square = mid * mid
            if square > x {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}


/*
 复杂度分析：
    时间复杂度：O(log⁡N)，二分法的时间复杂度是对数级别的。
    空间复杂度：O(1)，使用了常数个数的辅助空间用于存储和比较。
*/
