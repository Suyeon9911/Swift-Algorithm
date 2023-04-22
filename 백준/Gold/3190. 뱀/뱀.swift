import Foundation

func 뱀() {

    let n = Int(readLine()!)! // 보드 크기
    let k = Int(readLine()!)! // 사과 개수

    var map = Array(repeating: Array(repeating: 0, count: n+1), count: n+1) // map 초기화

    for _ in 0..<k {
        // 사과의 위치가 주어진다. 1로 표시
        let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[xy[0]][xy[1]] = 1
    }

    // 방향 회전 정보
    let r = Int(readLine()!)!

    var rotateInfo: [(Int, String)] = []

    for _ in 1...r {
        let info = readLine()!.split(separator: " ").map { String($0) }

        rotateInfo.append((Int(info[0])!, info[1]))
    }

    // 처음에는 오른쪽을 보고 있으니까 순서 : 동 남 서 북
    let dx = [0,1,0,-1]
    let dy = [1,0,-1,0]

    // 동쪽을 보고 있을 때 앞으로 가면  x, y+1
    // 남쪽을 보고 있을 경우 x+1, y
    // 서쪽을 보고 있을 경우 x, y-1
    // 북쪽으로 보고 있을 경우 x-1,y

    func turn(direction: Int, c: String) -> Int {

        var direction = direction
        if c == "L" {
            // 왼쪽으로 회전
            direction = (direction - 1 + 4) % 4
        } else {
            // 오른쪽으로 회전
            direction = (direction + 1) % 4
        }

        return direction
    }

    func simulate() {
        var (x, y) = (1,1) // 뱀의 머리 위치 .
        map[x][y] = 2 // 뱀이 존재하는 곳은 2로 표시

        var direction = 0 // 처음에는 동쪽을 보고 있음.
        var time = 0 // 시작한 뒤 시간 재기
        var index = 0 // 다음에 회전할 정보 -> info 배열 탐색을 위한 index

        var queue = [(x,y)] // 뱀이 차지하고 있는 위치 정보 - 꼬리가 앞쪽

        while true {
            let nx = x + dx[direction]
            let ny = y + dy[direction]

            // map의 범위 안에 있고, 뱀의 몸통이 없는 위치라면.
            if (1...n) ~= nx && (1...n) ~= ny && map[nx][ny] != 2 {
                // 사과가 없다면 이동 후에 꼬리 제거하기
                if map[nx][ny] == 0 {
                    map[nx][ny] = 2
                    queue.append((nx,ny)) // 머리추가
                    let (px, py) = queue.removeFirst() // 꼬리 제거
                    map[px][py] = 0
                }

                // 사과가 있다면 이동 후에 꼬리 그대로
                if map[nx][ny] == 1 {
                    map[nx][ny] = 2
                    queue.append((nx,ny))
                }
            } else {
                // 벽이거나 뱀의 몸통에 부딪힌 경우
                time += 1
                break
            }

            // 사과에 따른 뱀 길이 처리 해준 후 다음으로 넘어가기 위한 작업
            (x, y) = (nx, ny) // 다음 위치로 머리 이동 반영.
            time += 1

            if index < r && time == rotateInfo[index].0 {
                // 아직 방향 전환할 게 남아있고, 회전할 시간이 되면 회전하기
                direction = turn(direction: direction, c: rotateInfo[index].1) // 현재 방향과 회전 정보를 넣고 turn
                index += 1

            }
        }
        print(time)
    }

    simulate()
}

뱀()