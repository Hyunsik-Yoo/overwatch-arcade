//
//  DateUtils.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/09.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import Foundation

struct DateUtils {
  
  static func getTodayString() -> String {
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: Date())
  }
}
