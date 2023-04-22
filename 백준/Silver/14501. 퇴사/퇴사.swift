    let n = Int(readLine()!)!

    var t: [Int] = []
    var p: [Int] = []

    var dp = Array(repeating: 0, count: n+1)
    var maxValue = 0

    for _ in 0..<n {
        let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
        let x = xy[0]
        let y = xy[1]

        t.append(x)
        p.append(y)
    }

    // list를 뒤에서부터 거꾸로 확인하기
    for i in stride(from: n-1, to: -1, by: -1) {
        let time = t[i] + i

        // 상담이 n일 안에 끝나는 경우
        if time <= n {
            // 현재까지의 최고 이익 계산
            dp[i] = max(p[i] + dp[time], maxValue)
            maxValue = dp[i]
        } else {

            // 상담이 기간을 벗어나면 지금까지의 최고 이익 저장. 
            dp[i] = maxValue
        }
    }

    print(maxValue)