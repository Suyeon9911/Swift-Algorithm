//
//  성적낮은순출력.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/06.
//

import Foundation

/*
 N명의 학생정보가 있다.
 성적이 낮은 수대로 학생 이름 출력

 2
 홍길동 97
 이순신 77

 -> 이순신 홍길동
 */


// 일단 내가 먼저 구조체로 풀어본당.

struct Student {
    let name: String
    let score: Int
}

func 성적낮은순출력() {

    let n = Int(readLine()!)!
    var studentArray: [Student] = []

    for _ in 0..<n {
        let studentInfo = readLine()!.split(separator: " ").map { String($0) }
        // tuple 형태로 저장해도된다! 0, 1로 접근 
        studentArray.append(Student(name: studentInfo[0], score: Int(studentInfo[1])!))
    }

    studentArray.sort { $0.score < $1.score }

    for i in studentArray {
        print(i.name, terminator: " ")
    }
}
