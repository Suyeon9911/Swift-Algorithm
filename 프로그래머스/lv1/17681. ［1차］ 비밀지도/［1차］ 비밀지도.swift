func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    
    var map1: [[Int]] = []
    var map2: [[Int]] = []

    var answer: [String] = Array(repeating: "", count: n)
    
    // 우선 십진수를 이진수로 바꾸자
    map1 = changeNumberToMap(n: n, array: arr1)
    map2 = changeNumberToMap(n: n, array: arr2)
    
    var totalMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<map1.count {
        for j in 0..<map1[i].count {
            if map1[i][j] == 1 {
                totalMap[i][j] = 1
            }
        }
    }
    
    for i in 0..<map2.count {
        for j in 0..<map2[i].count {
            if map2[i][j] == 1 {
                totalMap[i][j] = 1
            }
        }
    }
    
    for i in 0..<totalMap.count {
        for j in 0..<totalMap.count {
            if totalMap[i][j] == 1 {
                answer[i].append("#")
            } else {
                let lastString = answer[i]
                
                if lastString.suffix(1) == "#" {
                    answer[i].append(" ")
                }
            }
        }
    }

    
    return answer
}


func changeNumberToMap(n: Int, array: [Int]) -> [[Int]] {
    
    var array = array
    var map: [[Int]] = []
    
    for i in 0..<array.count {
        var dividedValue = 0
        var mapArray: [Int] = Array(repeating: 0, count: n)
        var mapIndex = 0 
        while dividedValue > 0 {
            dividedValue = array[i] / 2
            if array[i] % 2 != 0 {
                mapArray[mapIndex] = 1
            }
            mapIndex += 1
        }
        
        mapArray.reverse()
        map[i].append(contentsOf: mapArray)
    }
    
    return map
}