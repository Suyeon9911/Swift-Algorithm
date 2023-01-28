func solution(_ s:String) -> String {
    
    var answer: String = ""

    if s.count % 2 == 0 {
        // 짝수일경우 -> string에 나누기 2 해서 -1 한 인덱스 부터 ~ 나누기 2한 부분
        // 즉 4개 일경우 나누기 2 한뒤 -1한 1번 인덱스 부터 +1
        let targetIndex = s.count / 2 - 1

        // answer = String(s[s.index(s.startIndex, offsetBy: targetIndex)...s.index(s.startIndex, offsetBy: targetIndex + 1)])
        
        answer = String(Array(s)[targetIndex...targetIndex+1])

    } else {
        // 홀수일 경우 stirng의 길이 에서 나누기 2한 몫
        let targetIndex = s.count / 2 // 아마 5에서 2로 나누면 몫이 2 니까 인덱스가 2번
        answer = String(Array(s)[targetIndex])
    }

    return answer
}