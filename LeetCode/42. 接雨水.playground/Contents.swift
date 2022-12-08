//MARK: - 题目
/*
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。
 示例:
 
 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 输出: 6
 
 在真实的面试中遇到过这道题？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/trapping-rain-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var lMax = 0, rMax = 0, res = 0
        while left < right {
            lMax = max(lMax, height[left])
            rMax = max(rMax, height[right])
            if lMax < rMax {
                res += lMax - height[left]
                left += 1
            } else {
                res += rMax - height[right]
                right -= 1
            }
        }
        return res
    }
}



var array  = [1, 2, 3]

//aaa.remove(at: 10)


for i in array {
//    print("value 1: \(i) array: \(array)")
    array.removeLast()
    print("value 0: \(i) array: \(array)")

}


