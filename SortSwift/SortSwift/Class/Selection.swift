//
//  Selection.swift
//  SortSwift
//
//  Created by Lawrence on 2020/4/9.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 十大算法之--选择排序
/// 思想：选择每次选择数组第 i 个元素作为最小值
/// 与数组的第i + 1个元素比较开始比较，每次比较 len - i 论，找出最小值，然后进行值替换
/// 时间复杂度 O(n2)
class Selection {
    class func sort(_ array: [Int]) -> [Int] {
        guard array.count > 0 else {
            return array
        }
        
        //总共要经过n - 1 论比较
        var result: [Int] = array
        for i in 0..<result.count {
            var min = i
            //每轮需要比较的次数 n - i
            for j in i + 1..<result.count {
                if result[j] < result[min] {
                    //记录目前能找到的最小值元素的下标
                    min = j
                }
            }
            
            // 将找到的最小值和 i 位置所在的值进行交换
            if min != i {
                let temp = result[i]
                result[i] = result[min]
                result[min] = temp
            }
        }
        
        return result
    }
}
