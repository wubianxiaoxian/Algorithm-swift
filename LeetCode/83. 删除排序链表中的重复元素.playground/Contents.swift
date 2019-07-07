//MARK: - 题目
/*
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var tmp = head
        while tmp != nil && tmp?.next != nil {
            if tmp?.val == tmp?.next?.val {
                tmp?.next = tmp?.next?.next
            } else {
               tmp = tmp?.next
            }
        }
        return head
    }
}

