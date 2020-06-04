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
        let temp = results[i]
        for j in (0..<i).reversed(){
            if temp < results[j] {
                results[j + 1] = results[j]
                results[j] = temp
            } else {
                results[j + 1] = temp
                break
            }
        }
    }

    return results
}

print("=======================Sort======================")
print("Bubble sort \(Bubble.bubbleSort(array:[1, 3, 5, 4, 2]))")
print("Binary find \(Binary.find([1, 2, 3, 4, 5, 6], 4))")
print("Selection sort \(Selection.sort([1, 3, 5, 4, 2]))")
print("Insert sort \(insetionSort(array:[1, 3, 5, 4, 2]))")
print("=========================Recursive=================")
print("Factorial \(Recursive.f(list: [1, 2, 3, 4, 5]))")
print("Fiboncci \(Fibonacci.fibonacci(5))");
print("Recursive max \(Recursive.max(list: [1, 0, 25, 30, -1]))")
