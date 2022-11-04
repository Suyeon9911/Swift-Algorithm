//
//  특정거리의도시찾기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/27.
//

import Foundation

/*
 1-N 번 까지의 도시와 M개의 단방향 도로가 존재
 모든 도로의 거리는 1
 도달할 수 있는 도시중에서 최단거리가 정확히 K인 모든 도시의 번호를 출력

 입력 :
 4 4 2 1 -> 도시개수 n 도로 개수 m 거리저옵 K 출발 도시 번호 x

 1 2
 1 3
 2 3
 2 4
 */

func 특정거리의도시찾기() {

    let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let cityNumber = firstLine[0]
    let roadNumber = firstLine[1]
    let distance = firstLine[2]
    let startCity = firstLine[3]

    var cityMap: [[Int]] = Array(repeating: [], count: cityNumber+1)

    // 도시 끼리 관계 맵
    for _ in 0..<roadNumber {
        // [1,2] 이렇게 저장하면 안대고.
        // index 1에 [2,3] index 2에 [3,4] 이런식으로 저장해야편하겠지 ?


        let road = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = road[0] // 1
        let b = road[1] // 2
        cityMap[a].append(b) // 1번인덱스에 2번 길 추가
        // graph[b].append(a)  -> 양방향일 경우
        cityMap[a].sort()
        // graph[b].sort()
    }

    var bfsQueue: [Int] = []

    // 각 노드가 방문된 정보를 1차원 배열로 표현
    var visited: [Int] = Array(repeating: -1, count: cityNumber+1) // 노드 만큼 거리 저장.

    func bfs(start: Int) {
        bfsQueue.append(start)
        visited[start] = 0

        while !bfsQueue.isEmpty {
            let element = bfsQueue.removeFirst()

            for i in cityMap[element] {
                // 인접노드 중에서 방문하지 않은 노드를 모두 큐에 삽입하고 방문처리
                if visited[i] == -1 {
                    visited[i] = visited[element] + 1
                    bfsQueue.append(i)
                }
            }
        }
    }

    bfs(start: startCity)

    var check = false

    for i in 1...cityNumber {
        if visited[i] == distance {
            print(i)
            check = true
        }
    }

    if !check {
        print(-1)
    }
}
