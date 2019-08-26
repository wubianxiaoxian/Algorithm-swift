//MARK: - 题目
/*
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 
 示例:
 
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/restore-ip-addresses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var res = [String]()
        let sArray = Array(s)
        let count = sArray.count
        //i < 4 保证第一部分不超过 3 位数
        //i + 2 < count，保证剩余的字符串还能分成 3 部分
        var i = 1
        while i < 4 && i < count - 2 {
            // j < i + 4 保证第二部分不超过 3 位数
            //j + 1 < count，保证剩余的字符串还能分成 2 部分
            var j = i + 1
            while j < i + 4 && j < count - 1 {
                // k < j + 4 保证第三部分不超过 3 位数
                //k < count，保证剩余的字符串还能分成 1 部分
                var k = j + 1
                while k < j + 4 && k < count {
                    let s1 = String(s.prefix(i))
                    let iIndex = s.index(s.startIndex, offsetBy: i)
                    let jndex  = s.index(s.startIndex, offsetBy: j)
                    let kndex =  s.index(s.startIndex, offsetBy: k)
                    let lenndex = s.index(s.startIndex, offsetBy: count)
                    let s2 = String(s[iIndex..<jndex])
                    let s3 = String(s[jndex..<kndex])
                    let s4 = String(s[kndex..<lenndex])
                    if isValid(s1) && isValid(s2) && isValid(s3) && isValid(s4) {
                        let str = s1 + "." + s2 + "." + s3 + "." + s4
                        res.append(str)
                    }
                    k += 1
                }
                j += 1
            }
            i += 1
        }
        return res
    }
    
    func isValid(_ s: String) -> Bool {
        if s.count > 3 || s.count == 0 || s.hasPrefix("0") && s.count > 1 || Int(s)! > 255 {
            return false
        }
        return true
    }
}


let ss = "101234"

let s = Solution()

s.restoreIpAddresses("25525511135")
//MARK: - 思路
/*
 1、直接用利用三个指针将字符串强行分为四部分，遍历所有的划分，然后选取合法的解。
 2、时间复杂度：如果不考虑我们调用的内部函数，Integer.parseInt，s.substring，那么就是 O（1）。因为每一层循环最多遍历 4 次。考虑的话每次调用的时间复杂度是 O（n），常数次调用，所以是 O（n）。
 空间复杂度：O（1）。
 */

