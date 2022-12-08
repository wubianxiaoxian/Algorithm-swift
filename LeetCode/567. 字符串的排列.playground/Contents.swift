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
       let s = Array(s2), t = Array(s1)
        var needs: [Character: Int] = [:], window: [Character: Int] = [:]
        for c in t {
            if let count = needs[c] {
               needs[c] = count + 1
            } else {
                needs[c] = 1
            }
        }
        var left = 0, right = 0, valid = 0
        // 记录最小覆盖子串的起始索引和长度
        while right < s.count {
            // c 是将移入窗口的字符
            let c = s[right]
            right += 1
            if needs.keys.contains(c) {
                if let count = window[c] {
                    window[c] = count + 1
                } else {
                    window[c] = 1
                }
                if window[c] == needs[c] {
                    valid += 1
                }
            }
            // 判断左侧窗口是否要收缩
            while (right - left) >= t.count {
                //在这里更新最小覆盖子串
                if valid == needs.count {
                    return true
                }
                // d 是将要移除窗口的字符
                let d = s[left]
                //缩小窗口
                left += 1
                //进行窗口内数据的一系列更新
                if needs.keys.contains(d) {
                    if window[d] == needs[d] {
                        valid -= 1
                    }
                    if let count = window[d] {
                        window[d] = count - 1
                    }
                }
            }
        }
        return false
    }
}
