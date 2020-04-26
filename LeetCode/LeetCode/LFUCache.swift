//
//  LFUCache.swift
//  LeetCode
//
//  Created by Lawrence on 2020/4/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

class LFUCacheNode {
    var val: Int = 0
    var key: Int = 0
    var freq: Int = 1
    var pre: LFUCacheNode? = nil
    var next: LFUCacheNode? = nil
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
    
    init() {}
}

class LFUCacheLinkedList {
    var head: LFUCacheNode
    var tail: LFUCacheNode
    init() {
        head = LFUCacheNode.init()
        tail = LFUCacheNode.init()
        head.next = tail
        tail.pre = head
    }
    
    func removeNode(_ node: LFUCacheNode) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
    }
    
    func addNode(_ node: LFUCacheNode) {
        node.next = head.next
        node.next?.pre = node
        head.next = node
        node.pre = head
    }
}

class LFUCache {
    private var min:Int
    private var size:Int
    private var capacity:Int
    private var cache:[Int:LFUCacheNode]
    private var freqMap:[Int: LFUCacheLinkedList]
    
    init(_ capacity: Int) {
        self.min = 0
        self.size = 0
        self.capacity = capacity
        self.cache = [Int:LFUCacheNode]()
        self.freqMap = [Int:LFUCacheLinkedList]()
    }
    
    func get(_ key: Int) -> Int {
        let node: LFUCacheNode? = self.cache[key]
        if node != nil {
            self.freqOnNode(node!)
            return node!.val
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if self.capacity == 0 {
            return
        }
        
        let node:LFUCacheNode? = self.cache[key]
        if node != nil {
            node!.val = value
            self.freqOnNode(node!)
        } else {
            if self.size == self.capacity {
                let minReqList:LFUCacheLinkedList? = self.freqMap[self.min]
                self.cache.removeValue(forKey: minReqList!.tail.pre!.key)
                minReqList?.removeNode(minReqList!.tail.pre!)
                self.size -= 1
            }
            
            let aNode: LFUCacheNode = LFUCacheNode.init(key, value)
            self.cache[key] = aNode
            var linkedList: LFUCacheLinkedList? = self.freqMap[1]
            if linkedList != nil {
                linkedList = LFUCacheLinkedList.init()
                self.freqMap[1] = linkedList
            }
            
            linkedList?.addNode(aNode)
            size += 1
            min = 1
        }
    }
    
    private func freqOnNode(_ node: LFUCacheNode) {
        let freq = node.freq
        var linkedList:LFUCacheLinkedList? = self.freqMap[freq]
        linkedList?.removeNode(node)
        if freq == self.min && linkedList?.head.next === linkedList?.tail {
            self.min = freq + 1
        }
        
        node.freq += 1
        linkedList = self.freqMap[freq + 1]
        if linkedList == nil {
            linkedList = LFUCacheLinkedList.init()
            self.freqMap[freq + 1] = linkedList
        }
        
        linkedList?.addNode(node)
    }
}
