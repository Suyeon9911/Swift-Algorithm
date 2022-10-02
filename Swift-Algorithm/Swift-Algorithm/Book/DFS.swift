//
//  DFS.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/02.
//

import Foundation

// 깊이 우선 탐색

/*
 DFS는 스택 자료구조를 이용
 1. 탐색 시작 노드를 스택에 삽입하고 방문 처리를 한다.
 2. 스택의 최상단 노드에 방문하지 않은 인접 노드가 있으면 그 인접 노드를 스택에 넣고 방문 처리
  방문하지 않은 인접 노드가 없으면 스택에서 최상단 노드를 꺼낸다
 3. 2번의 과정을 더 이상 수행할 수 없을 때까지 반복

 일반적으로 인접한 노드 중에서 방문하지 않은 노드가 여러개 있으면 번호가 낮은 순서부터 처리
 */

func DFS() {

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


    // 각 노드가 방문된 정보를 1차원 배열로 표현
    var visited: [Bool] = Array(repeating: false, count: graph.count)

    func dfs(start: Int) {
        visited[start] = true // 시작 노드 방문처리
        print(start)
        for i in graph[start] {
            if !visited[i] {
                // 재귀 실행
                dfs(start: i)
            }
        }
    }

    dfs(start: 1)

}

func DFS2() {

    // 인접리스트 방식
    let graph: [String: [String]] = [
        "A" : ["B", "C"],
        "B" : ["A", "D", "E"],
        "C" : ["A", "F"],
        "D" : ["B"],
        "E" : ["B"],
        "F" : ["C"],
    ]

    // 보통 한개의 큐와 한개의 스택으로 구현 !
    // 방문해야하는 노드를 저장하는 stack
    // 이미 방문한 노드를 저장하는 큐

    // 1. 탐색할 노드의 데이터를 needVisitStack에 넣는다
    // 2. needVisitStack의 마지막 값을 추출해서 , visitedQueue에 해당 값이 존재하는지 확인
    // 3. 만약 visitedQueue에 추출한 값이 존재하면, 추출한 값은 버리고 그 다음 마지막 값을 다시 추출하여 반복
    // 4. needVisitStack이 비면 탐색 끝.
    // 5. 추출된 값이 visitedQueue에 존재하지 않으면 추가
    // 6. 추출된 값에 연결된 간선들을 모두 needvisitStack에 추가

    func dfs2(graph: [String:[String]], start: String) -> [String] {
        var visitedQueue: [String] = []
        var needVisitStack: [String] = [start]

        while !needVisitStack.isEmpty {
            let node: String = needVisitStack.removeLast()
            if visitedQueue.contains(node) { continue }

            visitedQueue.append(node)
            needVisitStack += graph[node] ?? []
        }

        return visitedQueue
    }

}
