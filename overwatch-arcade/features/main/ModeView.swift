//
//  ModeView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/09/05.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ModeView: View {
  @Binding var mode: Mode
  
  var body: some View {
    ZStack {
      KFImage(URL(string: mode.image)!)
        .resizable()
        .frame(width: 128, height: 128)
      
      HStack {
        Spacer()
        Text(mode.name)
          .font(.custom("koverwatch", size: 10))
      }
    }
  }
}

//struct ModeView_Previews: PreviewProvider {
//  static var previews: some View {
//    ModeView(mode: arcade.modes.tile_1)
//  }
//}
