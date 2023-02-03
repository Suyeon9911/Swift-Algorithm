import Foundation

func solution(_ maps:[String]) -> [Int] {
    
    var map: [[String]] = []
    
    for (i,v) in maps.enumerated() {
        map.append([])
        for j in v {
            map[i].append(String(j))
        }
    }
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    var dayCount: Int = 0
    
    func dfs(_ x: Int,_ y: Int) {
        dayCount += Int(map[x][y])!
        visited[x][y] = true
        
        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && nx < map.count && ny >= 0 && ny < map[0].count {
                if map[nx][ny] != "X" && !visited[nx][ny] {
                    dfs(nx, ny)
                }
            }
        }
    }
    
    var result: [Int] = []
    
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if !visited[i][j] && map[i][j] != "X" {
                dayCount = 0
                dfs(i,j)
                result.append(dayCount)
            }
        }
    }
    
    
    return result.isEmpty ? [-1] : result.sorted()
}