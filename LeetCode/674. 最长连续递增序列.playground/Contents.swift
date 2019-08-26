//MARK: - 题目
/*
 给定一个未经排序的整数数组，找到最长且连续的的递增序列。
 
 示例 1:
 
 输入: [1,3,5,4,7]
 输出: 3
 解释: 最长连续递增序列是 [1,3,5], 长度为3。
 尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为5和7在原数组里被4隔开。
 
 示例 2:
 
 输入: [2,2,2,2,2]
 输出: 1
 解释: 最长连续递增序列是 [2], 长度为1。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-continuous-increasing-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count == 0  {
            return 0
        }
        var result = 1
        var maxValue = 1
        for i in 1..<nums.count {
            if nums[i] > nums[i-1] {
                maxValue += 1
            } else  {
                result = max(result, maxValue)
                maxValue = 1
            }
        }
        return max(result, maxValue)
    }
}
let kk = [1,3,5,4,7]
let s = Solution()
s.findLengthOfLCIS(kk)

//MARK: - 思路
/*
 过程： 1、count 为当前元素峰值，ans为最大峰值
       2、初始化 count = 1
       3、从 0 位置开始遍历，遍历时根据前后元素状态判断是否递增，递增则 count++，递减则 count=1
       4、如果 count>ans，则更新 ans，直到循环结束
       时间复杂度：O(N)
 */

