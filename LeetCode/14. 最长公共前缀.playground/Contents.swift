//MARK: - 题目
/*
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 
 说明:
 
 所有输入只包含小写字母 a-z 。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-common-prefix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */




class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var reslut = strs[0]
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(reslut) {
                reslut = String(reslut.prefix(reslut.count - 1))
                if reslut.count == 0 {
                    return ""
                }
            }
        }
        return reslut
    }
}

//MARK: - 思路
/*
 1、取出第一个字符串，使用后面的字符判断第一个字符串是不是他们的子字符串
 2、不是则将第一个字符串长度减一，继续判断
 3、如果 第一个字符串减到为 empty ，返回 "" ，无公共子串
 */

