//MARK: - 题目
/*
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 示例:
 输入:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        var ar = [Int]()
        for i in 0..<lists.count {
            var node = lists[i]
            while node != nil {
                ar.append(node!.val)
                node = node!.next
            }
        }
        if ar.count == 0 {
            return nil
        }
        ar = ar.sorted()
        let head = ListNode(ar[0])
        var node = head
        for i in 1..<ar.count {
            node.next = ListNode(ar[i])
            node = node.next!
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
