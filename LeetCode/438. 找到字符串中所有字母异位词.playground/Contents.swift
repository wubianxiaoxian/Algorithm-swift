//MARK: - 题目
/*
 给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。

 异位词 指由相同字母重排列形成的字符串（包括相同的字符串）。

  

 示例 1:

 输入: s = "cbaebabacd", p = "abc"
 输出: [0,6]
 解释:
 起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
 起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
  示例 2:

 输入: s = "abab", p = "ab"
 输出: [0,1,2]
 解释:
 起始索引等于 0 的子串是 "ab", 它是 "ab" 的异位词。
 起始索引等于 1 的子串是 "ba", 它是 "ab" 的异位词。
 起始索引等于 2 的子串是 "ab", 它是 "ab" 的异位词。
  

 提示:

 1 <= s.length, p.length <= 3 * 104
 s 和 p 仅包含小写字母

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/find-all-anagrams-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
          var need: [Character: Int] = [:], window: [Character: Int] = [:]
          var s = Array(s), t = Array(p)
          for c in t {
              if let count = need[c] {
                  need[c] = count + 1
              } else {
                  need[c] = 1
              }
          }
          var res: [Int] = []
          var left = 0, right = 0, valid = 0
          while right < s.count {
              let c = s[right]
              right += 1
              if need.keys.contains(c) {
                   if let count = window[c] {
                      window[c] = count + 1
                  } else {
                      window[c] = 1
                  }
                  if need[c] == window[c] {
                      valid += 1
                  }
              }

              while (right - left) >= t.count {
                  if valid == need.count {
                      res.append(left)
                  }
                  let d = s[left]
                  left += 1
                   if need.keys.contains(d) {
                      if need[d] == window[d] {
                          valid -= 1
                      }
                      if let count = window[d] {
                          window[d] = count - 1
                      }
                   }
              }
          }

          return res
      }
   
}
