import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    var board = board
    var max: Int = 0

    // 예외 처리 : 주어진 행이나 열이 1개 일 경우 정사각형 크기는 오직 1
    // 예외 처리 2 : 아예 1이 없을 경우 0

    if board.count == 1 || board[0].count == 1 {
        if board.flatMap({$0}).max()! == 1 { return 1 }
        else { return 0 }
    }

    // 좌표를 1,1로 시작해서 board.count 까지 할수도 있고, 0,0으로 시작해서 board.count-1로 할수도 있다.
    // 후자의 경우에는 좌상단이 아니라, 좌하단의 최솟값을 1,1 에 더해줘야함.

//    for i in 1..<board.count {
//      for j in 1..<board[0].count {
//        if board[i][j] == 1 {
//          board[i][j] = min(board[i-1][j-1], board[i-1][j], board[i][j-1]) + 1
//          max = max < board[i][j] ? board[i][j] : max
//        }
//      }
//    }

   for i in 0..<board.count-1 {
       for j in 0..<board[0].count-1 {
           if board[i][j] >= 1 && board[i+1][j+1] == 1 {
               board[i+1][j+1] += min(board[i][j], board[i+1][j], board[i][j+1])
               if board[i+1][j+1] > max { max = board[i+1][j+1] }
           }
       }
   }

    return max * max
}