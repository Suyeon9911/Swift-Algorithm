func solution(_ a:Int, _ b:Int) -> String {
    
    // - 윤년 : 2월 29일까지 있음.
    
    let week = ["FRI","SAT","SUN","MON","TUE","WED","THU"]
    var result: String = ""
    
    // 1 : 31, 2 : 29, 3 : 31, 4 : 30, 5: 31, 6: 30, 7,8 : 31
    // 9 : 30 , 10: 31, 11: 30, 12: 31
    
    let monthDay = [1:31, 2:29, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30 , 10:31, 11:30, 12:31]
    
    var addDay = 0
    
    if a >= 2 {
        for i in 1..<a {
            // 1, 2, 3, 4, 5 날짜수 다 더하기 
            addDay += monthDay[i]!
        }   
    }
    
    // 마지막으로 b 더해주기 
    addDay += b-1
    result = week[addDay%7]
    
    
    return result
}