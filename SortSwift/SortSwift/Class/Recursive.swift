//
//  Recursive.swift
//  SortSwift
//
//  Created by Lawrence on 2020/6/1.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

class Recursive {
    /// 阶层的递归实现
    /// - Parameter n: 递归因子
    /// - Returns: 阶层结果
    class func f(list: [Int]) -> Int {
        // 递归结束条件
        if list.count == 0 {
            return 1
        }
        
        // 拆解成子问题
        var temp = list
        temp.remove(at: 0)
        return list[0] * f(list: temp)
    }
    
    /// 递归数组求和
    func sum(list: [Int]) -> Int {
        if list.count == 0 {
            return 0
        }
        
        var temp = list
        temp.remove(at: 0)
        return list[0] + sum(list: temp)
    }
    
    /// 递归求数组个数
    func count(list: [Int]) -> Int {
        if list.count == 0 {
            return 0
        }
        
        var temp = list
        temp.remove(at: 0)
        return 1 + count(list: temp)
    }
    
    /// 递归求数组最大值
    class func max(list: [Int]) -> Int {
        if list.count == 2 {
            return (list[0] > list[1]) ? list[0] : list[1]
        } else if list.count < 2 {
            return list.first ?? 0
        }
        
        var temp = list
        temp.remove(at: 0)
        let subMax = max(list: temp)
        return (list[0] > subMax) ? list[0] : subMax
    }
}
