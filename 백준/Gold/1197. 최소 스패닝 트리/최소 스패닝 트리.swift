    // compactMap => 언래핑 안해도 된당.
    let ve = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let (v, e) = (ve[0], ve[1])

    // 1. 튜플 만들기 : (정점1, 정점2, 가중치)
    var connect = [(Int, Int, Int)]()
    for _ in 0..<e {
        let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        let (a, b, c) = (line[0], line[1], line[2])
        connect.append((a,b,c))
    }

    // 2. 가중치 기준으로 정렬 : 가중치가 작은 정점부터 추가.
    connect = connect.sorted(by: { $0.2 < $1.2 })

    // 3. 부모 노드 배열 초기화
    var parent = [Int]()

    for i in 0..<v+1 {
        parent.append(i)
    }

    // find 연산
    func findParent(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = findParent(parent[x])
        return parent[x]
    }

    // union 연산
    func union(_ u: Int,_ v: Int) -> Bool {
        let u = findParent(u)
        let v = findParent(v)

        if u == v { return false } // 부모가 같으면 같은 집합안에 있으므로 union X

        if u < v { parent[v] = u }
        else { parent[u] = v }
        return true
    }

    func kruskcal() -> Int {
        // 가중치 합, 간선 개수
        // 간선의 개수가 정점-1 일때 연산 끝
        var (answer, count) = (0, 0)
        for (a,b,c) in connect {
            if union(a, b) {
                count += 1
                answer += c
                if count == v-1 {
                    return answer
                }
            }
        }

        return answer
    }

    print(kruskcal())