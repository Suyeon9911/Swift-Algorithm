//
//  BFS.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/02.
//

import Foundation

// 너비 우선 탐색
// 가까운 노드부터 탐색하는 알고리즘
// 큐 자료구조 사용 : 인접한 노드를 반복적으로 큐에 넣도록 알고리즘 작성

// 1. 탐색 시작 노드를 큐에 삽입하고 방문처리
// 2. 큐에서 노드를 꺼내 해당 노드의 인접 노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문처리
// 3. 2번의 과정을 반복
// 보통 DFS 보다는 BFS 가 더 빠르게 동작

func BFS() {

    let graph: [[Int]] = [
        [],
        [2, 3, 8],
        [1, 7],
        [1, 4, 5],
        [3, 5],
        [3, 4],
        [7],
        [2, 6, 8],
        [1, 7]
    ]

    var queue = Queue<Int>()

    // 각 노드가 방문된 정보를 1차원 배열로 표현
    var visited: [Bool] = Array(repeating: false, count: graph.count)

    func bfs(start: Int) {
        queue.enqueue(start)
        visited[start] = true

        while !queue.isEmpty {
            // queue가 비어잇지 않을 때 까지
            // 큐에서 노드를 꺼내서
            guard let element = queue.dequeue() else { return }
            print(element)

            for i in graph[element] {
                // 인접노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문처리
                if !visited[i] {
                    queue.enqueue(i)
                    visited[i] = true
                }
            }
        }
    }
}
