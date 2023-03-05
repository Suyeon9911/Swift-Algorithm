    let inputLine = readLine()!.split(separator: " ").map { Int(String($0))! }

    let subin = inputLine[0]
    let sister = inputLine[1]

    var visited = Array(repeating: 0, count: 100001)



    func bfs(location: Int, depth: Int) {
        visited[location] = 1 // 방문처리

        var queue: [Int] = []
        var index = 0

        queue.append(location)

        while queue.count > index {
            let now = queue[index]
            index += 1

            if (0...100000) ~= now-1 && visited[now-1] == 0 {
                visited[now-1] = visited[now] + 1
                queue.append(now-1)
            }

            if (0...100000) ~= now+1 && visited[now+1] == 0 {
                visited[now+1] = visited[now] + 1
                queue.append(now+1)
            }

            if (0...100000) ~= now*2 && visited[now*2] == 0 {
                visited[now*2] = visited[now] + 1
                queue.append(now*2)
            }
        }

    }

    if subin == sister {
        print(0)
    } else {
        bfs(location: subin, depth: 0)
        print(visited[sister]-1)
    }