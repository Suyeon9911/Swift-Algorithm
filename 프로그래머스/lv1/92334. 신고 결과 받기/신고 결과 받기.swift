import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportedDic: [String: Int] = [:] // 각 유저가 몇번 신고 당했는지
    var userDic: [String: [String]] = [:] // 유저별로 신고당한 내역
    var result = Array(repeating: 0, count: id_list.count)
    
    var idIndex: [String: Int] = [:]
    
    // 이름에 해당하는 index dictionary 생성
    for (index, id) in id_list.enumerated() {
        idIndex[id] = index
    }

    // 아예 처음부터 Set으로 중복 신고건은 제외해버리기

    for i in Set(report) {
        let splited = i.split(separator: " ").map { String($0) }
        // 신고당한 유저 : key 신고한 유저들 배열 형태의 value
        userDic[splited[1], default: []] += [splited[0]]

        // 신고 당한 사람 몇번 당했는지 세주기
        reportedDic[splited[1]] = (reportedDic[splited[1]] ?? 0) + 1
    }

    // 정지된 유저 구하기
    var suspendArray: [String] = []

    reportedDic.forEach {
        if $0.value >= k {
            suspendArray.append($0.key)
        }
    }

    // 정지당한 유저를 신고한 유저에게 메일 보내기
    suspendArray.forEach {
        userDic[$0]!.forEach {
            // 신고한 사람들 ??
            result[idIndex[$0]!] += 1
        }
    }

    return result
}