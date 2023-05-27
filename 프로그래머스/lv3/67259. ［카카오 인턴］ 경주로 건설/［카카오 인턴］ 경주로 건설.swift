import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    let n = board.count
    let dir = [[-1,0,1,0],[0,1,0,-1]] // 좌, 하, 우, 상
    
    // 좌표가지 경주로를 건설할 때 사용되는 최소 Cost 저장하는 배열
    var cost = [[Int]](repeating: [Int](repeating: Int.max, count : n), count: n)
    
    func checkMapRange(_ r: Int, _ c: Int) -> Bool {
        if r < 0 || r >= n || c < 0 || c >= n {
            return false
        }
        return true
    }
    
    // dir: 방향 인덱스
    func dfs(_ cur: (r: Int, c: Int, cost: Int, dir: Int)) {
        // 이동한 곳이 벽이거나 배열에 저장된 최솟값보다 큰 경우 return
        if board[cur.r][cur.c] == 1 || cur.cost > cost[cur.r][cur.c] {
            return
        }
        
        // 최솟값 갱신 
        cost[cur.r][cur.c] = cur.cost
        
        // 상하좌우 탐색
        for idx in 0..<4 {
            let nr = cur.r + dir[0][idx]
            let nc = cur.c + dir[1][idx]
            
            if checkMapRange(nr, nc) {
                // 이전 방향과 같을 경우 cost + 100
                if cur.dir == idx {
                    dfs((r: nr, c: nc, cost: cur.cost + 100, dir: idx))
                } else {
                    // 방향을 꺾으면 코너 + 직선도로 cost + 600
                    dfs((r: nr, c: nc, cost: cur.cost + 600, dir: idx))
                }
            }
        }
    }
    
    // 출발점 cost 0 
    cost[0][0] = 0
    
    // 출발점의 방향은 우방향, 하방향 두가지 
    dfs((r: 0, c: 1, cost: 100, dir: 1))
    dfs((r: 1, c: 0, cost: 100, dir: 2))
    
    // 도착점 최솟값 리턴
    return cost[n-1][n-1]
}