import Foundation

/*
    총 3번의 기회 : 0점에서 10점 
    S D T 1제곱 2제곱 3제곱
     
    스타상 - 해당점수, 전점수 2배 / 첫번쨰 나올경우 첫번쨰 점수만 2배
    아차상 - 해당점수 마이너스 
    스타상 효과 중첩 가능 - 4배 
    스타상 아차상 중첩 가능 - -2배
    
*/

func solution(_ dartResult: String) -> Int {
    
    func calculate(s: String) -> Float {
        if s == "S" {
            return 1.0
        } else if s == "D" {
            return 2.0
        } else {
            return 3.0
        }
    }

    var score = dartResult.filter { $0.isNumber }

    if score.contains("10") {
        score = score.replacingOccurrences(of: "10", with: "!")
    }

    var scoreArray: [String] = []
    score.forEach { scoreArray.append(String($0)) }

    scoreArray.indices.filter{scoreArray[$0] == "!"}.forEach{scoreArray[$0] = "10"}

    let letter = dartResult.filter { $0.isNumber == false }
    let bonus = dartResult.filter { $0.isLetter }.map { $0 }
    var option = letter.components(separatedBy: ["S","D","T"])
    option.removeFirst()

    var sum: [Int] = []


    for i in 0..<3 {
        let bonusCount = calculate(s: String(bonus[i]))
        var number = pow(Float(scoreArray[i])!, bonusCount)

        sum.append(Int(number))

        //pow(_: Float, _: Float) -> Float
    }

    for i in 0..<option.count {
        if option[i] == "*" {
            sum[i] = sum[i] * 2
            if i != 0 {
                sum[i-1] = sum[i-1] * 2
            }
        } else if option[i] == "#" {
            sum[i] = sum[i] * (-1)
        }
    }



    return sum.reduce(0,+)
}