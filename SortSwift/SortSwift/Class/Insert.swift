//
//  Insert.swift
//  SortSwift
//
//  Created by Lawrence on 2020/4/10.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

/// 插入排序
/// 思想：将第一待排序序列第一个元素看做一个有序序列，把第二个元素到最后一个元素当成为排序序列
/// 从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置
/// (note: 如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面)
/// 时间复杂度：
class Insert {
    class func sort(_ array: [Int]) -> [Int] {
        guard array.count > 0 else {
            return array
        }
        
        var result: [Int] = array
        //把数组的第零个元素当做最小值，从数组的第一个元素开始比较
        for i in 1..<result.count {
            //记录要插入的数据
            let temp = result[i]
            //从已经排序的序列的序列最右边的开始比较，找到比其小的数
            var j: Int = i
            while j > 0 && temp < result[j - 1] {
                result[j] = result[j - 1]
                j -= 1
            }
            
            //存在比其小的数，插入
            if j != i {
                result[j] = temp
            }
        }
        
        return result
    }
    
    class func insetionSort<T:Comparable>(array:[T]) ->[T] {
        var results = array
        //从第二个元素开始遍历
        for i in 1..<results.count {
            //当前待插入的元素
            let insertion = results[i]
            //从后往前遍历之前的所有元素
            for j in (0..<i).reversed() {
                if insertion < results[j] {
                    results[j + 1] = results[j]
                    results[j] = insertion
                } else {
                    results[j + 1] = insertion
                    break
                }
            }
        }
        
        return results
    }
}
