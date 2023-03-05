    let test = Int(readLine()!)!

    for _ in 1...test {
        let mapInput = readLine()!.split(separator: " ").map { Int(String($0))! }

        let m = mapInput[0]
        let n = mapInput[1]
        let number = mapInput[2]

        var map = Array(repeating: Array(repeating: 0, count: m), count: n)

        // map 표시과정
        for _ in 1...number {
            let line = readLine()!.split(separator: " ").map { Int(String($0))! }
            map[line[1]][line[0]] = 1
        }

        var needCount = 0

        func dfs(x: Int, y: Int) {
            map[x][y] = 0

            let dx = [-1, 1, 0, 0]
            let dy = [0, 0, -1, 1]

            for i in 0...3 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if (0..<n) ~= nx && (0..<m) ~= ny {
                    if map[nx][ny] == 1 {
                        dfs(x: nx, y: ny)
                    }
                }
            }
        }

        for i in 0..<map.count {
            for j in 0..<map[i].count {
                if map[i][j] == 1 {
                    needCount += 1
                    dfs(x: i, y: j)
                }
            }
        }

        print(needCount)
    }