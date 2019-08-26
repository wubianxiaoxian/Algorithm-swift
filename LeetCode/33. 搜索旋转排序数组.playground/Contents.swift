//MARK: - 题目
/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 你可以假设数组中不存在重复的元素。
 你的算法时间复杂度必须是 O(log n) 级别。
 示例 1:
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var head = 0, tail = nums.count - 1
        while head <= tail {
            let mid = (head + tail) / 2
            if target == nums[mid] {
                return mid
            }
            // 左半段有序
            if (nums[head] <= nums[mid]) {
                // target 在 这段里
                if target >= nums[head] && target <= nums[mid] {
                    tail = mid - 1
                } else {
                    head = mid + 1
                }
            } else {
                // 右半段有序
                if target >= nums[mid] && target <= nums[tail] {
                    head = mid + 1
                } else {
                    tail = mid - 1
                }
            }
        }
        return -1
    }
}

