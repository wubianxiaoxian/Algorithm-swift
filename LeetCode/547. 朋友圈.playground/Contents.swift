//MARK: - 题目
/*
 班上有 N 名学生。其中有些人是朋友，有些则不是。他们的友谊具有是传递性。如果已知 A 是 B 的朋友，B 是 C 的朋友，那么我们可以认为 A 也是 C 的朋友。所谓的朋友圈，是指所有朋友的集合。
 
 给定一个 N * N 的矩阵 M，表示班级中学生之间的朋友关系。如果M[i][j] = 1，表示已知第 i 个和 j 个学生互为朋友关系，否则为不知道。你必须输出所有学生中的已知的朋友圈总数。
 
 示例 1:
 
 输入:
 [[1,1,0],
 [1,1,0],
 [0,0,1]]
 输出: 2
 说明：已知学生0和学生1互为朋友，他们在一个朋友圈。
 第2个学生自己在一个朋友圈。所以返回2。
 
 示例 2:
 
 输入:
 [[1,1,0],
 [1,1,1],
 [0,1,1]]
 输出: 1
 说明：已知学生0和学生1互为朋友，学生1和学生2互为朋友，所以学生0和学生2也是朋友，所以他们三个在一个朋友圈，返回1。
 
 注意：
 
 N 在[1,200]的范围内。
 对于所有学生，有M[i][i] = 1。
 如果有M[i][j] = 1，则有M[j][i] = 1。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/friend-circles
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        //二维数组长度，即所有人的个数
        let length = M.count
        //统计朋友圈个数
        var count = 0
        //访问标志
        var flag = Array(repeating: false, count: length)
        //对于每个人
        for i in 0...(length - 1) {
            //如果未被访问
            if flag[i] == false {
                //深度优先搜索，访问
                dfs(i, m: M, flag: &flag)
                count += 1
            }
        }
        return count
    }
    
    func dfs(_ i: Int, m: [[Int]], flag: inout [Bool])  {
        for j in 0...(m.count - 1) {
            if flag[j] == false && m[i][j] == 1 {
                flag[j] = true
                dfs(j, m: m, flag: &flag)
            }
        }
    }
}

//MARK: - 思路
/*
 1、定义朋友圈 count
 2、定义数组 flag = Array(repeating: false, count: length)  标记当前位置是否被访问，默认没有被访问
 3、for 循环 0..<count ,如果未被访问，进行 dfs 遍历，同时 count += 1
 3、dfs 深度优先搜索 0..<M.count ，如果当前位置未被访问，且[i][j] == 1，标记当前位置，继续搜索

 */

//MARK: - Test
