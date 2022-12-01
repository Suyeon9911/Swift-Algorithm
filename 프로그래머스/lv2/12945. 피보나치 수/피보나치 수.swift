func solution(_ n:Int) -> Int {
    
    var fiboArray = Array(repeating: 0, count: n+1)
    
    fiboArray[0] = 0
    fiboArray[1] = 1
    
    for i in 2...n {
        fiboArray[i] = (fiboArray[i-2] + fiboArray[i-1]) % 1234567
    }
    
    return fiboArray[n]
}