import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var distance = [[Int]](repeating: [Int](repeating: 999999, count: N+1), count: N+1)
    
    for i in 1...N {
        distance[i][i] = 0
    }
    
    for i in road {
        distance[i[0]][i[1]] = min(i[2], distance[i[0]][i[1]])
        distance[i[1]][i[0]] = min(i[2], distance[i[1]][i[0]])
    }
    
    for k in 1...N {
        for i in 1...N {
            for j in 1...N {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j] )
            }
        }
    }
    
    return distance[1].filter{ $0 <= k }.count
}