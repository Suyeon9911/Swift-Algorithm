//
//  Stack.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/02.
//

import Foundation

// Stack 구현하기 : Queue 처럼 Stack 또한 구조체와 배열로

struct Stack<T> {
    private var stack: [T] = []

    public var count: Int {
        return stack.count
    }

    public var isEmpty: Bool {
        return stack.isEmpty
    }

    // 값 타입의 속성은 기본적으로 인스턴스 메서드 내에서 수정할 수 없는데, 값 타입의 속성을 수정하려면 인스턴스 메서드에서 mutating 키워드를 사용해야 한다.
    // mutating을 붙이면 self 프로퍼티에 새로운 인스턴스를 할당할 수 있다.
    // push 와 pop에 mutating 키워드가 붙어야만 값 타입 프로퍼티를 수정할 수 있다
    public mutating func push(_ element: T) {
        stack.append(element)
    }

    public mutating func pop() -> T? {
        return isEmpty ? nil : stack.popLast()
    }
}


class StackPractice {
    var myStack = Stack<Int>()
//    myStack.push(10)
//    myStack.pop()
}


/*
 LIFO 인 Stack의 경우 큐와 달리 늘 마지막에 추가되고 삭제 되기 때문에 O(1)
 배열을 댕기고 움직이고 하는 오버헤드가 발생하지 않음
 removeLast와 동일한 함수인 popLast라는 함수 자체를 지원함
 스위프트에서 굳이 stack을 만들어 쓰지 않아도 배열 append() 와 popLast() 만으로도 충분히 사용 가능 !
 
 */
