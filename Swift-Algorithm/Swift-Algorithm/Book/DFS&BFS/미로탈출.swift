//
//  미로탈출.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/03.
//

import Foundation

// N x M 크기의 직사각형 형태의 미로에 갇혀있다.
// 미로에는 여러마리의 괴물이 있어 이를 피해 탈출해야 함
// 동빈이 위치는 1,1 이고 미로의 출구는 N,M 위치에 존재
// 한번에 한칸씩 이동가능
// 괴물이 있는 부분은 0 , 없는 부분은 1
// 탈출하기 위해 움직여야하는 최소 칸의 개수 ?

/*
 BFS 로 풀었을 때 효과적으로 해결할 수 있따.
 BFS는 시작 지점에서 가까운 노드부터 차례대로 그래프의 모든 노드를 탐색하기 때문이다.
 그러므로 1,1 지점에서부터 bfs를 수행하여 모든 노드의 값을 거리 정보로 넣으면된다.
 특정한 노드를 방문하면 그 이전의 노드의 거리에 1을 더한 값을 저장.
 */

func 미로탈출(n: Int, m: Int, map: [[Int]]) {

    var map = map

    // 이동할 네 방향 정의 상하좌우
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    // BFS 소스코드 구현
    func bfs(x: Int, y: Int) -> Int {
        // 큐 구현
        var queue = Queue<(Int, Int)>()
        queue.enqueue((x,y))

        // 큐가 빌 떄까지 반복
        while !queue.isEmpty {
            guard var x = queue.dequeue()?.0 else { return 0 }
            guard var y = queue.dequeue()?.1 else { return 0 }

            // 현재 위치에서 네 방향으로의 위치 확인
            for i in 0...3 {
                var nx = x + dx[i]
                var ny = y + dy[i]

                // 미로 찾기 공간을 벗어난 경우 무시
                if nx < 0 || ny < 0 || nx > n || ny > m {
                    continue
                }

                // 벽인 경우 무시
                if map[nx][ny] == 0 {
                    continue
                }

                // 해당노드를 처음 방문하는 경우에만 최단 거리 기록
                if map[nx][ny] == 1 {
                    map[nx][ny] = map[x][y] + 1
                    queue.enqueue((nx, ny))

                }

            }

        }

        // 가장 오른쪽 아래까지의 최단 거리 반환
        return map[n-1][m-1]
    }

    print(bfs(x: 0, y: 0))
}
