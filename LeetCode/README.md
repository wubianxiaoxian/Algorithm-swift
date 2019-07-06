### 题目


##### 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

##### 示例:
##### 给定 nums = [2, 7, 11, 15], target = 9
##### 因为 nums[0] + nums[1] = 2 + 7 = 9
##### 所以返回 [0, 1]


### 题目
##### 对于这道题，首先想到的就是暴力方法，即使用两个for循环，遍历两次数组，看有没有和是目标值的。显然这样时间复杂度太大，O(n*n) 因此需要改良的算法，用到哈希查找的方法。 建立哈希表，从左向右扫描一遍，将整数与索引存放到map中。扫描一遍，对其中的每一个整数K，搜索 target-K 在map中是否存在即可。若存在，则输出 K 与 target-K 的下标即可。此算法的时间复杂度为O(n)

##### 代码
```swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let lastArray:[Int] = []
        var dic:[Int:Int] = [:]
        for (i,object) in nums.enumerated() {
            let temp = target - nums[i]
            if dic.keys.contains(temp) {
                return [dic[temp] ?? 0 , i]
            }
            dic[object] = i
        }
        return lastArray
    }
}
```


