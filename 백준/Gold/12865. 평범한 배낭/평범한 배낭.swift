
    let first = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, k) = (first[0], first[1])

    var dp = Array(repeating: 0, count: k+1)

    var list: [(Int,Int)] = []

    for _ in 1...n {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }

        list.append((line[0],line[1]))
    }

    for i in 0..<n {
        for j in stride(from: k, to: 0, by: -1) {
            if j >= list[i].0 {
                dp[j] = max(dp[j], dp[j-list[i].0] + list[i].1)
            }
        }
    }

    print(dp[k])