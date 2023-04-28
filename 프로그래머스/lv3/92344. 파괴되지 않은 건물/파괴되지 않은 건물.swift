import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let n = board.count
    let m = board[0].count
    var count = 0
    var preArr = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    for i in skill{
        let type = i[0]
        let degree = type == 1 ? -i[5] : i[5]
        let r1 = i[1]
        let c1 = i[2]
        let r2 = i[3]
        let c2 = i[4]
        
        preArr[r1][c1] += degree
        preArr[r1][c2 + 1] -= degree
        preArr[r2 + 1][c1] -= degree
        preArr[r2 + 1][c2 + 1] += degree
    }
    //왼쪽에서 오른쪽 누적합
    for i in 0..<preArr.count{
        for j in 0..<preArr[i].count{
            if j + 1 < preArr[i].count{
                preArr[i][j + 1] += preArr[i][j]
            }
            
        }
    }
    //위쪽에서 아래쪽 누적합
    for i in 0..<preArr.count{
        for j in 0..<preArr[i].count{
            if j + 1 < preArr.count{
                preArr[j + 1][i] += preArr[j][i]
            }
            
        }
    }
    
    //합치기
    for i in 0..<n{
        for j in 0..<m{
            preArr[i][j] += board[i][j]
            if preArr[i][j] > 0 {
                count += 1
            }
        }
    }
    
    return count
}