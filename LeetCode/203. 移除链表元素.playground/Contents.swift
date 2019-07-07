//MARK: - 题目
/*
 删除链表中等于给定值 val 的所有节点。
 
 示例:
 
 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-linked-list-elements
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        if head?.next == nil {
            if head?.val == val {
                return head?.next
            }
            return head
        }
        var slow = head
        var fast = head?.next
        while fast != nil {
            if fast?.val == val {
                fast = fast?.next
                slow?.next = fast
            } else {
                fast = fast?.next
                slow = slow?.next
            }
        }
        if head?.val == val {
            return head?.next
        }
        return head
    }
}

//MARK: - 思路
// 快慢指针

