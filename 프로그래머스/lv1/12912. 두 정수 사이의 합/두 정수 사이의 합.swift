func solution(_ a:Int, _ b:Int) -> Int64 {
    
    var intArray: [Int] = []
    
    let range = a < b ? a...b : b...a
    
    for i in range {
        intArray.append(i)
    }
    
    return Int64(intArray.reduce(0,+))
}