//
//  Selection.swift
//  LeetCode
//
//  Created by Lawrence on 2020/4/10.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

class Selection {
    class func sort(_ array: [Int]) ->[Int] {
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
            
            //判断最小值是否有变化，一开始假定最小值为第一个要遍历的元素
            if min != i {
                let temp = result[i]
                result[i] = result[min]
                result[min] = temp
            }
        }
        
        return result
    }
}
