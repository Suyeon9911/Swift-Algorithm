import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var skillOrder: [String: Int] = [:] // 탐색을 빠르게 하기 위해 딕셔너리로 저장.
    var index = 1
    
    for i in skill {
        skillOrder[String(i), default: 0] += index
        index += 1
    }
    
    var availableSkill = 0
    
    for i in skill_trees {
        let i = Array(i).map{ String($0) }.filter { skillOrder[$0] != nil }
        
        if i.isEmpty {
            availableSkill += 1
            continue
        }
        
        var order: [Int] = []
        i.forEach { order.append(skillOrder[$0]!) }
        
        if order == Array(1...i.count) {
            availableSkill += 1
        }
    }
    
    return availableSkill
}