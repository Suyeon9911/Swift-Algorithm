### Input

1. split으로 쪼개기 
2. component() 사용

=> 둘의 차이는 import Foundation !

- component의 경우 Foundation에 들어있는 instance method ! 용량 증가
- split은 swift 의 기본 instance method 

### component는 왜 쓸까?? 리턴 값이 다르다 
- components는 리턴값이 [String]이고
- split은 리턴값이 [String.SubSequence]다 
=> split으로 쪼갤 경우 바로 String으로 쓸수가 없다. map을 사용해야한다.

### 비트 연산

- NOT : ~value // 00001111->11110000 으로. 0과 1을 바꿔준다
- AND : first & second // 두 개 자릿수가 둘 다 1일 때 1 리턴
- OR : first | second // 둘 중 하나라도 자릿수가 1이면 1 리턴
- XOR : first ^ second // 두 자릿수가 다르면 1, 같으면 0 리턴
- Left Shift : value << n // n만큼 왼쪽으로 이동하고 빈자리는 0으로 채운다
- Right Shift : value >> n // n만큼 오른쪽으로 이동하고 빈자리는 0으로
- 3항 연산자 : 조건문 ? 참 : 거짓 // a < b ? a: b 중첩도 가능

