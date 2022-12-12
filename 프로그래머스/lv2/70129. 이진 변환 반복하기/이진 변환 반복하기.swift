import Foundation

func solution(_ s:String) -> [Int] {
    
    // 1. 0 제거하기 
    // 2. 문자 길이 구하기 
    // 3. 이진법으로 바꾸기 
    // 4. 이진변환 횟수, 제거된 0의 개수
    
    // 이 과정을 0이 없을 떄까지 수행
    
    
    var changedString = s
    var deletedZeroCount = 0
    
    func deleteZero(string: String) -> String {
        
        var newString = ""
        for i in string {
            if i == "1" {
                newString.append(i)
            } else {
                deletedZeroCount += 1
            }
        }
        
        return newString
    }
    
    var changeCount = 0
    
    while changedString != "1" {
        changedString = deleteZero(string: changedString)
        
        let stringLength = changedString.count
        
        changedString = String(stringLength, radix: 2)
        changeCount += 1
    }
    
    
    
    return [changeCount, deletedZeroCount]
}