import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var parentDic: [String: String] = [:] // 굳이 다 연결되어 있지 않아도 부모가 누구인지만 알면됨.
    var profitDic: [String: Int] = [:]
    
    for i in 0..<enroll.count {
        // john.mary.edward...
        profitDic[enroll[i]] = 0 // 이익 딕셔너리 초기화
        parentDic[enroll[i]] = referral[i] // 자신의 부모가 누구인지 저장.
    }
    
    for i in 0..<seller.count {
        var profit: Int = amount[i] * 100 // 판매액은 개수*100
        var parent: String = seller[i] // 셀러이름부터 시작해서 ~ 루트부모까지 반복
        
        while parent != "-" && profit > 0 {
            // 부모노드까지 반복, 분배할 이익은 0 이상이어야함.
            profitDic[parent]! += profit - profit/10 // 이익의 10프로를 뺸 나머지는 내가 갖는다. 
            parent = parentDic[parent]! // 부모를 찾는다.
            profit = profit/10 // 이익의 10퍼센트를 부모 노드에 전달하기 위해 저장.
        }
    }
    
    // print(profitDic)
    // enroll 순서대로 return
    return enroll.map { profitDic[$0]! }
}