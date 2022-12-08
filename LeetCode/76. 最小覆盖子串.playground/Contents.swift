//MARK: - 题目
/*
 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。

  

 注意：

 对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
 如果 s 中存在这样的子串，我们保证它是唯一的答案。
  

 示例 1：

 输入：s = "ADOBECODEBANC", t = "ABC"
 输出："BANC"
 示例 2：

 输入：s = "a", t = "a"
 输出："a"
 示例 3:

 输入: s = "a", t = "aa"
 输出: ""
 解释: t 中两个字符 'a' 均应包含在 s 的子串中，
 因此没有符合条件的子字符串，返回空字符串。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/minimum-window-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = Array(s), t = Array(t)
        var need: [Character: Int] = [:], window: [Character: Int] = [:]
        for c in t {
            if let count = need[c] {
                need[c] = count + 1
            } else {
                need[c] = 1
            }
        }
        var left = 0, right = 0, valid = 0
        // 记录最小覆盖子串的起始索引和长度
        var start = 0, len = Int.max
        while right < s.count {
            // c 是将移入窗口的字符
            let c = s[right]
            right += 1
            if need.keys.contains(c) {
                if let count = window[c] {
                    window[c] = count + 1
                } else {
                    window[c] = 1
                }
                if window[c] == need[c] {
                    valid += 1
                }
            }
            // 判断左侧窗口是否要收缩
            while valid == need.count {
                //在这里更新最小覆盖子串
                let curLen = right - left
                if curLen < len {
                    start = left
                    len = curLen
                }
                // d 是将要移除窗口的字符
                let d = s[left]
                //缩小窗口
                left += 1
                //进行窗口内数据的一系列更新
                if need.keys.contains(d) {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    if let count = window[d] {
                        window[d] = count - 1
                    }
                }
            }
        }
       
        return String(len == Int.max ? "" : String(s[start..<(start + len)]))
    }
}


let test = Solution()

test.minWindow("ADOBECODEBANC", "ABC")
