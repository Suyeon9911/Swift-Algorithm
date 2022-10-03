//
//  2178_미로탐색.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// https://www.acmicpc.net/problem/2178

// 미로문제 -> N X M 맵에서 1,1 시작 -> N,M위치로 이동할 때 ?
// BFS 활용해서 풀자

// 미로에서 1은 이동할 수 있는 칸을 나타내고, 0은 이동할 수 없는 칸을 나타낸다. 이러한 미로가 주어졌을 때, (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하는 프로그램

/*
 4 6
 101111
 101010
 101011
 111011
 */

func 백준2178() {

    let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }

    let n = firstLine[0]
    let m = firstLine[1]

    var graph: [[Int]] = []

    for _ in 0..<n {
        let nums = Array(readLine()!).map{ Int(String($0))! }
        graph.append(nums)
    }

    // 이동할 네 방향 정의 상하좌우
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]


    func bfs(x: Int, y: Int) -> Int {
        // 큐 구현
        var queue = [(Int, Int)]()
        queue.append((x,y)) // 현재 위치

        while !queue.isEmpty {
            // 큐가 빌때까지 반복
            // 여기서 removeFirst().0
            // removeFirst().1 로 접근했더니 x에서 이미 제거된거라 y 할당시 오류남
            var position = queue.removeFirst()

            var x = position.0
            var y = position.1

            // 현재위치에서 갈수있는 곳 확인
            for i in 0...3 {
                var nx = x + dx[i]
                var ny = y + dy[i]

                // 맵 안에 포함되고, 그래프의 값이 1일때만 방문가능.

                if (0..<n).contains(nx) && (0..<m).contains(ny) && graph[nx][ny] == 1 {
                    graph[nx][ny] = graph[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }

        // 가장 오른쪽 아래까지의 최단 거리 반환
        return graph[n-1][m-1]
    }

    print(bfs(x: 0, y: 0))
}
