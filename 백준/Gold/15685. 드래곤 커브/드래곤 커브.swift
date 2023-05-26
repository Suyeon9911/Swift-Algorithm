import Foundation

func 드래곤커브() {

    /*
     K세대 드래곤 커브는 K-1 세대 드래곤 커브를 끝 점을 기준으로 90도 시계 방향 회전 시킨 다음 끝 점에 붙이기
     x,y는 시작점, d는 시작 방향, g는 세대

     0: x좌표가 증가하는 방향, 1: y좌표가 감소하는 방향, 2: x좌표가 감소하는 방향 3: y좌표가 증가하는 방향
     반시계 방향으로 4가지 방향 고려 -> 우 상 좌 하

     dx = [1, 0, -1, 0]
     dy = [0, -1, 0, 1]

     0단계 : 우
     1단계 : 우 상
     2단계 : 우 상 좌 상
     3단계 : 우 상 좌 상 좌 하 좌 상 -> 0 1 2 1 2 3 2 1 배열 형태로

     각 단계 확인 -> 규칙성 도출 : 다음 단계 배열 = 이전 단계 배열 + 이전 단계 배열을 뒤집고, 각 원소에 1을 더한 것.
     */

    // map을 만들고, n은 최대 20 => n*n 배열 만들기 , 격자를 벗어나지 않으므로 시뮬레이션

    let n = Int(readLine()!)!
    var array = Array(repeating: Array(repeating: false, count: 101), count: 101)

    let dx = [1, 0, -1, 0]
    let dy = [0, -1, 0, 1]

    for _ in 1...n {
        let xydg = readLine()!.split(separator: " ").map { Int(String($0))! }
        var x = xydg[0]
        var y = xydg[1]
        let d = xydg[2]
        let g = xydg[3]

        // 현재 이동 계획
        var current = [d]

        for _ in 0..<g {
            var temp = [Int]() // 현재 배열을 뒤집은 뒤에 1씩 더해서 일단 temp에 저장해두기
            for j in stride(from: current.count-1, to: -1, by: -1) {
                temp.append((current[j]+1) % 4)
            }
            current += temp
        }

        // 드래곤 커브가 지나가는 점들 - 방문 처리
        array[x][y] = true
        for i in 0..<current.count {
            x = x + dx[current[i]]
            y = y + dy[current[i]]
            array[x][y] = true
        }
    }

    // 4꼭지점이 모든 드래곤 커브의 일부인 정사각형 개수 계산
    var result = 0
    for i in 0..<100 {
        for j in 0..<100 {
            if (array[i][j] && array[i][j+1] && array[i+1][j] && array[i+1][j+1]) {
                result += 1
            }
        }
    }

    print(result)
}

드래곤커브()