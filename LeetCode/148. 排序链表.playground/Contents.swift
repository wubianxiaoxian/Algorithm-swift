//MARK: - 题目
/*
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 
 示例 1:
 
 输入: 4->2->1->3
 输出: 1->2->3->4
 
 示例 2:
 
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var arr:[Int] = []
        var node = head
        while node != nil {
            arr.append(node!.val)
            node = node?.next
        }
        arr = arr.sorted()
        let heaeNew = ListNode.init(arr[0])
        var tmpNode:ListNode? = heaeNew
        for i in 1..<arr.count {
            tmpNode?.next = ListNode.init(arr[i])
            tmpNode = tmpNode?.next
        }
        return heaeNew
    }
}

/// 思路
/*
 遍历所有链表，将所有节点的值放到一个数组中。
 将这个数组排序，然后遍历所有元素得到正确顺序的值。
 用遍历得到的值，创建一个新的有序链表。
时间复杂度：O(Nlog⁡N)，其中 N 是节点的总数目。
 
 遍历所有的值需花费 O(N) 的时间。
 一个稳定的排序算法花费 O(Nlog⁡N) 的时间。
 遍历同时创建新的有序链表花费 O(N)的时间。
 空间复杂度：O(N)。
 */
