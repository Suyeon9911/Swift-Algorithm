func solution(_ s:String) -> String {
    
    var array = Array(s)
    
    if array.count == 1{
        return s
    }
    
    return array.sorted(by: >).map { String($0) }.joined()
}