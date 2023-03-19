func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var musicInfo: [(Int,Int,String, String)] = []
    
    
    func changeShapCode(code: String) -> String {
        return code.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
    }
    
    let listenCode = changeShapCode(code: m)
    var musicOrder: Int = 0
    
    for i in musicinfos {
        musicOrder += 1
        let arrayType: [String] = i.split(separator: ",").map { String($0) }
        
        let startHour = Int(String(arrayType[0].prefix(2)))!
        let startMin = Int(String(arrayType[0].suffix(2)))!
        var endHour = Int(String(arrayType[1].prefix(2)))!
        let endMin = Int(String(arrayType[1].suffix(2)))!
        
        // if endHour == 0 { endHour = 24 }
        
        let playMin = (60 * endHour + endMin) - (60 * startHour + startMin)
        let musicTitle = arrayType[2]
        let musicCode = changeShapCode(code: arrayType[3])
        
        // print(musicCode)
        
        if playMin <= musicCode.count {
            // 만약 재생시간이 실제 곡의 길이보다 작다면, 그 재생시간만큼만 잘라서 저장.
            musicInfo.append((musicOrder,playMin,musicTitle,String(musicCode.prefix(playMin))))
        } else {
            // 만약 재생시간이 실제 곡의 길이보다 길다면, 그 길이만큼 더해줘야함
            var repeatCode = String(repeating: musicCode, count: playMin/musicCode.count)
            repeatCode += String(musicCode.prefix(playMin%musicCode.count))
            
            musicInfo.append((musicOrder,playMin,musicTitle, String(repeatCode)))
        }
    }
    
    // ✅ 2. 수정
    let answer = musicInfo
    .filter { $0.3.contains(listenCode) }
    .sorted { return $0.1 > $1.1 }
    
    
    return answer.isEmpty ? "(None)" : answer[0].2
}