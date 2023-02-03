import Foundation

// 코스요리 -> 가장 많이 함께 주문한 단품메뉴들로 구성
// 최소 2명 이상의 손님으로부터 주문된 메뉴만 후보


func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    // 1. 주문 목록 정렬
    // 2. 각 주문 당 갯수에 맞게 조합 구하기 -> 개수 세기 
    
    let orders = orders.sorted()
    var menuCombination: [[String]: Int] = [:]
    var result: [String] = []
    
    func combination(_ targetArray: [String],_ rCount: Int,_ index: Int,_ nowArray: [String]) {
        if nowArray.count == rCount {
            menuCombination[nowArray.sorted(), default: 0] += 1
            return // 조합 만들때마다 return 
        }
    
        for i in index..<targetArray.count {
            // 순서가 상관없기 때문에 앞의 인덱스를 확인할 필요가 없음. 0부터 1씩 더해서 재귀
            combination(targetArray, rCount, i+1, nowArray+[targetArray[i]])
        }
    } 
    
    for i in course {
        // 2,3,4 개로 조합만들기 
        for order in orders {
            // 하나의 주문에 대해서 조합 만들기
            let orderArray = Array(order).map { String($0) }
            combination(orderArray,i,0,[])
        }
        // i 개의 조합 중 최대 값.
        let max = menuCombination.values.max()
        
        for (key,value) in menuCombination {
            if value == max && value >= 2 {
                result.append(String(key.joined().sorted()))
            }
        }

        menuCombination = [:]
    }
    
    return result.sorted()
}