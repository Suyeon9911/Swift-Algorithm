//
//  Practice4.swift
//  Swift-Algorithm
//
//  Created by 김수연 on 2022/09/20.
//

import Foundation

/*
 정수 제곱근 판별
 스위프트의 거듭제곱 메소드는 pow이다.
 문제 : 주로 거듭제곱한 값을 단독으로 사용할 일은 거의 없고 다른 정수와 더해주거나 하는데, 리턴 타입이 Int가 아니라는 점

 Int 형으로 형변환 시 에러 :  pow 종류가 타입에 따라서 여러 개가 있었는데, 그중 어떤 것을 사용한 것인지 Ambiguous 하다는 말이다. 그냥 pow만 해줬을 때는 이런 에러가 안 뜨다가 갑자기 이런 에러가 뜨는 이유는 Int의 init의 파라미터로 들어갔기 때문

 Int.init(_:)을 쓰려면 pow의 리턴 타입을 알아야 함 -> pow의 리턴 타입이 뭔지 애매함

 pow만 단독으로 써줬을 때는 리턴 타입을 아무거나로(Decimal로) 알아서 정해줬는데, 이게 init의 파라미터로 들어가면 그렇게 할 수가 없다.

 Int의 init 중에서 Decimal 타입을 받는 건 없기 때문에 만약 Decimal이면 Int형으로 바꾸는 게 불가능하고, Float, Float80, CGFloat이면 가능하니까 뭘로 정하느냐에 따라서 결과가 달라지는 것이다.

 해결 방법 :  pow의 리턴 타입을 명확하게 해 주면 해결이 되는데, 리턴 타입을 명확하게 해주는 방법은 호출할 때 파라미터 타입을 명확하게 해주는 것
 */

class powBasic {

    let powResult = pow(3.0, 2.0) // 호출할 때는 이렇게 소수점을 붙여서 3과 2가 각각 Decimal, Int 타입이 아니라는 것을 알려주자.
    var sum = 0

    func powPrac() {
        sum += Int(pow(3.0, 2.0))

//        pow(_ x: Decimal, _ y: Int) -> Decimal
//        pow(_: Float, _: Float) -> Float

        print(sum)  // 9

        // 제곱근 구하기

        let value = 9.0

        sqrt(value) // 3.0
    }

}

//func sqrt(_: Double) -> Double {
//
//}


func solution(_ n:Int64) -> Int64 {

    var result: Int64 = 0

    for i in 1..<n+1 {
        if n == i*i {
            result = (i+1)*(i+1)
            break
        } else {
            result = -1
        }
    }
    return result
}

// 내 풀이는 단순하게 1부터 n+1 까지 돌아가면서 제곱근을 찾았을때를 구분해줬다.
// 근데 개선할 점이 있다. 일단 굳이 n+1까지 돌릴필요가 없다.
// 삼항연산자를 잘 써서 코드를 더 간결하게 만들수 있다.


func solutionOther(_ n:Int64) -> Int64 {

    let t = Int64(sqrt(Double(n)))
    // 121이라면 11을 구해서 -> 11 * 11 한 값이 121과 같다면 12*12 return 하고 아니면 -1
    // 여기서 pow나 sqrt 를 쓰려면 형변환에 때해서 잘 알고있는게 키포인트 였다 !
    // 다 Double로 바꿔주쟈잇 리턴타입 확인 잘하구 ~
    
    return t * t == n ? (t+1)*(t+1) : -1
}
