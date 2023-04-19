    let size = Int(readLine()!)!

    var map = [[Int]]()

    for _ in 1...size {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        map.append(line)
    }

    let inf = Int.max

    // 아기 상어의 현재 크기, 현재 위치
    var nowSize = 2
    var (cx,cy) = (0,0)

    // 아기 상어의 시작 위치를 찾기
    for i in 0..<size {
        for j in 0..<size {
            if map[i][j] == 9 {
                (cx,cy) = (i,j)
                map[cx][cy] = 0 // 상어의 현재 위치에는 이제 아무것도 없음
            }
        }
    }

    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    // 모든 위치까지의 최단 거리 테이블을 구해주기
    func bfs() -> [[Int]] {
        // 값이 -1이라면 도달할 수 없다는 의미.
        var dist = Array(repeating: Array(repeating: -1, count: size), count: size)

        // 시작 위치는 도달이 가능함
        var queue = [(cx,cy)]
        var index = 0
        dist[cx][cy] = 0 // 현재까지의 거리는 0

        while index < queue.count {
            let (x,y) = queue[index]
            index += 1

            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if (0..<size) ~= nx && (0..<size) ~= ny {
                    // 자신의 크기보다 작거나 같은 경우에만 지나갈 수 있다.
                    if dist[nx][ny] == -1 && map[nx][ny] <= nowSize {
                        dist[nx][ny] = dist[x][y] + 1
                        queue.append((nx,ny))
                    }
                }
            }
        }
        // 모든 위치까지의 거리 테이블 반환
        return dist
    }

    // 최단 거리 테이블이 주어졌을 때, 먹을 물고기를 찾는 함수

    func findFish(dist: [[Int]]) -> [Int] {
        var (x,y) = (0,0)
        var minDist = inf

        for i in 0..<size {
            for j in 0..<size {
                // 도달이 가능하면서 먹을 수 있는 물고기.
                if dist[i][j] != -1 && map[i][j] >= 1 && map[i][j] < nowSize {
                    // 가장 가까운 물고기 1마리 선택
                    if dist[i][j] < minDist {
                        (x,y) = (i,j)
                        minDist = dist[i][j]
                    }
                }
            }
        }

        if minDist == inf { // 먹을 수 있는 물고기가 없음
            return []
        } else {
            return [x,y,minDist] // 먹을 물고기의 위치, 최단거리
        }
    }

    var result = 0 // 최종 답안
    var ateCount = 0 // 현재 크기에서 먹은 물고기의 수

    while true {
        // 먹을 수 있는 물고기 위치 찾기
        let value = findFish(dist: bfs())
        // 먹을 수 있는 물고기가 없는 경우,

        if value.isEmpty {
            print(result) // 현재까지 움직인 시간 출력
            break
        } else {
            // 먹을 수 있는 물고기가 있는 경우 먹으러가기.
            // 현재 위치를 갱신하고 이동 거리를 변경.
            (cx, cy) = (value[0], value[1])
            result += value[2]

            // 먹은 위치는 이제 아무것도 없음.
            map[cx][cy] = 0
            ateCount += 1

            // 자신의 현재 크기 이상으로 물고기를 먹으면 크기 증가됨.
            if ateCount >= nowSize {
                nowSize += 1
                ateCount = 0
            }
        }
    }