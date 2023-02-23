    let first = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = first[0]
    let m = first[1]

    var box: [[Int]] = []

    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        box.append(line)
    }

    var queue = [[Int]]()
    var day = 0

    for i in 0..<m {
        for j in 0..<n {
            if box[i][j] == 1 {
                queue.append([i, j, day])
            }
        }
    }

    func bfs() {
        var index = 0

        while index < queue.count {
            let now = queue[index]
            index += 1

            let dy = [0,1,0,-1]
            let dx = [1,0,-1,0]

            for i in 0...3 {
                let nx = now[0] + dx[i]
                let ny = now[1] + dy[i]
                let nDay = now[2] + 1

                if (0..<m) ~= nx && (0..<n) ~= ny {
                    if box[nx][ny] == 0 {
                        day = nDay
                        box[nx][ny] = 1
                        queue.append([nx,ny,nDay])
                    }
                }
            }
        }

    }

    bfs()
    var isCooked = true


    for i in 0..<m {
        for j in 0..<n {
            if box[i][j] == 0 {
                // 익지 않은게 있는지 파악
                isCooked = false
            }
        }
    }

    if isCooked {
        print(day)
    } else {
        print(-1)
    }