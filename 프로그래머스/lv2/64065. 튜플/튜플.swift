import Foundation

func solution(_ s:String) -> [Int] {
    
    // 1. string으로 주어진 부분을 분해하기
    
    var s = s.replacingOccurrences(of: "{", with: "")
    s = s.trimmingCharacters(in: ["}"])
    
    var stringArr = s.components(separatedBy: "},").map { $0.components(separatedBy: ",").map { Int($0)! } }
    
    // 2. 배열의 길이를 기준으로 정렬하기 -> 그래야 a1부터 순서대로 파악 가능
    
    stringArr = stringArr.sorted { $0.count < $1.count }
    // print(stringArr)
    
    var checkSet: Set<Int> = []
    var result: [Int] = []
    
    // 좀 더 효율적으로 넣고 싶은디 ㅜ
    for index in stringArr.indices {
        if index == 0 {
            result.append(stringArr[index][0])
            checkSet.insert(stringArr[index][0])
        }
        
        for i in stringArr[index] {
            if !checkSet.contains(i) {
                result.append(i)
                checkSet.insert(i)
            }
        }
    }
    
    return result
}