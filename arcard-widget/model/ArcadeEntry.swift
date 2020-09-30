//
//  ArcadeEntry.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/09/27.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import Foundation
import WidgetKit

struct ArcadeEntry: TimelineEntry {
  let date: Date
  let configuration: ConfigurationIntent
  let isTotalMayhem: Bool
}
