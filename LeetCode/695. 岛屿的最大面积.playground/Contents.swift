//MARK: - 题目
/*
 给定一个包含了一些 0 和 1的非空二维数组 grid , 一个 岛屿 是由四个方向 (水平或垂直) 的 1 (代表土地) 构成的组合。你可以假设二维矩阵的四个边缘都被水包围着。
 找到给定的二维数组中最大的岛屿面积。(如果没有岛屿，则返回面积为0。)
 示例 1:
 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 对于上面这个给定矩阵应返回 6。注意答案不应该是11，因为岛屿只能包含水平或垂直的四个方向的‘1’。
 示例 2:
 [[0,0,0,0,0,0,0,0]]
 对于上面这个给定的矩阵, 返回 0。
 注意: 给定的矩阵grid 的长度和宽度都不超过 50。
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/max-area-of-island
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var array = grid
        var maxArea = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    maxArea = max(maxArea, dfs(&array, i: i, j: j))
                }
            }
        }
        return maxArea
    }
    
    //dfs的实现，需要更改数组，所有参数是 inout 类型
    func dfs(_ grid:inout [[Int]], i: Int, j: Int) -> Int {
        //判断是否越界和数字是否为0，这个是递归结束的条件
        if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count || grid[i][j] == 0 {
            return 0
        }
        var temMaxArea = 1
        grid[i][j] = 0 //遍历后的置为 0
        //递归查询上下左右四个
        temMaxArea = temMaxArea + dfs(&grid, i: i - 1, j: j)
                                + dfs(&grid, i: i + 1, j: j)
                                + dfs(&grid, i: i, j: j - 1)
                                + dfs(&grid, i: i, j: j + 1)
        return temMaxArea
    }
}

//MARK: - 思路
/*
 利用DFS求解
 */
