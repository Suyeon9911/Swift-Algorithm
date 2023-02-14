import Foundation

func solution(_ s:String) -> [Int] {
    
    var saveArr: [String] = []
    var result: [Int] = []
    
    for i in s {
        if saveArr.contains(String(i)) {
            result.append(Int(saveArr.reversed().firstIndex(of: String(i))!)+1)
            saveArr.append(String(i))
        } else {
            result.append(-1)
            saveArr.append(String(i))
        }
    }
    
    return result
}