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