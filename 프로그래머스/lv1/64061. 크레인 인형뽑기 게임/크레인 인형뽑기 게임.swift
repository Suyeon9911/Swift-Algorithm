import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {

    // 1. 바구니 역할을 하는 Stack
    var baguni: [Int] = []
    var newboard = board
    var count = 0

    // 2. 2차원 배열을 각 위치 별로 세로 스택으로 바꾸기
    for i in 0..<board.count {
        for j in 0..<board.count {
            newboard[i][j] = board[j][i]
        }
    }
    // 크레인을 움직이면서
    for i in moves {
        // i 가 1이면 newboard의 0번째에 접근해서 가장 위의 것을 빼옴
        // 인형이 없는 곳에서 크레인작동시..
        if newboard[i-1].reduce(0, +) == 0 {
            continue
        }

        for j in 0..<newboard[i-1].count {
            
            if newboard[i-1][j] != 0 {
                if baguni.last == newboard[i-1][j] {
                    baguni.removeLast()
                    count += 2
                } else {
                    baguni.append(newboard[i-1][j])
                }
                
                newboard[i-1][j] = 0
                break
            }
        }

        // 바구니에서 똑같은거 두개 있으면 터짐 !

    }


    return count
}