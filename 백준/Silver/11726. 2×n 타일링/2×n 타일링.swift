    let n = Int(readLine()!)!

    var dp = Array(repeating: 0, count: 1001)

    dp[1] = 1
    dp[2] = 2

    if n < 3 {
        print(dp[n])
    } else {
        for i in 3...n {
            dp[i] = (dp[i-1] + dp[i-2]) % 10007
        }
        print(dp[n])
    }
