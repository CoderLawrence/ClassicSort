//
//  Graph.swift
//  SortSwift
//
//  Created by Lawrence on 2020/6/16.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import Foundation

struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    var hasValue: Int {
        return data.hashValue
    }
    
    static func == (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(data)"
    }
}

enum EdgeType {
    case directed, undirected
}

struct Edge<T: Hashable> {
    var source: Vertex<T>
    /// 终点
    var destination: Vertex<T>
    /// 权重
    var weight: Double?
}

extension Edge: Hashable {
    var hasValue: Int {
        return "\(source)\(destination)\(weight ?? 0)".hashValue
    }
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

class Graph<T: Hashable> {
    var adjacencyDict:[Vertex<T>: [Edge<T>]] = [:]
}

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    func createVertex(data: Element) -> Vertex<Element>
    func addEdge(type: EdgeType, soruce: Vertex<Element>, destination: Vertex<Element>, weight: Double?)
    func weight(source: Vertex<Element>, destination: Vertex<Element>) -> Double?
    func edges(source: Vertex<Element>) -> [Edge<Element>]?
}

extension Graph: Graphable {
    typealias Element = T
    var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeStr = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeStr.append("\(edge.destination) ,")
                } else {
                    edgeStr.append("\(edge.destination)")
                }
            }
            
            result.append("\(vertex) --> [ \(edgeStr) ] \n")
        }
        
        return result
    }
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    func addEdge(type: EdgeType, soruce: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        if type == .directed {
            addDirectedEdge(source: soruce, destination: destination, weight: weight)
        } else {
            addUnDirectedEdge(source: soruce, destination: destination, weight: weight)
        }
    }
    
    func weight(source: Vertex<T>, destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else { return nil }
        for edge in edges {
            let _ = edge.destination == destination
            return edge.weight
        }
        
        return nil
    }
    
    func edges(source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
    private func addDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    private func addUnDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        let edgeA = Edge(source: source, destination: destination, weight: weight)
        let edgeB = Edge(source: destination, destination: source, weight: weight)
        adjacencyDict[source]?.append(edgeA)
        adjacencyDict[source]?.append(edgeB)
    }
}
