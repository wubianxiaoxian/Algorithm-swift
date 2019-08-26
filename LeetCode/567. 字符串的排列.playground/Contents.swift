//MARK: - 题目
/*
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。
 换句话说，第一个字符串的排列之一是第二个字符串的子串。
 示例1:
 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 解释: s2 包含 s1 的排列之一 ("ba").
 示例2:
 输入: s1= "ab" s2 = "eidboaoo"
 输出: False
 注意：
 输入的字符串只包含小写字母
 两个字符串的长度都在 [1, 10,000] 之间
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutation-in-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var s1 = Array(s1)
        var s2 = Array(s2)
        let len1 = s1.count
        let len2 = s2.count
        if len1 > len2 { return false }
        let base = Character("a").asciiValue
        var count = Array(repeating: 0, count: 26)
        
        for i in 0..<len1 {
            count[s1[i].asciiValue - base] += 1
            count[s2[i].asciiValue - base] -= 1
        }
        
        if isAllZero(count) { return true }
        
        for i in len1..<len2 {
            count[s2[i].asciiValue - base] -= 1
            count[s2[i-len1].asciiValue - base] += 1
            if isAllZero(count) { return true }
        }
        return false
    }
    
    func isAllZero(_ arr: [Int]) -> Bool {
        for num in arr {
            if num != 0 { return false }
        }
        return true
    }
}

extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}


