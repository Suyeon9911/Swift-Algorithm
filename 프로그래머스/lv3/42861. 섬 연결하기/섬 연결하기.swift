import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    // MST
    
    // 0. 부모 배열 초기화
    var parent = [Int](0..<n)
    
    // 1. Find 연산
    func find(x: Int) -> Int {
        if parent[x] == x { return x }
        
        parent[x] = find(x: parent[x])
        return parent[x]
    }
    
    // 2. Union 연산
    
    func union(a: Int, b: Int) {
        let u = find(x: a)
        let v = find(x: b)
        
        if u < v {
            parent[v] = u
        } else {
            parent[u] = v
        }
    }
    
    let sortedCosts = costs.sorted(by: { $0[2] < $1[2] })
    
    var result = 0
    var edges = 0 
    
    for i in sortedCosts {
        if edges == costs.count {
            break
        }
        
        if find(x: i[0]) != find(x: i[1]) {
            result += i[2]
            edges += 1
            union(a: i[0],b: i[1])
        }
    }
    
    return result
}