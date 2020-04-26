//
//  Bubble.swift
//  SortSwift
//
//  Created by Lawrence on 2020/4/9.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 十大算法之--冒泡排序
/// 思想 ：遍历两个值 比较大小 进行交换 时间复杂度 O(n2)
class Bubble {
    class func sort(_ array: [Int]) -> [Int] {
        guard array.count > 0 else {
            return array
        }
        
        var result = array
        //需要比较 n - 1轮
        for i in 0..<result.count {
            //每一轮需要比较 n - i 次
            for j in i..<result.count {
                //比较两个值的大小，如果下标 i 比 小标 j 的值大进行交换
                if result[i] > result[j] {
                    let temp = result[i]
                    result[i] = result[j]
                    result[j] = temp
                }
            }
        }
        
        return result
    }
}
