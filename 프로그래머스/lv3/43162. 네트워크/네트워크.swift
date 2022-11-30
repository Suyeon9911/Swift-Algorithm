import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    var network: [[Int]] = Array(repeating: [], count: n)
    var visited: [Bool] = Array(repeating: false, count: n)
    
    for i in 0..<computers.count {
        for j in 0..<computers.count {
            if computers[i][j] == 1 {
                network[i].append(j)
            }
        }
    }
    
    print(network)
    
    func dfs(start: Int) {
        visited[start] = true

        for i in network[start] {
            if !visited[i] {
                dfs(start: i)
            }
        }
    }
    
    var count = 0 
    
    for i in 0..<network.count {
        if !visited[i] {
            dfs(start: i)
            count += 1
        }
    }
    
    return count
}