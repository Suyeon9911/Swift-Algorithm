import Foundation

func solution(_ board:[String]) -> Int {
    
    let newBoard = board.map { $0.map { String($0)}}
    let n = newBoard.count
    let m = newBoard[0].count

    // var robot 
    var dist = [[Int]](repeating: [Int](repeating: 0, count: newBoard[0].count), count: newBoard.count)
    
    // robot 위치 찾기 
    var queue = [(Int,Int)]()
    for i in 0..<n {
        for j in 0..<m {
            if newBoard[i][j] == "R" {
                queue.append((i,j))
                dist[i][j] = 1
                break
            }
        }
    }
    
    let dx = [-1,1,0,0]
    let dy = [0,0,1,-1]
    var index = 0
    
    while index < queue.count {
        
        let now = queue[index]
        index += 1
        
        if newBoard[now.0][now.1] == "G" {
            // G를 만나면 중단
            return dist[now.0][now.1]-1
        }
        
        for i in 0...3 {
        
            var nx = now.0
            var ny = now.1
            
            // 기본 BFS와 달리 한번 더 while 문을 돌려서 선택한 방향으로 쭉 
            while true {
                nx += dx[i]
                ny += dy[i]
                
                // 범위를 벗어난다면 중단
                if nx < 0 || ny < 0 || nx >= n || ny >= m {
                    nx -= dx[i]
                    ny -= dy[i]
                    break
                }
                
                if (0..<n) ~= nx && (0..<m) ~= ny && newBoard[nx][ny] == "D" {
                    // 장애물
                    nx -= dx[i]
                    ny -= dy[i]
                    break
                }
            }
            
            // 미끄러져서 갈 수 있는 곳까지 도착 !
            if dist[nx][ny] == 0 {
                // 한번도 도달한적 없었던 곳이라면 
                dist[nx][ny] = dist[now.0][now.1] + 1
                queue.append((nx,ny))
            }
        }
    }
    
    return -1
}