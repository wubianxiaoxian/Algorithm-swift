
/*
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 
 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 
 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
 
 
 
 示例 1:
 
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 
 示例 2:
 
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
 
 
 
 说明:
 
 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/


public class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

class Solution {
    private TreeNode ans;
    public Solution () {
        this.ans = null;
    }
    public boolean recurseTree(TreeNode currentNode, TreeNode p, TreeNode q) {
        // if reached the end of a branch, return false
        if (currentNode == null) {
            return false;
        }
        //left recursion, if left recursion returns true,set left = 1 else 0
        int left = this.recurseTree(currentNode.left, p, q) ? 1 : 0 ;
        //right recursion, if left recursion returns true,set right = 1 else 0
        int right = this.recurseTree(currentNode.right, p, q) ? 1 : 0 ;
        // if the current node is one of p or q
        int mid = (currentNode == p) || (currentNode == q) ? 1 : 0;
        // if any two of the flags left, right or mid become true
        if (mid + left + right >= 2) {
            this.ans = currentNode;
        }
        return (mid + left + right > 0);
    }
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        this.recurseTree(root, p, q);
        return this.ans;
    }
}


/*思路
 
 从根节点开始遍历树。
 如果当前节点本身是 p 或 q 中的一个，我们会将变量 mid 标记为 true，并继续搜索左右分支中的另一个节点。
 如果左分支或右分支中的任何一个返回 true，则表示在下面找到了两个节点中的一个。
 如果在遍历的任何点上，左、右或中三个标志中的任意两个变为 true，这意味着我们找到了节点 p 和 q 的最近公共祖先
*/
