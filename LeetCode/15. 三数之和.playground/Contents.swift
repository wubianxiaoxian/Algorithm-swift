//MARK: - 题目
/*
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 2 {
            return  [[Int]]()
        }
        var tNums = nums.sorted()
        var res = [[Int]]()
        for i  in 0..<tNums.count - 2 {
            //为了保证不加入重复的 list,因为是有序的，所以如果和前一个元素相同，只需要继续后移就可以
            if i == 0 || (i > 0 && tNums[i] != tNums[i-1]) {
                //加入两个指针，头指针从 i + 1 开始，防止加入重复的元素
                var head = i + 1
                var tail = tNums.count - 1
                let sum = 0 - tNums[i]
                while head < tail {
                    if (tNums[head] + tNums[tail] == sum) {
                        res.append([tNums[i], tNums[head], tNums[tail]])
                        //相同元素要后移，防止加入重复的 list
                        while head < tail && tNums[head] == tNums[head + 1] {
                            head += 1
                        }
                        while head < tail && tNums[tail] == tNums[tail - 1] {
                            tail -= 1
                        }
                        head += 1
                        tail -= 1
                    } else if (tNums[head] + tNums[tail] < sum) {
                        head += 1
                    } else {
                        tail -= 1
                    }
                }
            }
        }
        return res
    }
}

//MARK: - 思路
/*
 主要思想是，遍历数组，用 0 减去当前的 object ，作为 sum ，然后再找两个 object 使得和为 sum
 这样遍历需要 O（n），再找两个数需要 O（n²）的复杂度还是需要 O（n³）。
 所以可以将给定的 num 排序， 然后用两个指针，一个指向头，一个指向尾，去找这两个 object ，这样的话，找另外两个数时间复杂度就会从 O（n²），降到 O（n）。
 */

//MARK: - Test


