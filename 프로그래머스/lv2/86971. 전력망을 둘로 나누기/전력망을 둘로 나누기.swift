import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    // 전력망을 끊으려면 인접리스트로 제거해주는것보다 2차원배열에서 0으로 바꾸는게 더 빠르겠지?
    // 탐색하기가 너무 불편해소 인접리스트로 만들래여
    
    var wireMatrix: [Int: [Int]] = [:]
    
    for i in wires {
        wireMatrix[i[0], default: []] += [i[1]]
        wireMatrix[i[1], default: []] += [i[0]]
    }
    
    // print(wireMatrix)
    
    var count = 0
    var visited: Set<Int> = []
    
    func dfs(start: Int) {
        visited.insert(start)
        count += 1
        
        for i in wireMatrix[start]! {
            if !visited.contains(i) {
                visited.insert(i)
                dfs(start: i)
            }
        }
    }
    
    var countArr: [Int] = []
    var result = n
    
    for i in wires {
        wireMatrix[i[0]]!.removeAll(where: { $0 == i[1] })
        wireMatrix[i[1]]!.removeAll(where: { $0 == i[0] })

        visited.removeAll()
        
        for key in wireMatrix.keys {
            if !visited.contains(key) {
                count = 0
                dfs(start: key)
                countArr.append(count)
            }
        }
        
        let absValue = abs(countArr[0]-countArr[1])
        if result > absValue {
            result = absValue
        }
        
        countArr.removeAll()
        
        // 복구
        wireMatrix[i[0], default: []] += [i[1]]
        wireMatrix[i[1], default: []] += [i[0]]
    }
    
    return result
}