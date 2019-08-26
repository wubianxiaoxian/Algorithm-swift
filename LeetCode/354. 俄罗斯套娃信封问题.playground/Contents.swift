//MARK: - 题目
/*
 给定一些标记了宽度和高度的信封，宽度和高度以整数对形式 (w, h) 出现。当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。
 
 请计算最多能有多少个信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。
 
 说明:
 不允许旋转信封。
 
 示例:
 
 输入: envelopes = [[5,4],[6,4],[6,7],[2,3]]
 输出: 3
 解释: 最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/russian-doll-envelopes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    //二分法
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        var envelopes = envelopes
        var dp:[Int] = [Int]()
        envelopes.sort(by:sortArray)
        for i in 0..<envelopes.count {
            var left:Int = 0
            var right:Int = dp.count
            let t:Int = envelopes[i][1]
            while(left < right) {
                let mid:Int = left + (right - left) / 2
                if dp[mid] < t {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if right >= dp.count  {
                dp.append(t)
            } else {
                dp[right] = t
            }
        }
        return dp.count
    }
    
    func sortArray(_ a:[Int],_ b:[Int]) -> Bool
    {
        if a[0] == b[0] {
            return a[1] > b[1]
        }
        return a[0] < b[0]
    }
}

//MARK: - 思路
/*
 建立哈希表，从左向右扫描一遍，将整数与索引存放到map中。扫描一遍，对其中的每一个整数K，搜索 target-K 在map中是否存在即可。若存在，则输出 K 与 target-K 的下标即可。此算法的时间复杂度为O(n)
 */
