/*
 双向链表也叫双链表，是链表的一种，它的每个数据结点中都有两个指针，分别指向直接后继和直接前驱。 所以，从双向链表中的任意一个结点开始，都可以很方便地访问它的前驱结点和后继结点。
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
    var next:Node<T>?
    var prev:Node<T>?
    init(_ element : T, next:Node<T>? = nil, prev:Node<T>? = nil) {
        self.element = element
        self.next = next
        self.prev = prev
    }
}


final class LinkedList<T> {
    var size = 0
    var first:Node<T>?
    var lastNode:Node<T>?
    init() { }
    
    /// 通过序列初始化一个list
    public init<S>(_ s: S) where T == S.Element, S : Sequence {
        for (index,item) in s.enumerated() {
            let newNode = Node(item)
            if index == 0 {
                first = newNode
                lastNode = newNode
            }else {
                newNode.prev = lastNode
                lastNode?.next = newNode
                lastNode = newNode
            }
            size += 1
        }
    }

}

extension LinkedList {
    /// 通过下标找到对应的节点
    func node(at index:Int) -> Node<T> {
        rangeCheck(index)
        /// 如果节点在前一半，顺序查找，否则逆序查找
        if index < (size >> 1) {
            var node = first
            for _ in 0..<index {
                node = node?.next
            }
            return node!
        } else {
            var node = lastNode
            for _ in stride(from: size - 1, to: index, by: -1) {
                node = node?.prev
            }
            return node!
        }
    }
    
    func indexIsVaild(_ index:Int) -> Bool {
        return index >= 0 && index < size
    }
    
    var isEmpty: Bool {
        return first == nil
    }
    
    func append(_ value:T) {
        let newNode = Node.init(value, next: nil, prev: lastNode)
        if lastNode == nil {
            first = newNode
        }
        lastNode?.next = newNode
        lastNode = newNode
        size += 1
    }
    
    /// 追加多个元素
    public func append<S>(contentsOf newElements: S) where S : Sequence, T == S.Element {
        for item in newElements {
            append(item)
        }
    }
    
    /// 插入多个元素
    func insert(_ newEleement:T, at i: Int) {
        let newNode = Node.init(newEleement, next: nil, prev: nil)
        if i == 0 && size == 0 {
            first = newNode
            lastNode = newNode
        } else {
            let insertNode = node(at: i)
            newNode.next = insertNode
            insertNode.prev = newNode
            newNode.prev = insertNode.prev
            insertNode.prev?.next = newNode
            if i == 0 {
                first = newNode
            }
        }
        size != 1
    }
    
    /// 插入多个元素
    func insert<S>(contentOf newElements: S,at i:Int) where S : Collection, T == S.Element  {
        if i == 0 && size == 0 {
            append(contentsOf: newElements)
        } else {
            let insertNode = node(at: i)
            var firstNode:Node<T>?
            var lastNode:Node<T>?
            for (index,item) in newElements.enumerated() {
                let newNode = Node.init(item, next: nil, prev: nil)
                if index == 0 {
                    firstNode = newNode
                    lastNode = newNode
                } else {
                    newNode.prev = lastNode
                    lastNode?.next = newNode
                    lastNode = newNode
                }
                size += 1
            }
            // 不理解
            firstNode?.prev = insertNode.prev
            lastNode?.next = insertNode
            insertNode.prev?.next = firstNode
            insertNode.prev = lastNode
            if i == 0 {
                self.first = firstNode
            }
            
        }
    }
    
    
    func clear()  {
        var next = first
        while next != nil {
            let tmp = next
            next?.next = nil
            next?.prev = nil
            next = tmp
        }
        first = nil
        lastNode = nil
        size = 0
    }

    func remove(_ index:Int) -> T?  {
        rangeCheck(index)
        let remove = node(at: index)
        remove.prev?.next = remove?.next
        remove.next?.prev = remove?.prev
        if index == 0 {
            first = first?.next
        } else if index == size - 1 {
            lastNode = lastNode?.prev
        }
        size -= 1
        return remove.element
    }
    
    func removefirstNode() -> T?  {
        return first == nil ? nil : remove(0)
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
    
    /// 如果下标位置无效，直接报错
    func rangeCheck(_ index:Int) {
        if !indexIsVaild(index) {
            fatalError("index out of range:\(index) not belong 0.. <\(size)")
        }
    }
}


// MARK: - 实现Collection协议
extension LinkedList : Collection {
    /// 开始位置
    public var startIndex: Int {  return 0 }
    /// 结束位置
    public var endIndex: Int { return size }
    /// 给定位置后面的索引值
    public func index(after i: Int) -> Int {
        return i + 1
    }
    /// 返回指定的迭代器
    public func makeIterator() -> Iterator {
        return Iterator(self)
    }
    /// 通过下标存取元素
    public subscript(position: Int) -> T {
        get {
            return node(at: position).element
        }
        set {
            node(at: position).element = newValue
        }
    }
}

// MARK: - 迭代器
extension LinkedList {
    public struct Iterator: IteratorProtocol {
        let list: LinkedList
        var index: Int
        private var nextNode:Node<T>?
        init(_ list: LinkedList) {
            self.list = list
            self.index = 0
            self.nextNode = list.first
        }
        /// 获取下一个元素，在for in里若返回nil，则停止循环
        public mutating func next() -> T? {
            let item = nextNode?.element
            nextNode = nextNode?.next
            return item
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

// MARK: - 通过条件查找位置
extension LinkedList {
    /// 顺序查找
    public func firstIndex(where predicate: (T) throws -> Bool) rethrows -> Int? {
        for (index,item) in self.enumerated() {
            if try predicate(item) {
                return index
            }
        }
        return nil
    }
    
    /// 倒序查找
    func lastIndex(where predicate:(T) throws -> Bool)  rethrows -> Int? {
        var prev = lastNode
        var currentIndex = size - 1
        while prev != nil {
            if try predicate(prev!.element) {
                return currentIndex
            }
            currentIndex -= 1
            prev = prev?.prev
        }
        return nil
    }
    
    /// 是否包含
    public func contains(where predicate: (T) throws -> Bool) rethrows -> Bool {
        for item in self{
            if try predicate(item) {
                return true
            }
        }
        return false
    }
}


// MARK: - 通过元素查找位置
extension LinkedList where T: Equatable {
    func firstIndex(of element:T) -> Int? {
        return firstIndex { (item) -> Bool in
            return item == element
        }
    }
    
    func lastIndex(of element: T) -> Int? {
        return lastIndex(where: { (item) -> Bool in
            return item == element
        })
    }
    
    func contains(_ element: T) -> Bool {
        return contains(where: { (item) -> Bool in
            return item == element
        })
    }
}

// MARK: - 实现字面量赋值
extension LinkedList : ExpressibleByArrayLiteral {
    public convenience init(arrayLiteral elements: T...) {
        //这里是调用通过序列初始化链表
        self.init(elements)
    }
}

// MARK: - 把链表转成数组

extension LinkedList {
    public func toArray() -> [T] {
        return self.map({ (item) -> T in
            return item
        })
    }
}


extension LinkedList: CustomDebugStringConvertible {
    var debugDescription: String {
        var desc = ""
        if size > 0 {
            for item in self.dropLast() {
                desc += "\(item)-->"
            }
            desc += "\(lastNode!.element)"
        }
        return desc
    }
}

