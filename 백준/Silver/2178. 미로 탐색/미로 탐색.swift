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

                if (0..<n) ~= nx && (0..<m) ~= ny && graph[nx][ny] == 1 {
                    graph[nx][ny] = graph[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }

        // 가장 오른쪽 아래까지의 최단 거리 반환
        return graph[n-1][m-1]
    }

    print(bfs(x: 0, y: 0))