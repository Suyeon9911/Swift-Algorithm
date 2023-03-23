    let nm = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let (n, m) = (nm[0], nm[1])

    // 선 플레이어 : 홀수번째 차례
    // 후 플레이어 : 짝수번째 차례

    // 사이클이 완성되는 순간 게임 종료

    var parent = [Int](0..<n)

    func findParent(x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = findParent(x: parent[x])
        return parent[x]
    }

    // union 연산

    func union(a: Int, b: Int) -> Bool {
        let ra = findParent(x: a)
        let rb = findParent(x: b)

        if ra == rb { return false }

        if ra < rb {
            parent[rb] = ra
        } else {
            parent[ra] = rb
        }
        return true
    }

    var cycleCount = 1

    // var game = [(Int, Int)]()

//    for _ in 0..<m {
//        let ab = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
//        game.append((ab[0], ab[1]))
//    }
//
//    for i in game {
//        cycleCount += 1
//        if union(a: i.0, b: i.1) {
//            continue
//        } else {
//            break
//        }
//    }

    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

        if union(a: ab[0], b: ab[1]) {
            cycleCount += 1
            continue
        } else {
            break
        }
    }
    
    cycleCount > m ? print(0) : print(cycleCount)