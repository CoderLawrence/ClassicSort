//
//  Stack.swift
//  SortSwift
//
//  Created by Lawrence on 2020/5/29.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 使用数组实现栈
public struct Stack<T> {
    fileprivate var array = [T]()
    
    /// 是否为空栈
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    /// 栈的数目
    public var count: Int {
        return array.count
    }
    
    /// 出栈
    /// - Returns: 返回栈顶元素
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    /// 入栈
    /// - Parameter element: 入栈元素
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    /// 获取栈顶元素
    /// - Returns: 返回栈顶元素
    public mutating func top() ->T? {
        return array.last
    }
}
