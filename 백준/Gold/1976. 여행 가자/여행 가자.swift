    let n = Int(readLine()!)!
    let m = Int(readLine()!)!

    var visited: [Bool] = Array(repeating: false, count: n)

    var cities: [[Int]] = []

    for i in 0..<n {
        let connects = readLine()!.split(separator: " ").map { Int(String($0))! }
        cities.append([])
        for j in 0..<connects.count {
            if connects[j] == 1 {
                cities[i].append(j)
            }
        }
    }

    func dfs(start: Int) {
        visited[start] = true

        for i in cities[start] {
            if !visited[i] {
                dfs(start: i)
            }
        }
    }

    let plan = readLine()!.split(separator: " ").map { Int(String($0))!-1 }

    dfs(start: plan[0])

    var check = true

    for i in 1..<m {
        // 아 플랜에 있는 모든 여행지가 방문처리 되어 있어야함.
        if !visited[plan[i]] {
            check = false
            break
        } else {
            continue
        }
    }

    check ? print("YES") : print("NO")