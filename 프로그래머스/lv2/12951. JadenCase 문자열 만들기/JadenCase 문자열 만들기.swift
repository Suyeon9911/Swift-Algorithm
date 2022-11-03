func solution(_ s:String) -> String {
    var array = s.components(separatedBy: " ").map { String($0) }
    
    for i in 0..<array.count {
        // 첫번째 문자를 Int로 형변환 - nil이 아닐 경우 첫번째가 숫자
        if let convertedNum = Int(array[i].prefix(1)) {
            array[i] = array[i].lowercased()
        } else {
            array[i] = array[i].capitalized
        }
    }
    
    return array.joined(separator: " ")
}