import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    // var network: [[Int]] = Array(repeating: [], count: n)
    // var visited: [Bool] = Array(repeating: false, count: n)
    
     var visitedSet: Set<Int> = []
    
    // for i in 0..<computers.count {
    //     for j in 0..<computers.count {
    //         if computers[i][j] == 1 {
    //             network[i].append(j)
    //         }
    //     }
    // }
    
    //print(network)
    
    func dfs(start: Int) {
        // 1. 방문처리 
        visitedSet.insert(start)

        for i in computers[start].indices {
            if !visitedSet.contains(i) && computers[start][i] == 1 {
                dfs(start: i)
            }
        }
    }
    
    var count = 0 
    
    for i in computers.indices {
        if !visitedSet.contains(i) {
            dfs(start: i)
            count += 1
        }
    }
    
    return count
}