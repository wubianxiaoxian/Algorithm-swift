//MARK: - 题目
/*
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。
 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 
 给定 n 和 k，返回第 k 个排列。
 
 说明：
 
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 
 示例 1:
 
 输入: n = 3, k = 3
 输出: "213"
 
 示例 2:
 
 输入: n = 4, k = 9
 输出: "2314"
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutation-sequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func getPermutation(_ num: Int, _ kth: Int) -> String {
        guard num > 1 else {
            return "1"
        }
        //1、算出阶乘表，存储到数组，存储 n 的范围 [1, 9] 到数组
        var vals: [Int] = Array(repeating: 1, count: 9)
        var nums: [Int] = Array(repeating: 1, count: 9)
        var kth = kth - 1
        for idx in 0...8 {
            vals[idx] = idx == 0 ? 1 : vals[idx - 1] * (idx + 1)
            nums[idx] = idx + 1
        }
        var result = ""
        //2、逆序，按照位数用 k 对对应位数的阶乘取商，把得到的商，添加到 result
        //3、在 nums中移除用到的数字
        for idx in (0...num - 2).reversed() {
            let iidx = kth / vals[idx]
            result.append(String(nums[iidx]))
            nums.remove(at: iidx)
            kth %= vals[idx]
        }
        result.append(String(nums[0]))
        return result
    }
}

let k = Solution()
k.getPermutation(4, 9)
//MARK: - 思路
/*
 1、假如n=4，k=9，那么每个数字开头的有(4-1)!=6种排列（如1234，1243，1324...），我们可以用k对6取余，j=k/6=1，将k更新为余数k=3，看第k个排列的第一个数字是num[1]=2，将其从num提取出来保存，并更新num=[1,3,4]；
 确定好第一个数字后确定第二个数字，第二个数字的排列有(4-2)!=2种，我们再用k对2取余，j=k/2=1，将k更新为余数k=1，从剩余的num中提取第二个数num[2]=3；
 因为(4-3)!=1比较特殊（即循环中第一个if），进行到次步说明只剩下两个数没有确度了，所以此时先将第三个数num[0]=1从num提取出来，更新num，再将num中最后一个数添加到re中，即得到最后结果。
 */


