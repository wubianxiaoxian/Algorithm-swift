//MARK: - 题目
/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var arr:[Int] = []
        var node1 = l1
        while node1 != nil {
            arr.append(node1!.val)
            node1 = node1?.next
        }
        var node2 = l2
        while node2 != nil {
            arr.append(node2!.val)
            node2 = node2?.next
        }
        arr = arr.sorted()
        let head = ListNode.init(arr[0])
        var node:ListNode? = head
        for i in 1..<arr.count {
            node?.next = ListNode.init(arr[i])
            node = node?.next
        }
        return head
    }
}

/// 思路
/*
 遍历所有链表，将所有节点的值放到一个数组中。将这个数组排序，然后遍历所有元素得到正确顺序的值. 用遍历得到的值，创建一个新的有序链表。
 时间复杂度：O(Nlog⁡N)，其中 N 是节点的总数目。
 遍历所有的值需花费 O(N) 的时间。
 一个稳定的排序算法花费 O(Nlog⁡N) 的时间。
 遍历同时创建新的有序链表花费 O(N)的时间。
 空间复杂度：O(N)。
 */
