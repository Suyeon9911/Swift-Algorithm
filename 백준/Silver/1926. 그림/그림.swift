
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

    let n = nm[0]
    let m = nm[1]

    var maps: [[Int]] = []
    for _ in 0..<n {
        let map = readLine()!.split(separator: " ").map { Int(String($0))! }
        maps.append(map)
    }

    var visited = Array(repeating: Array(repeating: false, count: m), count: n)

    var count = 0
    var maxValue = 0

    let dy = [0,1,0,-1]
    let dx = [1,0,-1,0]

    func bfs(_ y: Int, _ x: Int) -> Int {
        var queue:[(Int,Int)] = [(y,x)]
        var size = 1

        while !queue.isEmpty {
            let position = queue.removeFirst()

            let y = position.0
            let x = position.1

            for k in 0...3 {
                let ny = y + dy[k]
                let nx = x + dx[k]

                if ny >= 0 && ny < n && nx >= 0 && nx < m {
                    if maps[ny][nx] == 1 && !visited[ny][nx] {
                        size += 1
                        visited[ny][nx] = true
                        queue.append((ny,nx))
                    }
                }
            }
        }
        return size
    }

    for j in 0..<n {
        for i in 0..<m {
            if maps[j][i] == 1 && !visited[j][i] {
                visited[j][i] = true
                // 전체 그림 개수를 + 1
                // BFS 그림 크기를 구해주고 최대값 갱신
                count += 1
                maxValue = max(maxValue, bfs(j,i))
            }
        }
    }
    print(count)
    print(maxValue)