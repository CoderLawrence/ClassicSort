//
//  main.swift
//  SortSwift
//
//  Created by Lawrence on 2020/4/9.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

func insetionSort<T:Comparable>(array:[T]) ->[T] {
    var results = array
    for i in 1..<results.count {
        let insertion = results[i]
        for j in (0..<i).reversed() {
            print("i = \(i) j = \(j) j + 1 = \(j + 1)")
            if insertion < results[j + 1] {
                results[j] = results[j + 1]
                results[j + 1] = insertion
            } else {
                results[j + 1] = insertion;
                break
            }
        }
    }
    
    return results
}

func selectionSort<T:Comparable>(array:[T]) ->[T] {
    var results = array
    for i in 0..<results.count {
        var index = i
        for j in i + 1..<results.count {
            if results[index] > results[j] {
                index = j
            }
        }
        
        if index != i {
            let temp = results[i]
            results[i] = results[index]
            results[index] = temp
        }
    }
    return results
}

func quickSort<T:Comparable>(array:[T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    let povit = array[array.count/2]
    let less = array.filter{$0 < povit}
    let equal = array.filter{$0 == povit}
    let greater = array.filter{$0 > povit}
    return quickSort(array: less) + equal + quickSort(array: greater)
}

print("=======================Sort======================")
print("Bubble sort \(Bubble.bubbleSort(array:[1, 3, 5, 4, 2]))")
print("Binary find \(Binary.find([1, 2, 3, 4, 5, 6], 4))")
print("Selection sort \(selectionSort(array:[1, 3, 5, 4, 2]))")
print("Insert sort \(insetionSort(array:[1, 3, 5, 4, 2]))")
print("Quick sort \(quickSort(array:[1, 3, 5, 4, 2]))")
print("Shell sort \(Shell.sort(array:[1, 3, 5, 4, 2]))")
print("=========================Recursive=================")
print("Factorial \(Recursive.f(list: [1, 2, 3, 4, 5]))")
print("Fiboncci \(Fibonacci.fibonacci(5))");
print("Recursive max \(Recursive.max(list: [1, 0, 25, 30, -1]))")
