import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var clothDic: [String: Int] = [:]
    
    for cloth in clothes {
        let key = cloth[1] // 종류를 key 로 저장할 예정
        
        // key에 맞게 의상 + 1 해주기 ( 만약에 nil 이면 0으로 초기화해주기.)
        clothDic[key] = (clothDic[key] ?? 0) + 1
    }

    // 서로 다른 옷의 조합의 개수 구하기
    var count = 1
    
    for num in clothDic.values {
        count *= (num + 1)
    }
    
    // 아예 안입는 경우 제외하기 
    return count-1
}