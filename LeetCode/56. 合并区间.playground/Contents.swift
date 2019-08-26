//MARK: - 题目
/*
 给出一个区间的集合，请合并所有重叠的区间。
 
 示例 1:
 
 输入: [[1,3],[2,6],[8,10],[15,18]]
 输出: [[1,6],[8,10],[15,18]]
 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 
 示例 2:
 
 输入: [[1,4],[4,5]]
 输出: [[1,5]]
 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-intervals
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res: [[Int]] = []
        if intervals.count == 0 {
            return []
        }
        var intervals = intervals.sorted { (a, b) -> Bool in
            return a[0] < b[0]
        }
        var i = 0
        while i < intervals.count {
            let left = intervals[i][0]
            var right = intervals[i][1]
            while (i < intervals.count - 1) && intervals[i + 1][0] <= right {
                i += 1
                right = max(right, intervals[i][1])
            }
            res.append([left, right])
             i += 1
        }
        return res
    }
}

//MARK: - 思路
/*
 先按首位置进行排序;
 接下来,判断两个区间是否重叠，当a[1] >= b[0]说明两个区间有重叠.
 左边位置一定是确定,就是a[0],而右边位置是max(a[1], b[1])
 所以,我们就能找出整个区间为:[1,4]
 */

//MARK: - Test






































