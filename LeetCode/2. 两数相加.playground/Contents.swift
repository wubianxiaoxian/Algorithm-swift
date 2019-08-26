//MARK: - 题目
/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 示例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = ListNode(0)
        var carrry = 0
        var head = result
        var l1 = l1
        var l2 = l2
        while l1 != nil || l2 != nil {
            let sum = l1?.val ?? 0  + (l2?.val ?? 0) + carrry
            carrry = sum / 10
            head.next = ListNode(sum % 10)
            head = head.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        while carrry > 0  {
            head.next = ListNode(carrry)
        }
        return result.next
    }
}

// 思路

/*
 1.遍历两个表node
 2.计算新表node点sum value
 3.由于第一个节点不需要计算carry值，导致逻辑不一致，故先默认创建一个初始node
 4.最后添加进位产生的新node
 5.返回新建node.next指向的表（不包含初始node）
  */
