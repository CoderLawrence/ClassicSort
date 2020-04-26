//
//  main.swift
//  LeetCode
//
//  Created by Lawrence on 2020/3/23.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

//链表相关数据结构
public class ListNode {
    public var val: Int = 0
    public var next: ListNode?
    
    init(_ x: Int) {
        self.val = x
        self.next = nil
    }
}

//找出链表的中间节点(快慢指针) ==================================
public func middleNode(_ head: ListNode) -> ListNode? {
    var fast: ListNode? = head
    var slow: ListNode? = head
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    return slow
}

/// 两个数的和 =================================
public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var results:[Int] = Array(repeating: 0, count: 2)
    for i in 0..<nums.count {
        for j in i..<nums.count {
            if nums[i] + nums[j] == target {
                results[0] = i
                results[1] = j
                return results
            }
        }
    }
    
    return results
}

public func whileListNode(_ head: ListNode) {
    var node: ListNode? = head
    while node?.next != nil {
        print("val = \(String(describing: node?.val))\\n")
        node = node?.next
    }
}

/// 统计字符串出现的次数===========================================
public func count(_ str: String?) {
    let chars:[Character] = str?.reversed() ?? []
    var dict:[Character:Int] = [Character:Int]()
    for char in chars {
        if (dict[char] == nil) {
            dict[char] = 1
        } else {
            let count = (dict[char] ?? 0) + 1
            dict[char] = count
        }
    }
    
    for key in dict.keys {
        print("\(key) ==== \(String(describing: dict[key]))")
    }
}

/// 车的可用捕获量（穷举法，然后安装四个方向找出黑棋）======================
public func numRookCaptures(_ board: [[Character]]) -> Int {
    var result = 0
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            //找到白色风车
            if board[i][j] == "R" {
                result += findLeftBackPawn(i: i + 1, j: j, board: board)
                result += findBottomBlackPawn(i: i, j: j + 1, board: board)
                result += findRightBlackPawn(i: i - 1, j: j, board: board)
                result += findTopBlackPawn(i: i, j: j - 1, board: board)
            }
        }
    }
    
    return result
}

public func findRightBlackPawn(i:Int, j:Int, board:[[Character]]) -> Int {
    if i < 0 || board[i][j] == "B" {
        return 0
    }
    
    if board[i][j] == "p" {
        return 1
    }
    
    return findRightBlackPawn(i:i - 1, j: j, board: board)
}

public func findLeftBackPawn(i:Int, j:Int, board:[[Character]]) -> Int {
    if i >= board.count || board[i][j] == "B" {
        return 0
    }
    
    if board[i][j] == "p" {
        return 1
    }
    
    return findLeftBackPawn(i: i + 1, j: j, board: board);
}

public func findBottomBlackPawn(i: Int, j: Int, board:[[Character]]) -> Int {
    if j >= board.count || board[i][j] == "B" {
        return 0
    }
    
    if board[i][j] == "p" {
        return 1
    }
    
    return findBottomBlackPawn(i: i, j: j + 1, board: board)
}

public func findTopBlackPawn(i: Int, j: Int, board:[[Character]]) -> Int {
    if j < 0 || board[i][j] == "B" {
        return 0
    }
    
    if board[i][j] == "p" {
        return 1
    }
    
    return findTopBlackPawn(i: i, j: j - 1, board: board)
}

/// 卡牌分组（辗转相除法求最大公约数）============================================================
public func hasGroupsSizeX(_ deck: [Int]) -> Bool {
    if deck.isEmpty || deck.count == 1 {
        return false
    }
    
    var map:[Int:Int] = [Int:Int]()
    for num in deck {
        if map[num] == nil {
            map[num] = 1
        } else {
            map[num] = map[num]! + 1
        }
    }

    var result = 0
    for value in map.values {
        result = div(a: result, b: value)
    }
    
    return result >= 2
}

public func div(a:Int, b:Int) -> Int {
    return b == 0 ? a : div(a: b, b: a%b)
}

//求两数之和
public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) ->ListNode? {
    guard l1 != nil || l2 != nil else {
        return nil
    }
    
    let result = ListNode(0)
    var p1:ListNode? = l1
    var p2:ListNode? = l2
    var head = result
    var carry = 0
    while p1 != nil || p2 != nil {
        let sum = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
        carry = sum / 10
        head.next = ListNode(sum%10)
        head = head.next!
        p1 = p1?.next
        p2 = p2?.next
    }
    
    if carry > 0 {
        head.next = ListNode(carry)
    }
    
    return result.next
}

/// 回文数 =================================
public func isPalindrome(_ x:Int) -> Bool {
    //负数一定不是回文数
    guard x > 0 else {
        return false
    }
    
    var num = x
    var reverseNum = 0
    while num != 0 {
        //如果x是负数，则tmp为负数，所以在一开始需要对负数进行特判
        let temp = num % 10
        num /= 10
        reverseNum = reverseNum * 10 + temp
    }
    
    if reverseNum == x {
        return true
    } else {
        return false
    }
}

//排序数组
public func sortArray(_ nums: [Int]) -> [Int] {
    var temp = nums
    quickSort(&temp, left: 0, right: nums.count-1)
    return temp
}

func quickSort(_ nums: inout [Int], left: Int, right: Int) {
    guard left<=right else {
        return
    }
       
    let pivot = partition(&nums, left: left, right: right)
    quickSort(&nums, left: left, right: pivot-1)
    quickSort(&nums, left: pivot+1, right: right)
}

func partition(_ nums: inout [Int],  left: Int, right: Int) -> Int {
    var left = left
    var right = right
    let pivot = nums[left]
       
    while left<right {
        while left<right, nums[right]>=pivot {
            right -= 1
        }
        
        nums[left] = nums[right]

        while left<right, nums[left]<pivot {
               left += 1
        }
        nums[right] = nums[left]
    }
    
    nums[left] = pivot
       
    return left
}

//数字反转
public func reverse(_ x: Int) -> Int {
    //个位结果
    var a = 0
    //倒转后的结果
    var result = 0
    //用于递归计算的副本
    var temp = x
    while temp != 0 {
        a = temp % 10
        temp = temp / 10
        result = result * 10 + a
    }
    
    if result > Int32.max || result < Int32.min {
        return 0
    }
    
    return result
}

//异或求出数组里面只出现一次的数字
public func singleNumber(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    
    var result = nums[0]
    for i in 1..<nums.count {
        result ^= nums[i]
    }

    return result
}

//字符串反转
public func reverseWords(_ s: String) -> String {
    return s.split {$0.isWhitespace}.reversed().joined(separator: " ")
}

//选择排序
public func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    
    var result: [Int] = array
    for i in 0..<result.count {
        var min = i
        for j in i + 1..<result.count {
            if result[min] > result[j] {
                min = j
            }
        }
        
        if min != i {
            let temp = result[i]
            result[i] = result[min]
            result[min] = temp
        }
    }
    
    return result
}

//冒泡排序
public func bbuleSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    
    var result: [Int] = array
    for i in 0..<result.count {
        for j in i + 1..<result.count {
            if result[i] > result[j] {
                let temp = result[i]
                result[i] = result[j]
                result[j] = temp
            }
        }
    }
    
    return result
}

public func insertSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    
    var result: [Int] = array
    for i in 1..<result.count {
        var j: Int = i
        let temp: Int = result[i]
        while j > 0 && temp < result[j - 1] {
            result[j] = result[j - 1]
            j -= 1
        }
        
        if j != i {
            result[j] = temp
        }
    }
    
    return result
}

public func swap(_ a: inout Int, _ b: inout Int) {
    a = a ^ b
    b = a ^ b
    a = a ^ b
}

//数字求和 1+2+3+n
public func sumNums(_ n: Int) -> Int {
    if n == 1 { return n }
    //递归做法
    return sumNums(n - 1) + n
}

//合并两个链表
public func mergeTowLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil else {
        return l2
    }
    
    guard l2 != nil else {
        return l1
    }
    
    if l1!.val > l2!.val {
        l1?.next = mergeTowLists(l1?.next, l2)
        return l1
    } else {
        l2?.next = mergeTowLists(l2?.next, l1)
        return l2
    }
}

//链表求和
public struct Stack<T> {
    fileprivate var array = [T]()
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

func addTwoNumbersListNode(_ l1: ListNode?, _ l2: ListNode?) ->ListNode? {
    var ll1: ListNode? = l1?.next
    var ll2: ListNode? = l2?.next
    var stack1: Stack = Stack<Int>.init(array: [l1?.val ?? 0])
    var stack2: Stack = Stack<Int>.init(array: [l2?.val ?? 0])
    while ll1 != nil {
        stack1.push(ll1?.val ?? 0)
        ll1 = ll1?.next
    }
    
    while ll2 != nil {
        stack2.push(ll2?.val ?? 0)
        ll2 = ll2?.next
    }
    
    var carry = 0
    var head: ListNode? = nil
    while !stack1.isEmpty || !stack2.isEmpty || carry > 0 {
        var sum = carry
        sum += stack1.isEmpty ? 0 : stack1.pop() ?? 0
        sum += stack2.isEmpty ? 0 : stack2.pop() ?? 0
        let node: ListNode = ListNode.init(sum % 10)
        node.next = head
        head = node
        carry = sum / 10
    }
    
    return head
}

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    
    var count: Int = 0
    let len: Int = nums.count
    for i in 0..<len {
        if nums[count] != nums[i] {
            count += 1
            nums[count] = nums[i]
        }
    }
    return count + 1
}

func find(_ array:[Int], _ target:Int) -> Int {
    guard array.count > 0 else {
        return -1
    }
    
    var low: Int = 0
    var high: Int = array.count - 1
    while low <= high {
        let mid = (low + high)/2
        if array[mid] == target {
            return mid
        }
        
        if array[mid] > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return -1
}

func selection(_ array:[Int]) ->[Int] {
    guard array.count > 0 else {
        return array
    }
    
    var result:[Int] = array
    for i in 0..<result.count {
        var index = i
        for j in i..<result.count {
            if result[index] > result[j] {
                index = j
            }
        }
        
        if index != i {
            let temp = result[index]
            result[index] = result[i]
            result[i] = temp
        }
    }
    
    return result
}

func insertion(_ array:[Int]) -> [Int] {
    guard array.count > 0 else {
        return array
    }
    
    var result:[Int] = array
    for i in 1..<result.count {
        var index = i
        let temp = result[i]
        while index > 0 && temp < result[index - 1] {
            result[index] = result[index - 1]
            index -= 1
        }
        
        if index != i {
            result[index] = temp
        }
    }
    
    return result
}

print(reverseWords("the sky is blue"))
print("Selection sort \(selectionSort([5, 3, 1, 4, 2, 7, 6]))")
print("bbule sort \(bbuleSort([5, 3, 1, 4, 2, 7, 6]))")
print("Insert sort \(insertSort([5, 3, 1, 4, 2, 7, 6]))")

var a = 1
var b = 2
swap(&a, &b)
print("swap a = \(a), b = \(b)")
print("sumNums = \(sumNums(9))")

var l1: ListNode = ListNode.init(7)
var l11: ListNode = ListNode.init(2)
l1.next = l11
var ll2: ListNode = ListNode.init(4)
l11.next = ll2
var l13: ListNode = ListNode.init(3)
ll2.next = l13

var l2: ListNode = ListNode.init(5)
var l21: ListNode = ListNode.init(6)
l1.next = l11
var l22: ListNode = ListNode.init(4)
l11.next = ll2

print("addTowNumbers \(addTwoNumbersListNode(l1, l2))")
var nums = [1, 2, 2, 3, 4, 4, 5]
print("removeDuplicates \(removeDuplicates(&nums))")
print("Binary find \(find([1, 2, 2, 3, 4, 5], 3))");
print("Selection sort \(selection([6, 4, 5, 5, 2, 3, 1, 2]))")
print("Insert sort \(insertion([6, 4, 5, 5, 2, 3, 1, 2]))")
