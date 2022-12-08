//MARK: - 题目
/*
 假设你有一个长度为 n 的数组，初始情况下所有的数字均为 0，你将会被给出 k​​​​​​​ 个更新的操作。

 其中，每个操作会被表示为一个三元组：[startIndex, endIndex, inc]，你需要将子数组 A[startIndex ... endIndex]（包括 startIndex 和 endIndex）增加 inc。

 请你返回 k 次操作后的数组。

 示例:

 输入: length = 5, updates = [[1,3,2],[2,4,3],[0,2,-2]]
 输出: [-2,0,3,5,3]
 解释:

 初始状态:
 [0,0,0,0,0]

 进行了操作 [1,3,2] 后的状态:
 [0,2,2,2,0]

 进行了操作 [2,4,3] 后的状态:
 [0,2,5,5,3]

 进行了操作 [0,2,-2] 后的状态:
 [-2,0,3,5,3]

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/range-addition
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        let  diff = Difference()
        let origin = [Int](repeating: 0, count: length)
        diff.difference(origin)
        for value in updates {
            print("value: \(value)")
            diff.increment(value[0], value[1], value[2])
        }
        return  diff.result()
    }
}

class Difference {
    var diff: [Int] = []
    func difference(_ nums: [Int]) {
        if nums.isEmpty {
            return
        }
        diff = [Int](repeating: 0, count: nums.count)
        diff[0] = nums[0]
        for i in 1..<nums.count {
            diff[i] = nums[i] - nums[i - 1]
        }
    }

    func increment(_ i: Int, _ j: Int, _ val: Int) {
        diff[i] += val
        if j + 1 < diff.count {
            diff[j + 1] -= val
        }
    }

    func result() -> [Int] {
        var res: [Int] = [Int](repeating: 0, count: diff.count)
        res[0] = diff[0]
        for i in 1..<diff.count {
            res[i] = res[i - 1] + diff[i]
        }
        return res
    }
}


Solution().getModifiedArray(5, [[1,3,2],[2,4,3],[0,2,-2]])

