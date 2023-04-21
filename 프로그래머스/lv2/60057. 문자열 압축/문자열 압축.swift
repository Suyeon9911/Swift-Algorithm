import Foundation

func solution(_ s:String) -> Int {
    
    // 1부터 절반 길이까지 다 잘라서 확인해보기
    
    if s.count < 3 { return s.count }
    
    let s = Array(s).map { String($0) }
    var answer = s.count
    
    
    for i in 1...s.count/2 {
        var compressed = ""
        var prev = s[0..<i].joined() // 앞에서 부터 자른 길이만큼의 문자열 추출
        var count = 1 // 압축횟수 세기 
        
        // 자르는 단위 크기만큼 증가시키면서 이전 문자열이랑 비교하기
        for j in stride(from: i, to: s.endIndex, by: i) {
            // 이전 문자열과 동일하다면 count 증가
            var idx = j + i
            if j + i > s.count - 1 {
                idx = s.endIndex
            }

            if prev == s[j..<idx].joined() {
                count += 1
            } else {
                // 더 이상 압축 못한다면
                if count >= 2 {
                    compressed += "\(count)"+prev
                } else {
                    compressed += prev
                }
                
                // 초기화 후 다음으로 넘어가기
                prev = s[j..<idx].joined()
                count = 1
            }
        }
        
        // 남아 있는 문자열 처리 
        
        if count >= 2 {
            compressed += "\(count)"+prev
        } else {
            compressed += prev
        }
        
        // 가장 짧은 문자열이 정답
        answer = min(answer, compressed.count)
    }
    
    return answer
}