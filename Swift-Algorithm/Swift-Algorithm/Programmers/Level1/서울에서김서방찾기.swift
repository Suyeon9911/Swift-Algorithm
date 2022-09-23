//
//  서울에서김서방찾기.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/23.
//

import Foundation

/*
 String형 배열 seoul의 element중 "Kim"의 위치 x를 찾아, "김서방은 x에 있다"는 String을 반환하는 함수, solution을 완성하세요. seoul에 "Kim"은 오직 한 번만 나타나며 잘못된 값이 입력되는 경우는 없습니다.
 */

func 서울에서김서방(_ seoul:[String]) -> String {

    // 배열에서 특정 요소 인덱스 값 찾기

    guard let index = seoul.firstIndex(of: "Kim") else {
        return ""
    }

    // index 값은 Int?

    return "김서방은 \(index)에 있다"
}


func 서울에서김서방2(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

func 서울에서김서방3(_ seoul:[String]) -> String {
    for i in 0..<seoul.count {
        if seoul[i] == "Kim" {
            return "김서방은 \(i)에 있다"
        }
    }
    return ""
}

func 서울에서김서방4(_ seoul:[String]) -> String {
    var position = -1
    
    // enumerated 써서 인덱스랑 같이 구하기 !

    for (idx,value) in seoul.enumerated() {
        if value == "Kim" {
            position = idx
        }
    }

    return "김서방은 \(position)에 있다"
}
