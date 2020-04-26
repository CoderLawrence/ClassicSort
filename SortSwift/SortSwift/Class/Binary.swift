//
//  Binary.swift
//  SortSwift
//
//  Created by Lawrence on 2020/4/9.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 二分法查找（必须是要有序的数组）
/// 思想： 每次现在 low 和 high的节点中间去查找 比对 是否在这个范围
/// 如果在 那么根据值来去缩小 OR 放大范围 直到找到为止
/// 时间复杂度 O(log2n)
class Binary {
    class func find(_ array: [Int], _ item: Int) -> Int {
        guard array.count > 0 else {
            return -1
        }
        
        var low: Int = 0
        var high: Int = array.count - 1
        while low <= high {
            //每次找到区间内中间值
            let mid = (low + high)/2
            //如果要查找的值跟 mid 下标值相等直接返回
            if array[mid] == item {
                return mid
            }
            
            //判断 mid 下标值的大小，用于范围的选择
            if array[mid] > item {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return -1
    }
}
