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

struct Heap<Element: Equatable> {

    // 底层数据存储
    var elements: [Element] = []
    
    // 排序算法，如果排序算法满足大于条件，那么是创建最大堆；如果是小于条件，那么创建最小堆
    let sort: (Element, Element) -> Bool
    
    init(_ sort: @escaping (Element, Element) -> Bool,
            _ elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }

  var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }

    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        // 交换数组的第一个元素和最后一个元素的值
        elements.swapAt(0, count-1)
        defer {
            // 从根节点开始往下移动，保证数据删除以后还是二叉堆
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            // 以最大堆为例子，如果 elements[left] > elements[candidate], 表明子节点大于父节点，此时需要把子节点的值和父节点替换；
            // 如果是最小堆，那么就是 elements[left] < elements[candidate]。
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            // 以最大堆为例子，如果没有移动，表明父节点大于或等于子节点，那么此时是二叉堆了
            if candidate == parent {
                return
            }
            
            // 不同索引的值替换
            elements.swapAt(parent, candidate)
            
            // 此时索引下移了，重新开始对比（在实际的数组结构里面是元素索引加大了，但是在堆的数据结构图看起来是下移了）
            parent = candidate
        }
    }
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            // 当前元素和数组最后元素替换
            elements.swapAt(index, elements.count - 1)
            defer {
                // 如果必要，下移
                siftDown(from: index)
                // 如果必要，上移
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }

        mutating func insert(_ element: Element) {
        // 开始添加到数组末尾
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        // 如果是最大堆，如果当前节点大于父节点，那么位置替换；如果是最小堆，如果当前节点小于副节点，那么位置替换
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return i
        }
        // 从左节点处
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        // 从右节点处
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
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
