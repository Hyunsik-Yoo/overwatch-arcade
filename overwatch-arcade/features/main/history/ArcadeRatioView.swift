//
//  ArcadeRatioView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/09.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct ArcadeRatioView: View {
  
  init() {
    UITableView.appearance().backgroundColor = UIColor(r: 28, g: 30, b: 31)
    UITableView.appearance().tableFooterView = UIView()
    
  }
  
  var body: some View {
    List {
      ArcadeRatioCell()
        .listRowInsets(.init())
      ArcadeRatioCell()
        .listRowInsets(.init())
      ArcadeRatioCell()
        .listRowInsets(.init())
      ArcadeRatioCell()
        .listRowInsets(.init())
      ArcadeRatioCell()
        .listRowInsets(.init())
    }
    .onAppear {
      UITableView.appearance().separatorStyle = .none
    }
  }
}

struct ArcadeRatioView_Previews: PreviewProvider {
  static var previews: some View {
    ArcadeRatioView()
  }
}
