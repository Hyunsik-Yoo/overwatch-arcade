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
  @Binding var mode: Mode?
  
  var body: some View {
    ZStack {
      if let url = mode?.image {
        KFImage(URL(string: url)!)
          .resizable()
          .frame(width: 128, height: 128)
      }
      
      VStack {
        Spacer()
        
        if let name = mode?.name {
          Text(name)
            .font(.custom("koverwatch", size: 10))
        }
      }
      .frame(width: 128, height: 128)
    }
  }
}

//struct ModeView_Previews: PreviewProvider {
//  static var previews: some View {
//    ModeView(mode: arcade.modes.tile_1)
//  }
//}
