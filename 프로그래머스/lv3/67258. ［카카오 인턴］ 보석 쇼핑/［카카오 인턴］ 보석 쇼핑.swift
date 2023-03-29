import Foundation

func solution(_ gems:[String]) -> [Int] {
    let gemSet = Set(gems)
    var gemDict = [String: Int]()
    var left = 0
    var right = 0
    var minLength = gems.count
    var result: [Int] = [left+1, gems.count]
    
    while true {
        if gemDict.count == gemSet.count {
            // 현재 구간이 모든 보석을 포함하는 경우
            if right - left < minLength {
                minLength = right - left
                result = [left+1, right]
            }
            
            if let count = gemDict[gems[left]] {
                if count == 1 {
                    gemDict.removeValue(forKey: gems[left])
                } else {
                    gemDict[gems[left]] = count - 1
                }
            }
            left += 1
        } else if right == gems.count {
            break
        } else {
            // 현재 구간이 모든 보석을 포함하지 않는 경우
            
            if let count = gemDict[gems[right]] {
                gemDict[gems[right]] = count + 1
            } else {
                gemDict[gems[right]] = 1
            }
            right += 1
        }
    }
    
    return result
}