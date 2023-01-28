import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    // 자카드 유사도- J(A, B) 교집합의 크기 / 합집합의 크기
    // 둘다 공집합 일 경우 1
    // 다중집합으로 확장
    // 교집합은 min, 합집합은 max
    
    // 문자열 사이 유사도 계산
    // 두 글자씩 끊어서 다중집합으로 만들기
    // 소문자, 대문자 차이 무시 -> 하나로 통일하기
    
    var answer: Double = 0
    
    // 1. 다중집합 만들기 
    
    var firstSet: [String] = []
    var secondSet: [String] = []
    
    let str1 = Array(str1)
    let str2 = Array(str2)
    
    for i in 0..<str1.count-1 {
        let first = str1[i]
        let second = str1[i+1]
        
        if first.isLetter && second.isLetter {
            firstSet.append((String(first)+String(second)).uppercased())
        }
    }
    
    for i in 0..<str2.count-1 {
        let first = str2[i]
        let second = str2[i+1]
        
        if first.isLetter && second.isLetter {
            secondSet.append((String(first)+String(second)).uppercased())
        }
    }
    
    if firstSet.isEmpty && secondSet.isEmpty {
        return 65536
    }
    
    var firstDic: [String: Int] = [:]
    var secondDic: [String: Int] = [:]
    
    
    for i in firstSet {
        firstDic[i, default: 0] += 1
    }
    
    for i in secondSet {
        secondDic[i, default: 0] += 1
    }
    
    
    // 교집합, 합집합 구하기 -> Set을 직접 만들기
    
    var interSection: [String] = []
    var unionSet: [String] = []
    
    /*
    아이디어 : 각각 딕셔너리로 숫자 카운트 해준다음에, key가 같으면 
    value 비교해서 조건에 맞게 넣어주기.
    */
    
    // 1. 교집합 - 겹치는거 숫자 구한다음에 최솟값으로만
    // 2. 합집합 - 전부 합친다음에 겹치는거 숫자 큰거대로
    
    var minValue = 0
    var maxValue = 0
    
    for (key, value) in firstDic {
        for (key2, value2) in secondDic {
            if key == key2 {
                minValue = min(value, value2)
                maxValue = max(value, value2)
                
                interSection.append(contentsOf: Array(repeating: key, count: minValue))
                unionSet.append(contentsOf: Array(repeating: key, count: maxValue))
                
                firstSet.removeAll(where: {$0 == key})
                secondSet.removeAll(where: {$0 == key2})
            }
        }
    }
    
    for i in firstSet {
        unionSet.append(i)
    }
    
    for j in secondSet {
        unionSet.append(j)
    }
    
    print(interSection)
    print(unionSet)
    
    if interSection.isEmpty && unionSet.isEmpty {
        answer = 65536
    } else {
        answer = Double(interSection.count) / Double(unionSet.count) * 65536
        // answer = floor(answer)
    }
    
    return Int(answer)
}