func solution(_ s:String) -> String {
    
    var stringArray:[String] = s.components(separatedBy: " ")

    for i in 0..<stringArray.count {
        var array: [String] = Array(stringArray[i]).map { String($0) }

        for j in 0..<array.count {
            if j % 2 == 0 {
                array[j] = String(array[j].uppercased())
            } else {
                array[j] = String(array[j].lowercased())
            }
        }
        stringArray[i] = array.joined()
    }

    return stringArray.joined(separator: " ")
}