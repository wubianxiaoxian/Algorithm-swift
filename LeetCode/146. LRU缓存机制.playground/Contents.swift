//MARK: - 题目
/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
 
 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
 
 进阶:
 
 你是否可以在 O(1) 时间复杂度内完成这两种操作？
 
 示例:
 
 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
 
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class LRUCache {
    ///哈希表
    var map: [Int:Node?] = [:]
    
    /// 双向链表
    var cache: LikedList
    
    ///最大容量
    var capacity: Int
    
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.map = [:]
        self.cache = LikedList()
    }
    
    func get(_ key: Int) -> Int {
        if map[key] == nil {
            return -1
        }
        let val = (map[key] as? Node)!.val
        //利用 put 方法把数据提前
        put(key, val)
        return val
    }
    
    func put(_ key: Int, _ value: Int) {
        //先把新节点x 做出来
        let x = Node.init(key, v: value)
        if map[key] != nil {
            //删除旧节点
            cache.remove((map[key] as? Node)!)
            cache.addFirst(x)
            // 更新 map 中的数据
            map[key] = x
        } else {
            if capacity == cache.size {
                // 删除链表最后一个节点
                let last = cache.removeLast()
                map.removeValue(forKey: last!.key)
            }
            /// 直接添加到头部
            cache.addFirst(x)
            map[key] = x
        }
    }
}


class Node {
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?
    init(_ k: Int, v: Int) {
        self.key = k
        self.val = v
    }
}

class LikedList {
    /// 虚拟头结点
    var head: Node?
    /// 虚拟尾结点
    var tail: Node?
    var size: Int = 0
    init() {
        head = Node(0, v: 0)
        tail = Node(0, v: 0)
        head?.next = tail
        tail?.prev = head
        size = 0
    }
    
    /// 在链表头部添加节点 x
    func addFirst(_ x: Node) {
        x.next = head?.next
        x.prev = head
        head?.next?.prev = x
        head?.next = x
        size += 1
    }
    
    /// 删除链表中的节点（x 一定存在）
    func remove(_ x: Node) {
        x.prev?.next = x.next
        x.next?.prev = x.prev
        size -= 1
    }
    
    ///删除链表最后一个节点，并返回该节点
    func removeLast() -> Node? {
        if tail?.prev?.val == head?.val {
            return nil
        }
        let last = tail?.prev
        remove(last!)
        return last
    }
}

