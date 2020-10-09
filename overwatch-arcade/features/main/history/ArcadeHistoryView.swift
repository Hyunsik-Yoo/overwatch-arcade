//
//  ArcadeHistoryView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/09.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct ArcadeHistoryView: View {
  
  @ObservedObject var viewModel = ArcadeHistoryViewModel(overwatchService: OverwatchService())
  
  init() {
    UITableView.appearance().backgroundColor = UIColor(r: 28, g: 30, b: 31)
    UITableView.appearance().tableFooterView = UIView()
  }
  
  var body: some View {
    if let arcades = self.viewModel.arcades {
      List(arcades, id: \.created_at) { arcade in
        ArcadeHistoryCell(arcade: arcade)
          .listRowInsets(.init())
      }
      .onAppear {
        self.viewModel.fetchArcadeHistory()
      }
    } else {
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
      .onAppear {
        self.viewModel.fetchArcadeHistory()
      }
    }
  }
}

struct ArcadeHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    ArcadeHistoryView()
  }
}
