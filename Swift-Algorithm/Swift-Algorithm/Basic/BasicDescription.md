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



