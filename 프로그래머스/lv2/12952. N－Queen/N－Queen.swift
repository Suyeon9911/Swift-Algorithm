import Foundation

func solution(_ n:Int) -> Int {
    
    var chess = Array(repeating: -1, count: n)
    var answer = 0 
    
    func checkArrangeQueen(row: Int) -> Bool {
        
        for i in 0..<row {
            if chess[i] == chess[row] || abs(chess[row] - chess[i]) == abs(row - i) {
                // 같은 열일 경우. 
                return false
            }
        }
        
        return true
    }
    
    // 행을 기준으로 DFS. 1행 -> 2행 -> 3행 ...
    
    func dfs(row: Int) {
        
        // 만약에 끝까지 다 배치했을 경우. +1
        if row == n {
            answer += 1
            return
        }
        
        // 하나의 행에서 모든 열의 유망성을 검사한다. 
        for i in 0..<n {
            chess[row] = i // 그 자리에 배치. 
            
            if checkArrangeQueen(row: row) {
                // 배치할 수 있다면, 
                dfs(row: row + 1) // 다음 행 DFS
                // chess[row] = -1
            }
        }
    }
    
    dfs(row: 0)
    
    return answer
}