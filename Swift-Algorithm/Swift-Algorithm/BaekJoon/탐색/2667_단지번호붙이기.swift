//
//  2667_단지번호붙이기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// https://www.acmicpc.net/problem/2667

// 상하좌우로 연결된 묶음들 구하기 : bfs

/*

 1. 특정한 집의 주변 상하좌우를 살펴본 뒤에 주변 지점 중에서 값이 1이면서 아직 방문하지 않은 지점이 있다면 해당 지점을 방문
 2. 방문한 지점에서 다시 상하좌우를 살펴보면서 방문을 다시 진행하면, 연결된 모든 집을 방문할 수 있다.
 3. 방문을 다 끝낼때마다 단지수 체크해주고, 집 개수 세기

 7
 0110100
 0110101
 1110101
 0000111
 0100000
 0111110
 0111000
 
 */

func 단지번호붙이기() {

    let mapSize = Int(readLine()!)!

    var graph: [[Int]] = []

    for _ in 0..<mapSize {
        let nums = Array(readLine()!).map{ Int(String($0))! }
        graph.append(nums)
    }

    var danzi = 0
    var danziCount = 0
    var danziArray: [Int] = []
    

    // DFS로 특정 노드를 방문한 뒤에 연결된 모든 노드들도 방문
    func dfs(x: Int, y: Int) -> Bool {
        
        // 주어진 범위를 벗어나는 경우 즉시 종료
        if x <= -1 || x >= mapSize || y <= -1 || y >= mapSize {
            return false
        }

        // 현재 노드를 아직 방문하지 않았다면
        if graph[x][y] == 1 {
            // 해당 노드 방문처리
            graph[x][y] = 0
            // 상하좌우 재귀 호출
            dfs(x: x-1, y: y)
            dfs(x: x, y: y-1)
            dfs(x: x+1, y: y)
            dfs(x: x, y: y+1)

            danziCount += 1
            return true
        }
        return false
    }

    // 단지 계산하기

    for i in 0..<mapSize {
        for j in 0..<mapSize {
            // 현재 위치에서 dfs 수행
            if dfs(x: i, y: j) {
                // 방문 다 끝나면 true : 단지 계산
                danzi += 1
                danziArray.append(danziCount)
                danziCount = 0
            }
        }
    }

    print(danzi)
    danziArray.sort()
    for i in danziArray {
        print(i)
    }
}

// test case 예제는 통과하는데 채점하면 틀림 -> 아 sort 안했네 ;; 킹받게
// 인터넷 검색

// 아직 방문하지 않은 곳이면서 1인 곳을 찾아서 돌리기

func 단지번호다른풀이() {
    let n = Int(readLine()!)!
    var graph = [[Int]]()


    for _ in 0..<n {
        graph.append(Array(readLine()!).map { Int(String($0))!})
    }

    var visited = Array(repeating: Array(repeating: false, count: n), count: n)

    // 전부 돌면서 1이 뭉쳐있는 곳이 하나의 단지, 아직 방문하지 않은 곳이면서 1인 좌표로 dfs

    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    var danzi = 0

    func dfs(x: Int, y: Int) {
        danzi += 1
        visited[x][y] = true

        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                if graph[nx][ny] == 1 && !visited[nx][ny] {
                    // 상하좌우 dfs
                    dfs(x: nx, y: ny)
                }
            }
        }
    }

    var danziArray: [Int] = []


    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == 1 && !visited[i][j] {
                danzi = 0
                dfs(x: i, y: j)
                danziArray.append(danzi)
            }
        }
    }

    print(danziArray.count)
    danziArray.sort()
    for i in danziArray {
        print(i)
    }
}

