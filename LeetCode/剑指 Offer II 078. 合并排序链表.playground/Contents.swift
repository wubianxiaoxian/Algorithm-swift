//MARK: - 题目
/*
 剑指 Offer II 078. 合并排序链表
 给定一个链表数组，每个链表都已经按升序排列。

 请将所有链表合并到一个升序链表中，返回合并后的链表。

  

 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
 */

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty {
            return nil
        }
        var dummy = ListNode(-1), p = dummy
        var pq: PriorityQueue<ListNode> = PriorityQueue.init({ $0.val < $1.val }, [])
        for node in lists {
            if let node = node {
                pq.enquue(node)
            }
        }
        while !pq.isEmpty {
            let node = pq.dequeue()
            p.next = node
            if let next = node?.next {
                pq.enquue(next)
            }
  
            p = p.next!
        }
        return dummy.next
    }
}

struct Heap<E: Equatable> {
    var array: [E] = []
    let sort: (E, E) -> Bool
    init(_ sort:@escaping (E, E) -> Bool, _ array: [E] = []) {
        self.sort = sort
        self.array = array
        if !array.isEmpty {
            for i in stride(from: array.count / 2 - 1, through: 0, by: -1) {
                sink(0)
            }
        }
    }

    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
    
    func peek() -> E? {
        array.first
    }
    
    func leftChildIndex(_ index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(_ index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(_ index: Int) -> Int {
        return (index - 1)/2
    }

    mutating func remove() -> E? {
        guard !isEmpty else {
            return nil
        }
        array.swapAt(0, count - 1)
        defer {
             sink(0)
        }
        return array.removeLast()
    }

    mutating func sink( _ index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(parent)
            let right = rightChildIndex(parent)
            var candidate = parent
            if left < count && sort(array[left], array[candidate]) {
                candidate = left
            }

            if right < count && sort(array[right], array[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            array.swapAt(candidate, parent)
            parent = candidate
        }
    }

    mutating func insert(_ e: E) {
        array.append(e)
        swim(array.count - 1)
    }

    mutating func swim(_ index: Int) {
        var child = index
        var parent = parentIndex(index)
        while child > 0 && sort(array[child], array[parent]) {
            array.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }
}

struct PriorityQueue<E: Equatable> {
    private var heap: Heap<E>
    init(_ sort:@escaping (E, E) -> Bool, _ array: [E]) {
        heap = Heap(sort, array)
    }

    var isEmpty: Bool {
        heap.isEmpty
    }
    
    mutating func enquue(_ e: E) -> Bool {
        heap.insert(e)
        return true
    }

    mutating func dequeue() -> E? {
        return heap.remove()
    }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}
