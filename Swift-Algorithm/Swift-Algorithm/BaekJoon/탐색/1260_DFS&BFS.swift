//
//  1260_DFS&BFS.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// https://www.acmicpc.net/problem/1260

// 입력조건 : 노드개수 , 간선개수, 시작번호

func 백준1260() {
    let info = readLine()!.split(separator: " ").map{ Int(String($0))!}

    let node = info[0]
    let line = info[1]
    let start = info[2]

    // 0번 노드는 빈배열. -> 따라서 node+1 을 count로 
    var graph : [[Int]] = Array(repeating: [], count: node+1)

    var visitedDFS: [Bool] = Array(repeating: false, count: graph.count)

    for _ in 0..<line {
        let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = relation[0]
        let b = relation[1]
        graph[a].append(b)
        graph[b].append(a)
        graph[a].sort()
        graph[b].sort()
    }

    func dfs(_ now: Int) {
        visitedDFS[now] = true
        print(now, terminator: " ")

        for i in graph[now] {
            if !visitedDFS[i] {
                dfs(i)
            }
        }
    }

    var needVisitQueue: [Int] = []
    var visitedBFS: [Bool] = Array(repeating: false, count: graph.count)

    func bfs(_ now: Int) {
        needVisitQueue.append(now)
        visitedBFS[now] = true

        while !needVisitQueue.isEmpty {
            var element = needVisitQueue.removeFirst()
            print(element, terminator: " ")

            for i in graph[element] {
                if !visitedBFS[i] {
                    needVisitQueue.append(i)
                    visitedBFS[i] = true
                }
            }
        }

    }

    dfs(start)
    print("")
    bfs(start)
}
