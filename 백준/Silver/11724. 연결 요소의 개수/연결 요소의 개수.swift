import Foundation

let nm = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let (n, m) = (nm[0], nm[1])

    var parent = [Int](0...n)

    func findParent(x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = findParent(x: parent[x])
        return parent[x]
    }

    // union 연산

    func union(a: Int, b: Int) {
        let ra = findParent(x: a)
        let rb = findParent(x: b)


        if ra < rb {
            parent[rb] = ra
        } else {
            parent[ra] = rb
        }
    }

    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        union(a: ab[0], b: ab[1])
    }

    var counter = Set<Int>()

    for i in 1...n {
        counter.insert(findParent(x: i))
    }

    print(counter.count)