//MARK: - 题目
/*
 25. K 个一组翻转链表
 给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 
 https://leetcode.cn/problems/reverse-nodes-in-k-group/
 */


class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var a = head, b = head
        for i in 0..<k {
            if b == nil {
                return head
            }
            b = b?.next
        }
        var newHead = reverse(a, b)
        a?.next = reverseKGroup(b, k)
        return newHead
    }

    func reverse(_ a: ListNode?, _ b: ListNode?) -> ListNode?  {
        var pre: ListNode? = nil, cur = a, next = a
        while cur != b {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        //返回反转后的头结点
        return pre
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}
