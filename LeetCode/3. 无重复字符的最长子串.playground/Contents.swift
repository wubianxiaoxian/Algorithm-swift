//MARK: - 题目
/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 示例 1:
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var chars = Array(s)
        var map: [Character:Int] = [:]
        var maxValue = 0
        var res = 0
        for j in 0..<chars.count {
            if map.keys.contains(chars[j]) {
                maxValue = max(maxValue, map[chars[j]]!)
            }
            res = max(res, j - maxValue + 1)
            map[chars[j]] = j + 1
        }
        return res
    }
}

// 思路

/*
 1、定义字符串到索引的映射 map, Character 为 Key, j + 1 为 value
 2、判断 map.keys 是否包含 chars[j]，如果包含，则 maxValue = max(maxValue, map[chars[j]]!)
 3、res = max(res, j - maxValue + 1)
 4、Character 为 Key, j + 1 为 value, map[chars[j]] = j + 1
 */
class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        for (value, i) in nums.enumerated() {
            if value == 0 {
                nums.remove(at: i)
                nums.append(0)
            }
        }
    }
}

let aaa = [1, 2, 4]
for (i, value) in aaa.enumerated() {
    print("value: \(value)")
}

class People {
    var value: String
    required init(with value: String) {
        self.value = value
    }
    
    required convenience init(test: String) {
        self.init(with: test)
    }
}

class Student: People {
    required init(with value: String) {
        super.init(with: value)
        print("value: \(value)")
    }
    

}

let ss = Student.init(test: "sss")
