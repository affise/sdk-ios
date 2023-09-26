//
//  Int64+Time.swift
//  AffiseAttributionLib
//
//  Created by Sergey Korney
//


extension TimeInterval {
    var stripTimestampToHours: TimeInterval {
        get {
            let date = Date(timeIntervalSince1970: self.rounded())
            let calendar = Calendar.current
            var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            
            //Remove minute
            components.minute = 0
            //Remove second
            components.second = 0
            
            return calendar.date(from: components)!.timeIntervalSince1970
        }
    }
    
    var stripTimestampToMilis: TimeInterval {
        get {
            return self.rounded()
        }
    }
    
    var timeInMillis: Int64 {
        get {
            return Int64(self * 1000)
        }
    }
}
