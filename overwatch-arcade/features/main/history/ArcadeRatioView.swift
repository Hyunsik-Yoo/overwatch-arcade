//
//  ArcadeRatioView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/09.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct ArcadeRatioView: View {
  
  @Binding var ratios: [String]
  
  init(ratios: Binding<[String]>) {
    self._ratios = ratios
    UITableView.appearance().backgroundColor = UIColor(r: 28, g: 30, b: 31)
    UITableView.appearance().tableFooterView = UIView()
    
  }
  
  var body: some View {
    List {
      ForEach(self.ratios, id: \.self) { ratio in
        ArcadeRatioCell()
          .listRowInsets(.init())
      }
    }
  }
}

//struct ArcadeRatioView_Previews: PreviewProvider {
//  static var previews: some View {
//    ArcadeRatioView()
//  }
//}
