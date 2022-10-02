//
//  상하좌우.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

func 상하좌우() {
    let map = Int(readLine()!)!

    var x = 1
    var y = 1

    let plans = readLine()!.components(separatedBy: " ")

    // L, R, U, D 에 따른 이동 방향
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    let moveType = ["L","R","U","D"]

    var nx: Int = 0
    var ny: Int = 0

    // 이동 계획을 하나씩 확인.
    for plan in plans {
        // 이동 후의 좌표 구하기
        for i in 0..<moveType.count { // 0 1 2 3
            if plan == moveType[i] {
                nx = x + dx[i]
                ny = y + dy[i]
            }
        }
        // 공간을 벗어나는 경우 무시
        if nx < 1 || ny < 1 || nx > map || ny > map {
            continue
        }

        // 이동 수행
        x = nx
        y = ny
    }

    print(x, y)
}
