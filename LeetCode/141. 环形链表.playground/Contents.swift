//MARK: - 题目
/*
 给定一个链表，判断链表中是否有环。
 
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 
 
 
 示例 1：
 
 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 
 示例 2：
 
 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/linked-list-cycle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class ListNode<T> : Equatable where T : Equatable {
    static func == (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        return lhs.element == rhs.element && lhs.next == rhs.next
    }
    var element:T!
    var next:ListNode<T>!
    init(_ element : T, next:ListNode? = nil) {
        self.element = element
        self.next = next
    }
}
// 思路，快慢指针
class Solution<T> where T : Equatable {
    /// 判断链表有环
    func hasCycle(_ head: ListNode<T>?) -> Bool {
        if (head == nil || head?.next == nil) {
            return false
        }
        
        var slow = head
        var fast = head?.next
        while fast != nil && fast?.next != nil {
            if fast == slow {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}

