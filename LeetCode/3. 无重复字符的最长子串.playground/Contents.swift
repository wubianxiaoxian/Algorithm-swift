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
        var s = Array(s)
        var window: [Character: Int] = [:]
        var left = 0, right = 0, res = 0
        while right < s.count {
            let c = s[right]
            right += 1
            if let count = window[c] {
                window[c] = count + 1
            } else {
                 window[c] =  1
            }
            while (window[c] ?? 0) > 1 {
                let d = s[left]
                left += 1
                if let count = window[d] {
                     window[d] = count - 1
                }
            }
          res = max(res, right - left)
        }
        return res
    }
}

