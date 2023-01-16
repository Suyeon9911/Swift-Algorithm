import Foundation

/*
정리 : 신규 유저가 카카오 규칙에 맞지 않는 아이디를 입력했을때, 입력된 아이디와 유사하면서
규칙에 맞는 아이디를 추천해주는 프로그램 개발
조건 
1) 길이 3 - 15자
2) 알파벳 소문자, 숫자 - _ .
3) .는 처음과 끝, 연속 사용 x

*/
func solution(_ new_id:String) -> String {
    
    var myID: String = new_id

    //1차
    myID = myID.lowercased()

    //2차
    var newID: String = ""

    for i in myID {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "." {
            newID.append(i)
        }
    }

    //3차
    while newID.contains("..") {
        newID = newID.replacingOccurrences(of: "..", with: ".")
    }

    //4차
    while newID.hasPrefix(".") {
        newID.removeFirst()
    }

    while newID.hasSuffix(".") {
        newID.removeLast()
    }

    //5차
    if newID == "" {
        newID = "a"
    }

    // newID.isEmpty도 가능하지 않을까

    // 6차

    if newID.count >= 16 {
        newID = String(newID.prefix(15))

        if newID.hasSuffix(".") {
            newID.removeLast()
        }
    }

    //7차
    if newID.count <= 2 {
        while newID.count != 3 {
            newID = newID + String(newID.last!)
        }
    }

    return newID
}