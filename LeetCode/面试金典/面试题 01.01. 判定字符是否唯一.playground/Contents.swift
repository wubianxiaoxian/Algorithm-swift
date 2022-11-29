//MARK: - 题目
/*
 实现一个算法，确定一个字符串 s 的所有字符是否全都不同。

 示例 1：

 输入: s = "leetcode"
 输出: false
 示例 2：

 输入: s = "abc"
 输出: true
 限制：

 0 <= len(s) <= 100
 s[i]仅包含小写字母
 如果你不使用额外的数据结构，会很加分。
 通过次数137,855提交次数193,477

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/is-unique-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func isUnique(_ astr: String) -> Bool {
        var s = astr
        for i in astr {
            s.removeFirst()
            if s.contains(i) {
                return false
            }
        }
        return true
    }
}

let str = "leetcode"
let str1 = "abc"

let solution = Solution()
solution.isUnique(str)
solution.isUnique(str1)

