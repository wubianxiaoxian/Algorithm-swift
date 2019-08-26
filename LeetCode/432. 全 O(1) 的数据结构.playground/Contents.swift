//MARK: - 题目
/*
 实现一个数据结构支持以下操作：
 
 Inc(key) - 插入一个新的值为 1 的 key。或者使一个存在的 key 增加一，保证 key 不为空字符串。
 Dec(key) - 如果这个 key 的值是 1，那么把他从数据结构中移除掉。否者使一个存在的 key 值减一。如果这个 key 不存在，这个函数不做任何事情。key 保证不为空字符串。
 GetMaxKey() - 返回 key 中值最大的任意一个。如果没有元素存在，返回一个空字符串""。
 GetMinKey() - 返回 key 中值最小的任意一个。如果没有元素存在，返回一个空字符串""。
 
 挑战：以 O(1) 的时间复杂度实现所有操作。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/all-oone-data-structure
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class AllOne {
    var obj:[String:Int]
    /** Initialize your data structure here. */
    init() {
        self.obj = [:]
    }
    
    /** Inserts a new key <Key> with value 1. Or increments an existing key by 1. */
    func inc(_ key: String) {
        if obj[key] != nil {
            obj[key,default:0] += 1
        } else {
            obj[key] = 1
        }
    }
    
    /** Decrements an existing key by 1. If Key's value is 1, remove it from the data structure. */
    func dec(_ key: String) {
        if obj[key] != nil {
            obj[key,default:0] -= 1
        }
        if obj[key] == 0 {
            obj[key] = nil
        }
    }
    
    /** Returns one of the keys with maximal value. */
    func getMaxKey() -> String {
        var tmpvalue: Int = -1
        var tmpkey:String = ""
        for (key, value) in obj {
            if value > tmpvalue {
                tmpvalue = value
                tmpkey = key
            }
        }
        return tmpkey
    }
    
    /** Returns one of the keys with Minimal value. */
    func getMinKey() -> String {
        var tmpvalue: Int = Int.max
        var tmpkey:String = ""
        for (key, value) in obj {
            if value < tmpvalue {
                tmpvalue = value
                tmpkey = key
            }
        }
        return tmpkey
    }
}


