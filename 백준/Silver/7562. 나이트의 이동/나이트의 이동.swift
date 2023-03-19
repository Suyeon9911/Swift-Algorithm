    let tc = Int(readLine()!)!

    struct Position: Hashable {
        var x: Int
        var y: Int
    }


    for _ in 1...tc {
        let chess = Int(readLine()!)! // 체스판의 변 길이
        let nowPosition = readLine()!.split(separator: " ").map { Int(String($0))! }
        let destination = readLine()!.split(separator: " ").map { Int(String($0))! }

        let now = Position(x: nowPosition[0], y: nowPosition[1])
        let goal = Position(x: destination[0], y: destination[1])

        if now == goal {
            print(0)
            continue
        }


        var map: [[Int]] = Array(repeating: Array(repeating: 0, count: chess), count: chess)


        func bfs(x: Int, y: Int) {
            let position = Position(x: x, y: y)
            map[position.x][position.y] += 1

            var queue = [position]
            var index = 0

            let dx = [2,1,-1,-2,1,2,-2,-1]
            let dy = [1,2,2,1,-2,-1,-1,-2]


            while queue.count > index {
                let nowp = queue[index]
                index += 1
                
                for i in 0..<dx.count {
                    let nx = nowp.x + dx[i]
                    let ny = nowp.y + dy[i]

                    let next = Position(x: nx, y: ny)

                    if (0..<chess) ~= nx && (0..<chess) ~= ny {
                        if map[nx][ny] == 0 {
                            map[nx][ny] = map[nowp.x][nowp.y] + 1
                            queue.append(next)
                        }
                    }
                }
            }
        }



        bfs(x: now.x, y: now.y)
        print(map[goal.x][goal.y]-1) // 처음 시작을 1을 해버렸자나.. omg -1 해주자.
    }