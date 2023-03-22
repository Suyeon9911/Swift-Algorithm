
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!

    var cities = [Int](0..<n)

    func findParent(n: Int) -> Int {
        if cities[n] == n {
            return n
        }

        cities[n] = findParent(n: cities[n])
        return cities[n]
    }

    func union(a: Int, b: Int) {
        let rootA = findParent(n: a)
        let rootB = findParent(n: b)

        if rootA < rootB {
            cities[rootB] = rootA
        } else {
            cities[rootA] = rootB
        }
    }

    for i in 0..<n {
        let connects = readLine()!.split(separator: " ").map { Int(String($0))! }
        for j in i+1..<n {
            if connects[j] == 1 {
                union(a: i, b: j)
            } else {
                continue
            }
        }
    }

    let plan = readLine()!.split(separator: " ").map { Int(String($0))!-1 }
    let firstPlan = findParent(n: plan[0])
    var check = true

    for i in 1..<m {
        if findParent(n: plan[i]) != firstPlan {
            check = false
            break
        } else {
            continue
        }
    }

    check ? print("YES") : print("NO")