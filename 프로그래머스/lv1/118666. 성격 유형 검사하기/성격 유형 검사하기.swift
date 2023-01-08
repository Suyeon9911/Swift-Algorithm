import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
        var choiceDic: [Character:Int] = [:]
    choiceDic = ["R": 0,"T" : 0, "C" : 0, "F" : 0, "J" : 0, "M" : 0, "A" : 0, "N" : 0 ]

    var answer: String = ""

    for (index, choice) in choices.enumerated() {
        let survey = survey[index].map { $0 } // 0번째 선택과 0번째 질문을 매칭

        if choice >= 1 && choice <= 3 {
            // 1보다 크고 3보다 작으면 앞에 있는 문자에서 3,2,1 점
            choiceDic[survey[0]]! += 4 - choice // 1번을 선택하면 3점 -> 2번 2점 -> 3번 1점
        } else if choice >= 5 && choice <= 7 {
            // 5번에서 7번은 뒤의 문자유형의 1 2 3
            choiceDic[survey[1]]! += choice - 4
        } else {
            // 4번
            continue
        }
    }

    answer += choiceDic["R"]! >= choiceDic["T"]! ? "R" : "T"
    answer += choiceDic["C"]! >= choiceDic["F"]! ? "C" : "F"
    answer += choiceDic["J"]! >= choiceDic["M"]! ? "J" : "M"
    answer += choiceDic["A"]! >= choiceDic["N"]! ? "A" : "N"
    return answer
}