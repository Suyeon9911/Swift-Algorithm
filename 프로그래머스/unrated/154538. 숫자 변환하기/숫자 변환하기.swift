import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    
    // 1. dfs -> depth 늘려가면서 + x가 y보다 커지면 -1
    // 2. bfs 
    var dist = Array(repeating: 0, count: 1000001)
    
    func bfs(x: Int, y: Int, n: Int) {
        var queue: [Int] = []
        var index = 0
        
        dist[x] = 1 // 거리 + 방문 처리
        queue.append(x)
        
        while queue.count > index {
            let now = queue[index]
            index += 1
            
            if (0...1000000) ~= now+n && dist[now+n] == 0 {
                dist[now+n] = dist[now] + 1
                queue.append(now+n)
            }
            
            if (0...1000000) ~= now*2 && dist[now*2] == 0 {
                dist[now*2] = dist[now] + 1
                queue.append(now*2)
            }
            
            if (0...1000000) ~= now*3 && dist[now*3] == 0 {
                dist[now*3] = dist[now] + 1
                queue.append(now*3)
            }
        }
    }
    
    if x == y {
        return 0
    } else {
        bfs(x: x, y: y, n: n)
        return dist[y]-1
    }
}