//MARK: - 题目
/*
 给定一个整数数组 A，只有我们可以将其划分为三个和相等的非空部分时才返回 true，否则返回 false。
 
 形式上，如果我们可以找出索引 i+1 < j 且满足 (A[0] + A[1] + ... + A[i] == A[i+1] + A[i+2] + ... + A[j-1] == A[j] + A[j-1] + ... + A[A.length - 1]) 就可以将数组三等分。
 
 
 
 示例 1：
 
 输出：[0,2,1,-6,6,-7,9,1,2,0,1]
 输出：true
 解释：0 + 2 + 1 = -6 + 6 - 7 + 9 + 1 = 2 + 0 + 1
 
 示例 2：
 
 输入：[0,2,1,-6,6,7,9,-1,2,0,1]
 输出：false
 
 示例 3：
 
 输入：[3,3,6,5,-2,2,5,1,-9,4]
 输出：true
 解释：3 + 3 = 6 = 5 - 2 + 2 + 5 + 1 - 9 + 4
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-array-into-three-parts-with-equal-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
       var sum = 0
        for i in A {
            sum += i
        }
        var key = sum / 3
        var temp = 0
        for i in 0..<A.count {
            key -= A[i]
            if key == 0 {
                temp += 1
                key = sum / 3
            }
        }
        if temp == 3 {
            return true
        } else {
            return false
        }
    }
}

