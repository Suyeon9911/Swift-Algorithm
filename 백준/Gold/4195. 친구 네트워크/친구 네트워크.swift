    let testCase = Int(readLine()!)!

    for _ in 1...testCase {
        // 주어지는 값이 문자열 형태라서 딕셔너리로 만드는게 효과적임
        var parent = [String: String]()
        var number = [String: Int]()

        var f = Int(readLine()!)!

        for _ in 1...f {
            var xy = readLine()!.split(separator: " ").map { String($0) }
            var x = xy[0]
            var y = xy[1]

            if parent[x] == nil {
                parent[x] = x
                number[x] = 1
            }

            if parent[y] == nil {
                parent[y] = y
                number[y] = 1
            }

            union(a: x, b: y)
            print(number[findparent(x: x)]!)
        }

        func findparent(x: String) -> String {
            if parent[x] == x { return x }
            parent[x] = findparent(x: parent[x]!)
            return parent[x]!
        }

        func union(a: String, b: String) {
            let ra = findparent(x: a)
            let rb = findparent(x: b)

            if ra != rb {
                parent[rb] = ra
                number[ra]! += number[rb]!
            }
        }
    }