//MARK: - 题目
/*
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var res = nums[0]
        for i in nums {
            sum = sum > 0 ? sum + i : i
            if res < sum {
                res = sum
            }
        }
        return res
    }
}
//MARK: - 思路
/*
 动态递归：主要是利用逐步求解，以连续数组结束位置为每一步的解，sum其实就是记录了上一步骤的解，在这一步骤进行对比，如果上一步骤的解<0则舍弃。最终得到这一步骤解，与之前步骤解的最大值res进行比较，保存当前的最优解。
 */

