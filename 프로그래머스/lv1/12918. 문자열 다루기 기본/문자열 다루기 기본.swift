func solution(_ s:String) -> Bool {
    
    if s.count == 4 || s.count == 6 {
        for i in s {
            if i.isLetter {
                return false
            } else {
                continue
            }
        }
        
        return true
    } else {
        return false
    }
}