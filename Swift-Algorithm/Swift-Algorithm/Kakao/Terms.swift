//
//  Terms.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/24.
//

import Foundation

func 약관(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {

    var answer: [Int] = []
    var termsDic: [String: Int] = [:]

    var privacyTerms: [String] = []
    var privacyDate: [Date] = []

    var resultDateArray: [Date] = []


    for i in terms {
        var numIndex = i.index(i.startIndex, offsetBy: 2)
        var number = i[numIndex...]
        termsDic[String(i.prefix(1))] = Int(String(number))
    }

    for j in privacies {
        privacyTerms.append(String(j.suffix(1)))

        if let date = String(j.prefix(10)).toDate() {
            privacyDate.append(date)
        }
    }

    for index in 0..<privacyTerms.count { // A B C C
        for term in termsDic { // B C A
            if privacyTerms[index] == term.key {

                // privacy 날짜 month에 term의 value 값을 더한다.
                let resultDate = privacyDate[index].addMonth(month: termsDic[term.key]!)

                // privacy 날짜가 today보다 이전이거나 같다면 폐기
                resultDateArray.append(resultDate!)
                // resultStringDate.append(resultDate?.toString() ?? "")
            }
        }
    }

    // 마지막으로 현재 날짜와 비교

    for i in 0..<resultDateArray.count {
        if resultDateArray[i] <= today.toDate()! {
            answer.append(i+1)
            print(answer)
        }
    }
    return answer
}

// 약관("2022.05.19", ["A 6","B 12","C 3"], ["2021.05.02 A","2021.07.01 B","2022.02.19 C","2022.02.20 C"])

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

extension Date {
    func addMonth(month: Int) -> Date? {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: month, to: self)
    }
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
}

