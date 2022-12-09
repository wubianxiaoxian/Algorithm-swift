//MARK: - 题目
/*
 给你一个字符串 s ，请你反转字符串中 单词 的顺序。

 单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。

 返回 单词 顺序颠倒且 单词 之间用单个空格连接的结果字符串。

 注意：输入字符串 s中可能会存在前导空格、尾随空格或者单词间的多个空格。返回的结果字符串中，单词间应当仅用单个空格分隔，且不包含任何额外的空格。

  

 示例 1：

 输入：s = "the sky is blue"
 输出："blue is sky the"
 示例 2：

 输入：s = "  hello world  "
 输出："world hello"
 解释：反转后的字符串中不能存在前导空格和尾随空格。
 示例 3：

 输入：s = "a good   example"
 输出："example good a"
 解释：如果两个单词间有多余的空格，反转后的字符串需要将单词间的空格减少到仅有一个。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/reverse-words-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func reverseWords(_ s: String) -> String {
        let kkk = removeSBank(s)
        var s = Array(kkk).map{"\($0)"}
        let n = s.count
        reverse(&s, 0, s.count - 1)
        var i = 0
        while i < n {
            for j in i..<n {
                if j + 1 == n || s[j + 1] == " " {
                    reverse(&s, i, j)
                    i = j + 2
                    break
                }
            }
        }
        return s.joined()
    }

    func removeSBank(_ s: String) -> String {
        let s = Array(s)
        var res: [String] = []
        for i in 0..<s.count {
            let c = s[i]
            if c != " " {
                res.append("\(c)")
            } else if !res.isEmpty && res[res.count - 1] != " " {
                res.append(" ")
            }
        }
        if res[res.count - 1] == " " {
            res.remove(at: res.count - 1)
        }
        
        return res.joined()
    }

    func reverse(_ arr: inout [String], _ i: Int, _ j: Int) {
        var i = i, j = j
        while i < j {
            let temp = arr[i]
            arr[i] = arr[j]
            arr[j] = temp
            i += 1
            j -= 1
        }
    }
}
