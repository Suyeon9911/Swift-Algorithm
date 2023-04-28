import Foundation

func isManhattanDistance(_ places:[[String]]) -> Bool {
    // (1, 0), (2, 0), (0, 1), (0, 2), (1, 1), (-1, 1)
    
    let dx = [ 1, 2, 0, 0, 1, -1]
    let dy = [0, 0, 1, 2, 1, 1]
    
    for row in 0..<5 {      // 행 5개
        for col in 0..<5 {  // 열 5개
            if places[row][col] == "P" {    // 응시자인 경우
                for i in 0..<6 {
                    let (nx, ny) = (row+dx[i], col+dy[i])
                    
                    // 맨해튼 거리가 2이하인 곳에 다른 응시자(P)가 있을 때
                    if (0..<5).contains(nx) && (0..<5).contains(ny) && places[nx][ny] == "P" {
                        
                        if row == nx {          // 같은 행에 다른 응시자가 있을 때
                            if ny - col == 1 {  // 바로 옆에 있을 때
                                return false
                            } else {            // 한 칸 떨어져 있을 때
                                if places[row][col+1] != "X" {
                                    return false
                                }
                            }
                        } else if col == ny {   // 같은 열에 다른 응시자가 있을 때
                            if nx - row == 1 {  // 바로 옆에 있을 때
                                return false
                            } else {            // 한 칸 떨어져 있을 때
                                if places[row+1][col] != "X" {
                                    return false
                                }
                            }
                        } else {    // 대각선에 다른 응시자가 있을 때
                            if row > nx {
                                if places[row-1][col] != "X" || places[row][col+1] != "X"{
                                    return false
                                }
                            } else {
                                if places[row+1][col] != "X" || places[row][col+1] != "X"{
                                    return false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    
    // places를 [[[String]]] 형태로 만들기
    // ex) [[["P", "O", "O", "O", "P"], ["O", "X", "X", "O", "X"], ...]]
    let places = places.map {$0.map{$0.map{String($0)}}}
    var res:[Int] = []
    
    for place in places {
        // 대기실 별로 거리두기 확인하기
        res.append(isManhattanDistance(place) ? 1:0)
    }
    
    return res
}

// func solution(_ places:[[String]]) -> [Int] {
    
//     // 1. 각 대기실 별로 거리두기를 지키고 있는가 ? 1 : 0
    
//     var answer = [Int]()
//     for place in places {
        
//         // 1-1. place를 5*5 배열로 만든다. - room
//         var room = [[String]]() 
//         for i in place {
//             var line = Array(i).map { String($0) }
//             room.append(line)
//         } 
        
//         // room 돌면서 P일 경우 방문 처리 -> 상하좌우 확인 ! -> 있으면 바로 벤. 
//         // 만약에 대각선에 있으면 ? -> 나머지에 파티션이 있는지 확인. 
//         // 만약에 한칸띄고 있으면 ? -> 그 사이에 파티션이 있는지 확인.
        
//         var visited = [(Int,Int)]()
        
//         func check() {
//             for i in 0..<5 {
//                 for j in 0..<5 {
//                     if room[i][j] == "P" {
                    
//                         let right = (i, j+1)
//                         let twoRight = (i, j+2)
//                         let down = (i+1, j)
//                         let twoDown = (i+2, j)
//                         let leftDown = (i-1,j+1)
//                         let rightDown = (i+1,j+1)
                        
//                         if j < 4 {
//                             if room[i][j+1] == "P" {
//                                 answer.append(0)
//                                 return
//                             }
//                         } else if i < 4 {
//                             if room[i+1][j] == "P" {
//                                 answer.append(0)
//                                 return
//                             }
//                         }
                        
                        
//                         if 
                        
                        
//                     }
//                 }
//             }
//         }
        
//         check()
//     }
    
    
//     return answer
// }



// func another() {
    
        // 1-2. 각 room의 응시자의 좌표를 파악한다. 
        
        // 1-3. 맨해튼 거리를 구한다. -> func getDist
        // 근데 굳이 모든 좌표 간의 맨해튼을 구할 필요는 없는디.. 
        
        // 2. 맨해튼 거리가 2 이하인 경우는 어떤 경우인가 -> func checkPartition
        
        // func checkPartition(one: (Int, Int))
        
        // 2-1. 서로 양옆으로 붙어있거나, 위아래로 붙어있으면 무조건 x 
        // 2-2. 서로 대각선에 있으면 그 나머지 대각선에는 무조건 파티션이 있어야함.
        // 2-3. 서로 옆, 위아래가 같은 위치지만 그 사이에 파티션이 있다면 ㅇㅋ
        
        // 3. 만약에 check했을 때 true면 거리두기 지킴, false면 거리두기 안지킴
        
// }