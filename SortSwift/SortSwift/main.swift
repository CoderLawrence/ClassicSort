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
    if array.count < 2 {
        return array
    } else {
        let pivot = array[array.count/2]
        var less = [T]()
        var equal = [T]()
        var greater = [T]()
        for element in array {
            if element < pivot {
                less.append(element)
            } else if element > pivot {
                greater.append(element)
            } else {
                equal.append(element)
            }
        }
        
        return quickSort(array: less) + equal + quickSort(array: greater)
    }
}

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    let array = quickSort(array: nums)
    return array[array.count - k]
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
print("==========================Graph==========================")
var planeGraph = Graph<String>()
var hk = planeGraph.createVertex(data: "Hong Kong")
var ny = planeGraph.createVertex(data: "New York")
var mosc = planeGraph.createVertex(data: "Moscow")
var ld = planeGraph.createVertex(data: "London")
var pairs = planeGraph.createVertex(data: "Pairs")
var am = planeGraph.createVertex(data: "Amsterdam")
var sf = planeGraph.createVertex(data: "San Francisco")
var ja = planeGraph.createVertex(data: "Juneau Alaska")
var tm = planeGraph.createVertex(data: "Timbuktu")

planeGraph.addEdge(type: .undirected, soruce: hk, destination: sf, weight: 500.0)
planeGraph.addEdge(type: .undirected, soruce: hk, destination: mosc, weight: 900.0)
planeGraph.addEdge(type: .directed, soruce: sf, destination: ja, weight: 300.0)
planeGraph.addEdge(type: .undirected, soruce: sf, destination: ny, weight: 150.0)
planeGraph.addEdge(type: .directed, soruce: mosc, destination: ny, weight: 750.0)
planeGraph.addEdge(type: .directed, soruce: ld, destination: mosc, weight: 200.0)
planeGraph.addEdge(type: .undirected, soruce: ld, destination: pairs, weight: 70.0)
planeGraph.addEdge(type: .directed, soruce: sf, destination: pairs, weight: 800.0)
planeGraph.addEdge(type: .undirected, soruce: pairs, destination: tm, weight: 250.0)
planeGraph.addEdge(type: .directed, soruce: am, destination: pairs, weight: 50.0)
print(planeGraph.description)
print("===================================")
print(findKthLargest([3,2,1,5,6,4], 2))
