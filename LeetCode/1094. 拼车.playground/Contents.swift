//MARK: - 题目
/*
 车上最初有 capacity 个空座位。车 只能 向一个方向行驶（也就是说，不允许掉头或改变方向）

 给定整数 capacity 和一个数组 trips ,  trip[i] = [numPassengersi, fromi, toi] 表示第 i 次旅行有 numPassengersi 乘客，接他们和放他们的位置分别是 fromi 和 toi 。这些位置是从汽车的初始位置向东的公里数。

 当且仅当你可以在所有给定的行程中接送所有乘客时，返回 true，否则请返回 false。

  

 示例 1：

 输入：trips = [[2,1,5],[3,3,7]], capacity = 4
 输出：false
 示例 2：

 输入：trips = [[2,1,5],[3,3,7]], capacity = 5
 输出：true
  

 提示：

 1 <= trips.length <= 1000
 trips[i].length == 3
 1 <= numPassengersi <= 100
 0 <= fromi < toi <= 1000
 1 <= capacity <= 105


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/car-pooling
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var origin = [Int](repeating: 0, count: 1001)
        let diff = Difference()
        diff.difference(origin)
        for value in trips {
            diff.increment(value[1], value[2] - 1,value[0])
        }
        var res = diff.result()

        for i in res {
            if capacity < i {
                return false
            }
        }
        return true
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
