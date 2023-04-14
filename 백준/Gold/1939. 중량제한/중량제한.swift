    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]

    var landArray: [[(Int, Int)]] = Array(repeating: [], count: n+1)

    var minWeight = 1000000000 // 최대 중량
    var maxWeight = 1 // 최소 중량

    for _ in 1...m {
        let xyw = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = xyw[0]
        let y = xyw[1]
        let w = xyw[2]

        landArray[x].append((y,w))
        landArray[y].append((x,w))
        minWeight = min(minWeight, w)
        maxWeight = max(maxWeight, w)
    }

    let factory = readLine()!.split(separator: " ").map { Int(String($0))! }
    let startNode = factory[0]
    let endNode = factory[1]

    func bfs(searchWeight: Int) -> Bool {
        // 중량제한 건널수 있는지 없는지
        // searchWeight로 이진탐색 -> 판별 -> true/ false

        var queue = [startNode]
        var visited = Array(repeating: false, count: n+1)

        visited[startNode] = true
        var index = 0

        while queue.count > index {
            let x = queue[index]
            index += 1

            for (y,w) in landArray[x] {
                if !visited[y] && w >= searchWeight {
                    // 건널수 있다면
                    visited[y] = true
                    queue.append(y)
                }
            }
        }
        // start노드에서 시작해서 . end 노드에 visited 했는지
        return visited[endNode]
    }

    var result = minWeight // 일단 최소 중량으로 시작 !

    while minWeight <= maxWeight {
        let mid = (minWeight+maxWeight) / 2
        if bfs(searchWeight: mid) {
            // 이동이 가능하면 = 중량 증가
            result = mid // 최대중량
            minWeight = mid + 1
        } else {
            // 이도잉 불가능 = 중량 감소
            maxWeight = mid - 1
        }
    }

    print(result)