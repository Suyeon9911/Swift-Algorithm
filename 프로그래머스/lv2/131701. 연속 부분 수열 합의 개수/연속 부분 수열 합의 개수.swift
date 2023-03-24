import Foundation

func solution(_ elements:[Int]) -> Int {
    
    // 결과를 저장할 자료형 : Set 
    var result = Set<Int>()
    elements.forEach { result.insert($0) }
    result.insert(elements.reduce(0,+))
    
    // 끝 숫자와 첫 숫자가 이어지도록 배열을 2개로 연결시켜줌. 오... 
    var list = elements + elements
    
    for i in 2...elements.count-1 {
        // 길이가 i 인 연속 부분 수열 
        var value = list[0...i-1].reduce(0,+)
        result.insert(value)
        
        // 슬라이딩 윈도우 : 첫 숫자 빼고 다음 숫자 추가하기
        for j in 1...elements.count-1 {
            value = value - list[j-1] + list[j+i-1]
            result.insert(value)
        }
    }

    return result.count
}