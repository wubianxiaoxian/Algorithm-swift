//MARK: - 题目
/*
 给定一个正整数数组 nums和整数 k ，请找出该数组内乘积小于 k 的连续的子数组的个数。

  

 示例 1:

 输入: nums = [10,5,2,6], k = 100
 输出: 8
 解释: 8 个乘积小于 100 的子数组分别为: [10], [5], [2], [6], [10,5], [5,2], [2,6], [5,2,6]。
 需要注意的是 [10,5,2] 并不是乘积小于100的子数组。
 示例 2:

 输入: nums = [1,2,3], k = 0
 输出: 0
  

 提示:

 1 <= nums.length <= 3 * 104
 1 <= nums[i] <= 1000
 0 <= k <= 106


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/ZVAVXX
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var s = nums
        var right = 0, left = 0, res = 0
        var tmp = 1
        while right < s.count {
            let c = s[right]
            tmp = tmp * c
            right += 1
            while left < right && tmp >= k {
                tmp = tmp / nums[left]
                left += 1
            }
           res = res + right - left
        }
        return res
    }
}
