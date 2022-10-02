//
//  게임개발.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/29.
//

import Foundation

func 게임개발(n: Int, m: Int, x: Int, y: Int, direction: Int, map: [[Int]]) {
    // 방문한 위치를 저장하기 위한 맵을 생성하여 0으로 초기화
    // 세로 n 가로 m 이니까 m 개 배열 n개
    var visit: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

    // 현재 캐릭터 위치, 방향 x,y , direction
    // 현재 위치 방문표시

    var x = x
    var y = y
    visit[x][y] = 1

    // 현재 맵 정보 - map

    // 북, 동 , 남, 서 방향 정의 -> 좌표 A.B 가 북쪽에서 A만큼 서쪽에서 B만큼 떨어진 위치 !
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    // 왼쪽으로 회전하는 메서드
    func turnLeft() {
        var direction = direction
        direction -= 1

        if direction == -1 {
            direction = 3
        }
    }

    // 시뮬레이션 시작
    var count = 1
    var turnTimes = 0

    while true {
        // 1. 왼쪽으로 회전하기 -> 왼쪽에 가보지 않은 칸이 존재하면 , 왼쪽으로 회전 후 전진
        // 가보지 않은 칸이 없다면, 회전만 하자 ! => 일단 회전은 무조건
        turnLeft()
        var nx = x + dx[direction]
        var ny = y + dy[direction]

        // 2. 회전한 이후 정면에 가보지 않은 칸이 있고, 바다가 아닐 경우
        if visit[nx][ny] == 0 && map[nx][ny] == 0 {
            visit[nx][ny] = 1 // 방문
            x = nx
            y = ny
            count += 1
            // 위치 이동, 이동 횟수 1 증가
            turnTimes = 0 // 이동했기 때문에 turnTime은 0으로 초기화
            continue // 다시 turnLeft() 메서드 호출시점으로 돌아감
        } else {
            // 회전한 이후 정면에 가보지 않은 칸이 없고, 바다일 경우 방향 돌기
            turnTimes += 1
        }

        if turnTimes == 4 {
            // 4방향 모두 갈 수 없는 경우
            nx = x - dx[direction]
            ny = y - dy[direction]
            // 한칸 뒤로 이동 할 예정 ! 뒤로 이동 할수 있는지 검사
            if map[nx][ny] == 0 {
                // 육지일 경우 뒤로가기
                x = nx
                y = ny
            } else {
                // 바다일 경우
                break
            }

            turnTimes = 0
        }
    }

    print(count)
}

// 게임개발(n: 4, m: 4, x: 1, y: 1, direction: 0, map: [[1,1,1,1],[1,0,0,1],[1,1,0,1],[1,1,1,1]])
