//
//  음료수 얼려 먹기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// N X M 크기의 얼음 틀 . 구멍이 뚤린 부분은 0 / 칸막이가 존재하는 부분은 1로 표시
// 구멍이 뚫려 있는 부분끼리 상, 하 , 좌, 우로 붙어있는 경우 서로 연결되어 있는 것으로 간주
// 생성되는 총 아이스크림의 개수 구하기

// DFS 로 해결 -> 상하좌우로 연결된 묶음 이 묶음들을 구해주는 거 ? DFS 로 풀자

/*

 1. 특정한 지점의 주변 상하좌우를 살펴본 뒤에 주변 지점 중에서 값이 0이면서 아직 방문하지 않은 지점이 있다면 해당 지점을 방문
 2. 방문한 지점에서 다시 상하좌우를 살펴보면서 방문을 다시 진행하면, 연결된 모든 지점을 방문할 수 있다.

 */

func 음료수얼려먹기(_ n: Int, _ m: Int,_ map: [[Int]]) {

    var map = map

    // DFS로 특정 노드를 방문한 뒤에 연결된 모든 노드들도 방문
    func dfs(x: Int, y: Int) -> Bool {
        // 주어진 범위를 벗어나는 경우 즉시 종료
        if x <= -1 || x >= n || y <= -1 || y >= m {
            return false
        }

        // 현재 노드를 아직 방문하지 않았다면
        if map[x][y] == 0 {
            // 해당 노드 방문처리
            map[x][y] = 1
            // 상하좌우 재귀 호출
            dfs(x: x-1, y: y)
            dfs(x: x, y: y-1)
            dfs(x: x+1, y: y)
            dfs(x: x, y: y+1)

            return true
        }
        return false
    }

    // 모든 노드에 대해서 음료수 채우기
    var result = 0

    for i in 0..<n {
        for j in 0..<m {
            // 현재 위치에서 dfs 수행
            if dfs(x: i, y: j) {
                // 방문 다 끝나면 true : 음료수 채움
                result += 1
            }
        }
    }
}
