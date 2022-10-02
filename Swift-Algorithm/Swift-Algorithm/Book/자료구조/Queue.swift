//
//  Queue.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/10/02.
//

import Foundation

// Swift는 Queue 라이브러리를 지원하지 않음 .
// 구조체와 배열로 구현

struct Queue<T> {
    private var queue: [T] = []

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

// 배열에서 queue는 마지막 element가 아닌 첫번째 element를 삭제함
// O(1)이 아니라, element가 하나씩 당겨지는 과정이 필요해 O(n)
// 큐 특성상 head의 element를 삭제하는 dequeue의 작업은 오버헤드가 발생한다는 말

/*
 2. dequeue에 효율적인 Queue 만들기

 dequeue 시 배열을 앞당겨주는 작업을 최소화!
 실제 배열의 head를 삭제하는 것이 아닌 현재 head를 가리키고 있는 포인트를 변경시켜서
 dequeue가 호출될 떄마다 하던 배열의 삭제 작업을 하지 않는 것
 대신, 더 이상 필요없는 dequeue된 element는 nil로 만들어주는 것

 head: dequeue 시 반한되어야하는 element의 index를 들고 있는 것
 dequeue가 불릴때마다 element를 삭제하고, 나머지 element를 당겨오는 과정이 없기 떄문에 오버헤드 ㄴㄴ
 대신 적정한 때에 dequeue된 element들을 remove하는 작업을 해줘야함.
 */

struct ImprovedQueue<T> {
    private var queue: [T?] = []
    private var head: Int = 0

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else {
            return nil
        }
        queue[head] = nil
        head += 1

        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}
