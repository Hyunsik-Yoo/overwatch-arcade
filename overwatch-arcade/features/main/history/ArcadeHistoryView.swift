//
//  ArcadeHistoryView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/09.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct ArcadeHistoryView: View {
  
  init() {
    UITableView.appearance().backgroundColor = UIColor(r: 28, g: 30, b: 31)
    UITableView.appearance().tableFooterView = UIView()
    
  }
  
  var body: some View {
    List {
      ArcadeHistoryCell()
        .listRowInsets(.init())
      ArcadeHistoryCell()
        .listRowInsets(.init())
      ArcadeHistoryCell()
        .listRowInsets(.init())
      ArcadeHistoryCell()
        .listRowInsets(.init())
      ArcadeHistoryCell()
        .listRowInsets(.init())
      ArcadeHistoryCell()
        .listRowInsets(.init())
    }
  }
}

struct ArcadeHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    ArcadeHistoryView()
  }
}
