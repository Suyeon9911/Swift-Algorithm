import Foundation

func solution(_ board:[String]) -> Int {
    
    var newBoard = [[String]]()
    
    for i in board {
        let array = Array(i).map { String($0) }
        newBoard.append(array)
    }
    
    var Ocount = 0
    var Xcount = 0
    
    for i in newBoard {
        for j in i {
            if j == "O" {
                Ocount += 1
            } else if j == "X" {
                Xcount += 1
            }
        }
    }
    
    for i in newBoard {
        if i[0] == i[1] && i[1] == i[2] && i[0] != "." {
            if i[0] == "O" {
                if Ocount <= Xcount {
                    return 0
                }
            } else {
                if Ocount > Xcount {
                    return 0
                }
            }
        }
    }
    
    for i in 0...2 {
        if newBoard[0][i] == newBoard[1][i] && newBoard[1][i] == newBoard[2][i] && newBoard[0][i] != "." {
            if newBoard[0][i] == "O" {
                if Ocount <= Xcount {
                    return 0
                }
            } else {
                if Ocount > Xcount {
                    return 0
                }
            }
        }
    }
    
    // 열 확인 - 1,2,3
    // 행 확인 - 1,2,3
    // 대각선 확인 - 오른쪽 아래로, 왼쪽 아래로.
    
    if newBoard[0][0] == newBoard[1][1] && newBoard[1][1] == newBoard[2][2] && newBoard[0][0] != "." {
        if newBoard[0][0] == "O" {
            if Ocount <= Xcount {
                return 0
            }
        } else {
            if Ocount > Xcount {
                return 0
            }
        }
    }
    
    if newBoard[0][2] == newBoard[1][1] && newBoard[1][1] == newBoard[2][0] && newBoard[0][2] != "." {
        if newBoard[0][2] == "O" {
            if Ocount <= Xcount {
                return 0
            }
        } else {
            if Ocount > Xcount {
                return 0
            }
        }
    }
    
    // X와 O의 개수 차이가 2개 이상. 

    
    if Ocount < Xcount {
        return 0
    }
    
    if abs(Ocount-Xcount) >= 2 {
        return 0
    }
    
    // X 만 있으면 안됨. O 먼저니까 ... 
    
    if Ocount == 0 && Xcount > 0 {
        return 0
    }
    
    return 1
}