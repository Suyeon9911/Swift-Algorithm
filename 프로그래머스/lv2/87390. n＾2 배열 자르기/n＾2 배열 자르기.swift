import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {

    // 시간초과 해결하기 -> 필요한 부분만 구해보자.
    // index / n 의 몫은 행 index % n 나머지는 열

    let leftRowIdx = Int(left)/Int(n)
    let leftColIdx = Int(left)%Int(n)
    let rightRowIdx = Int(right)/Int(n)
    let rightColIdx = Int(right)%Int(n)

    let lastIndex = n*(rightRowIdx-leftRowIdx) + rightColIdx
    // print(lastIndex)

    var array: [Int] = []
    
    if leftRowIdx == rightRowIdx {
        array += Array(repeating: leftRowIdx+1, count: leftRowIdx+1)
        
        if leftRowIdx+2 <= n {
            for j in leftRowIdx+2...n {
                array.append(j)
            }
        }
        
        return Array(array[leftColIdx...lastIndex])
    }
    
    let count = (rightRowIdx-leftRowIdx)*n + rightColIdx + 1

    for i in leftRowIdx...rightRowIdx {
        // ex 1번째 행에서 3번째 행까지 만든다 쳤을때
        
        array += Array(repeating: i+1, count: i+1)

        if i+2 <= n {
            for j in i+2...n {
                array.append(j)
                
                if array.count >= count {
                    // print(array)
                    break
                }
            }
        }
    }

    return Array(array[leftColIdx...lastIndex])
}