import Foundation

// 이동할 수 있는 위치 반환하기
func getMovePos(_ pos: [Int],_ board: [[Int]]) -> Set<[Int]> {
    var nextPos = Set<[Int]>()
    
    let px1 = pos[0]
    let py1 = pos[1]
    let px2 = pos[2]
    let py2 = pos[3]

    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    for i in 0...3 {
        let nx1 = px1 + dx[i]
        let ny1 = py1 + dy[i]
        let nx2 = px2 + dx[i]
        let ny2 = py2 + dy[i]
        
        // 이동하려는 두 칸 모두 비어있어야 함.
        if board[nx1][ny1] == 0 && board[nx2][ny2] == 0 {
            nextPos.insert([nx1,ny1,nx2,ny2])
        }
    }
    
    // 현재 로봇이 가로로 있는 경우 
    if px1 == px2 {
        for i in [-1, 1] {
            // 위쪽으로 회전하거나 아래쪽으로 회전. 위쪽 / 아래 둘다 두칸 다 비어있어야함
            if board[px1+i][py1] == 0 && board[px2+i][py2] == 0 {
                nextPos.insert([px1,py1,px1+i,py1])
                nextPos.insert([px2,py2,px2+i,py2])
            }
            
        }
    } else if py1 == py2 {
        // 세로로 있는 경우 
        for i in [-1, 1] {
            // 왼쪽 혹은 오른쪽 회전 - 두칸 모두 비어있어야함
            if board[px1][py1+i] == 0 && board[px2][py2+i] == 0 {
                nextPos.insert([px1,py1,px1,py1+i])
                nextPos.insert([px2,py2,px2,py2+i])
            }
        }
    }
    
    return nextPos
} 

func solution(_ board:[[Int]]) -> Int {
    
    // 1. map 외곽에 벽을 두기
    
    var newBoard = Array(repeating: Array(repeating: 1, count: board.count+2), count: board.count+2)
    
    for i in 0..<board.count {
        for j in 0..<board.count {
            newBoard[i+1][j+1] = board[i][j]
        }
    }
    
    // 2. BFS 수행하기 
    var queue = [([Int],Int)]()
    var visited = Set<[Int]>()
    var index = 0
    
    // 2-1. 시작 위치. (1,1) (1,2)
    
    queue.append(([1,1,1,2],0))
    
    visited.insert([1,1,1,2])
    
    // 아 이게 맞나 ..? ㅋㅋ..
    
    while index < queue.count {
        var pos = queue[index].0 //[1,1,1,2]
        var cost = queue[index].1
        index += 1
        
        var last = board.count
        
        // 2-2. 끝 위치에 도달했다면, 최단거리 이므로 반환
        if (pos[0] == last && pos[1] == last) 
        || (pos[2] == last && pos[3] == last) {
            return cost
        }
        
        // 현재 위치에서 이동할 수 있는 위치 확인하기 
        for next in getMovePos(pos, newBoard) {
            // [1,1,1,2] 형태로 반복 돌아감.
            
            // 아직 방문하지 않았다면 큐에 삽입하고 방문 처리
            
            if !visited.contains(next) {
                queue.append((next, cost+1))
                visited.insert(next)
            }
        }
    }
    
    return 0
}