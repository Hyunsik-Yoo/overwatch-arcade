//
//  WidgetView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/09/27.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct WidgetView : View {
  var entry: Provider.Entry
  
  var body: some View {
    if entry.isTotalMayhem {
      ZStack {
        Image("total")
          .resizable()
          .aspectRatio(contentMode: .fill)
        
        VStack {
          Spacer()
          
          Text("오늘은 난장판!")
            .font(Font.custom("koverwatch", size: 25))
            .foregroundColor(.white)
            .padding(.bottom, 30)
        }
      }
    } else {
      ZStack {
        Color.red
        
        VStack {
          Spacer()
          
          Text("오늘은 난장판 아님!")
            .font(Font.custom("koverwatch", size: 25))
            .foregroundColor(.white)
            .padding(.bottom, 30)
        }
      }
    }
  }
}
