//MARK: - 题目
/*
 面试题 01.02. 判定是否互为字符重排
 给定两个由小写字母组成的字符串 s1 和 s2，请编写一个程序，确定其中一个字符串的字符重新排列后，能否变成另一个字符串。

 示例 1：

 输入: s1 = "abc", s2 = "bca"
 输出: true
 示例 2：

 输入: s1 = "abc", s2 = "bad"
 输出: false
 说明：

 0 <= len(s1) <= 100
 0 <= len(s2) <= 100
 
 https://leetcode.cn/problems/check-permutation-lcci/
 */


class Solution {
    func CheckPermutation(_ s1: String, _ s2: String) -> Bool {
        return s1.sorted{ $0 < $1 } == s2.sorted{ $0 < $1 }
    }
}

let str = "leetcode"
let str1 = "abc"

let solution = Solution()


func threeSum(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var sorted = nums
    sorted.sort()
    for i in 0..<sorted.count {
        if sorted[i] > 0 {
            return res
        }
        if i > 0 && sorted[i] == sorted[i - 1] {
            continue
        }
        var left = i + 1
        var right = sorted.count - 1
        while left < left {
            let sum = sorted[i] + sorted[left] + sorted[right]
            if sum < 0 {
                left += 1
            } else if sum > 0 {
                right -= 1
            } else {
                res.append([sorted[i], sorted[left], sorted[right]])
                while left < right && sorted[left] == sorted[left + 1] {
                    left += 1
                }
                
                while left < right && sorted[right] == sorted[right - 1] {
                    right -= 1
                }
                left += 1
                right -= 1
            }
        }
    }
    return res
}

func threeSum(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    var sorted = nums
    sorted.sort()
    for i in 0 ..< sorted.count {
        if sorted[i] > 0 {
            return res
        }
        if i > 0 && sorted[i] == sorted[i - 1] {
            continue
        }
        var left = i + 1
        var right = sorted.count - 1
        while left < right {
            let sum = sorted[i] + sorted[left] + sorted[right]
            if sum < 0 {
                left += 1
            } else if sum > 0 {
                right -= 1
            } else {
                res.append([sorted[i], sorted[left], sorted[right]])
                
                while left < right && sorted[left] == sorted[left + 1] {
                    left += 1
                }
                while left < right && sorted[right] == sorted[right - 1] {
                    right -= 1
                }
                
                left += 1
                right -= 1
            }
        }
    }
    return res
}
