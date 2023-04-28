import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    // 0. map 만들기 
    var map = Array(repeating: Array(repeating: 0, count: columns+1), count: rows+1)
    
    for i in 1...rows {
        for j in 1...columns {
            map[i][j] = ((i-1) * columns) + j
        }
    }
    
    // 1. 전체 쿼리 순서대로 실행
    
    var answer = [Int]()
    for query in queries {
        // 1-1. x1, y1, x2, y2 구하기
        let (x1,y1,x2,y2) = (query[0],query[1],query[2],query[3])
        var rotate = [Int]()
        
        // 1-2. 테두리 돌기
        for i in y1...y2 {
            rotate.append(map[x1][i])
        }
        
        for i in x1+1...x2 {
            rotate.append(map[i][y2])
        }
        
        for i in stride(from: y2-1, to: y1-1, by: -1) {
            rotate.append(map[x2][i])
        }
        
        for i in stride(from: x2-1, to: x1, by: -1) {
            rotate.append(map[i][y1])
        }
        
        // 1-3. 배열을 시계방향으로 회전
        
        rotate = [rotate.removeLast()] + rotate
        
        // 1-4. 가장 작은 값을 값에 저장.
        
        answer.append(rotate.min()!)
        
        // 1-5. 배열 원래대로 돌리기
        var index = 0
        
        for i in y1...y2 {
            map[x1][i] = rotate[index]
            index += 1
        }
        
        for i in x1+1...x2 {
            map[i][y2] = rotate[index]
            index += 1
        }
        
        for i in stride(from: y2-1, to: y1-1, by: -1) {
            map[x2][i] = rotate[index]
            index += 1
        }
        
        for i in stride(from: x2-1, to: x1, by: -1) {
            map[i][y1] = rotate[index]
            index += 1
        }
    }
    
    return answer
}
