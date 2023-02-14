func solution(_ n:Int) -> Int {
    
    var result = [1,2]
    var i = 0
    
    while result.count < n {
        result.append((result[i]+result[i+1]) % 1234567)
        i += 1
    }
    
    return result[n-1]
}