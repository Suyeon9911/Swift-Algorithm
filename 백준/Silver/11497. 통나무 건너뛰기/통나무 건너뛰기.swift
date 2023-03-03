
    let testcase = Int(readLine()!)!

    for _ in 1...testcase {
        let n = Int(readLine()!)!
        var array = readLine()!.split(separator: " ").map { Int(String($0))! }
        array.sort() // 오름차순 정렬

        var result = 0

        for j in 2..<n {
            let c = array[j] - array[j-2]
            result = max(c, result)
        }
        
        print(result)
    }