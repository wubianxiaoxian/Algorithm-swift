/*
 链表
 链表是一种物理存储单元上非连续、非顺序的存储结构，数据元素的逻辑顺序是通过链表中的指针链接次序实现的。链表由一系列结点（链表中每一个元素称为结点）组成，结点可以在运行时动态生成。每个结点包括两个部分：一个是存储数据元素的数据域，另一个是存储下一个结点地址的指针域。
 */

/*
 定义单单向链表
 1、添加元素
 2、删除元素
 3、更新元素
 4、查找元素
 5、查找元素的位置
 */


class Node<T> {
    var element:T!
    var next:Node<T>!
    init(_ element : T, next:Node? = nil) {
        self.element = element
        self.next = next
    }
}


final class LinkedList<T> {
    var size = 0
    var first:Node<T>?
    var lastNode:Node<T>?
}

extension LinkedList {
    func node(at index:Int) -> Node<T>? {
        // 如果下标位置无效，直接报错
        if !indexIsVaild(index) {
            fatalError("index out of range:\(index) not belong 0.. <\(size)")
        }
        var currentNode = first
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        /*
         for i in 0...index {
         currentNode = currentNode?.next
         }
         */
        return currentNode
    }
    
    func indexIsVaild(_ index:Int) -> Bool {
        return index >= 0 && index < size
    }
    
    var isEmpty: Bool {
        return first == nil
    }
    
    func append(_ value:T) {
        let newNode = Node(value)
        if let lastNode = lastNode {
            lastNode.next = newNode
        } else {
            first = newNode
        }
    }
    
    func clear()  {
        size = 0
        first = nil
    }
    
    ///获取index位置对应的节点对象
    func add(_ index:Int, element:T) {
        // 如果下标位置无效，直接报错
//        if !indexIsVaild(index) {
//            fatalError("index out of range:\(index) not belong 0.. <\(size)")
//        }
        if index == 0 {
            first = Node(element, next: first)
        } else {
            let prev = node(index - 1)
            prev?.next = Node.init(element, next: prev?.next)
        }
        size += 1;
    }
    
    ///获取index位置对应的节点对象
    func node(_ index:Int) -> Node<T>? {
        var node = first
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    
    /// 获取index位置对应的节点元素
    func get(_ index:Int) -> T? {
        return node(index)?.element
    }
    
    /// 重置index位置对应的节点元素
    func set(_ index:Int, element:T) -> T? {
        let tempNode = node(index)
        let old = tempNode?.element
        tempNode?.element = element
        return old
    }
    
    func deleteNode(_ node:Node<T>?)  {
        var tmp = node
        if tmp?.next == nil {
            tmp = tmp?.next
            return
        }
        tmp?.element = tmp?.next.element
        tmp?.next = tmp?.next.next
        size -= 1
    }
    
    func remove(_ index:Int) -> T?  {
        // 如果下标位置无效，直接报错
        if !indexIsVaild(index) {
            fatalError("index out of range:\(index) not belong 0.. <\(size)")
        }
        var tempNode = first
        if index == 0 {
            first = first?.next
        } else {
            let prev = node(index - 1)
            tempNode = prev?.next
            prev?.next = tempNode?.next
        }
        size -= 1
        return tempNode?.element
    }
    
    func removeElements(_ head: Node<Int>?, _ val: Int) -> Node<Int>? {
        var tmp = head?.next
        if tmp?.element == val {
            head?.next = nil
            return head
        }
        while tmp?.next != nil {
            if tmp?.element == val {
                tmp?.element = tmp?.next?.element ?? 0
                tmp?.next = tmp?.next?.next
            } else {
                tmp = tmp?.next
            }
        }
        if tmp?.next == nil {
            tmp = tmp?.next
        }
        return head
    }
    
    func remove(_ node:Node<T>? ) {
        let next = node?.next
        node?.element = next?.element
        node?.next = next?.next
        size -= 1
    }
    
    func toString() -> String {
        var str:String = ""
        str = "size=" + "\(size)" + ", ["
        var node = first
        for i in 0..<size {
            if i != 0 {
                str += ","
            }
            if let node = node, let element = node.element {
                str += "\(element)"
            }
            node = node?.next
        }
        str += "]"
        return str
    }
    
    func toInt() -> Int  {
        var firstNumver:Int = 0
        var firstlevel:Int = 1
        var nextNode:Node<Int>? = first?.next as? Node<Int>
        firstNumver += (nextNode?.element ?? 0) * firstlevel
        while nextNode != nil {
            firstlevel = firstlevel * 10
            nextNode = nextNode?.next
            firstNumver = firstNumver +  (nextNode?.element ?? 0) * firstlevel
        }
        return firstNumver
    }
    
    func buildWith(_ Num:Int) {
        var nextLevel = 10
        var nextNode:Node<Int>? = Node.init(Num % 10)
        first?.next = nextNode as? Node<T>
        while nextNode != nil && nextLevel < Num {
            nextLevel = nextLevel * 10
            let n = Num % nextLevel
            let new = n == 0 ? nil : Node.init(Num % nextLevel)
            nextNode?.next = new
            nextNode = new
            size += 1
        }
    }
}


extension LinkedList where T : Equatable {
    func indexOf(_ element:T?) -> Int? {
        if element == nil {
            var node = first
            for i in 0..<size {
                if (node?.element == nil) {
                    return i
                }
                node = node?.next
            }
        } else {
            var node = first
            for i in 0..<size {
                if element == node?.element {
                    return i
                }
                node = node?.next
            }
        }
        return nil
    }
}



extension LinkedList {
    static func mergeKLists(_ lists: [Node<Int>?]) -> Node<Int>? {
        if lists.count == 0 {
            return nil
        }
        var tmpLists = lists
        var interval = 1
        while interval < tmpLists.count {
            for i in stride(from: 0, to: tmpLists.count - 1, by: interval * 2) {
                tmpLists[i] = mergeTwoLists(tmpLists[i], l2: tmpLists[i + interval])
            }
            
            interval = interval * 2
        }
        return lists[0]
    }
    
    static func mergeTwoLists(_ l1:Node<Int>?, l2:Node<Int>?) -> Node<Int>? {
        if l1 == nil && l2 == nil {
            return nil
        }
        var temL1: Node<Int>? = l1
        var temL2: Node<Int>? = l2
        var h: Node<Int>? = Node<Int>(0)
        let ans = h
        while temL1 != nil && temL2 != nil {
            if (temL1?.element ?? 0) < (temL2?.element ?? 0) {
                h?.next = l1
                h = h?.next
                temL1 = temL1?.next
            } else {
                h?.next = l2
                h = h?.next
                temL2 = temL2?.next
            }
        }
        if temL1 == nil {
            h?.next = l2
        }
        if temL2 == nil {
            h?.next = l1
        }
        return ans?.next
    }
}

/// Test®®®®®®®®®

var list1 = LinkedList<Int>()
list1.add(0, element: 0)
list1.add(1, element: 1)
list1.add(2, element: 2)

var list2 = LinkedList<Int>()
list2.add(0, element: 7)
list2.add(1, element: 8)
list2.add(2, element: 9)


LinkedList<Int>.mergeTwoLists(list1.first, l2: list2.first)

let k = LinkedList<Int>.mergeTwoLists(list1.first, l2: list2.first)

print(k?.element)
