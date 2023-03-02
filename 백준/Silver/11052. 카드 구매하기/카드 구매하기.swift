    let n = Int(readLine()!)!
    var pack = readLine()!.split(separator: " ").map { Int(String($0))! }

    pack.insert(0, at: 0)

    var dp = Array(repeating: 0, count: n+1)

    for i in 1...n {
        for j in 1...i {
            dp[i] = max(dp[i], dp[i-j] + pack[j])
        }
    }

    print(dp[n])