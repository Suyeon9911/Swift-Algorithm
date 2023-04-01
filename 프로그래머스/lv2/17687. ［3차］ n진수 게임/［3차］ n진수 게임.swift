func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    // 미리 구할 숫자 만큼 차례가 돌아와야하니까 적어도 t*m 의 길이는 되어야함.
    var length = t*m
    var gameArray: [String] = []
    var number = 0
    
    while gameArray.count < length {
        let changedNum = String(number, radix: n)
        
        gameArray += Array(changedNum).map { String($0).uppercased() }
        number += 1
    }
    
    // 진법에 따라 미리 숫자 배열을 만들어 두고, 튜브의 차례에 해당하는 인덱스만큼 출력
    
    var result = ""
    
    // t번만 반복.
    for i in stride(from: p-1, to: length, by: m) {
        result += gameArray[i]
    }
    
    return result
}