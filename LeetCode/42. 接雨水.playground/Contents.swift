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
        var res = 0
        var leftMax = 0, rightMax = 0
        while left < right {
            if height[left] <= height[right] {
                if height[left] < leftMax {
                    left += leftMax - height[left]
                } else {
                    leftMax = height[left]
                }
                left += 1
            } else {
                if height[right] < rightMax {
                    res += rightMax - height[right]
                } else {
                    rightMax = height[right]
                }
                right -= 1
            }
        }
        return res
    }
}

//MARK: - 思路
/* 双指针
 暴力方法破解：用两个for循环，遍历两次数组，看有没有和是目标值的。时间复杂度 O(n^2)
 哈希查找：建立哈希表，从左向右扫描一遍，将整数与索引存放到map中。扫描一遍，对其中的每一个整数K，搜索 target-K 在map中是否存在即可。若存在，则输出 K 与 target-K 的下标即可。此算法的时间复杂度为O(n)
 */


var array  = [1, 2, 3]

//aaa.remove(at: 10)


for i in array {
//    print("value 1: \(i) array: \(array)")
    array.removeLast()
    print("value 0: \(i) array: \(array)")

}


