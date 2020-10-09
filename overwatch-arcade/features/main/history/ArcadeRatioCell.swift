//
//  ArcadeRatioCell.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/09.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ArcadeRatioCell: View {
  
  @State var mode: Mode?
  
  var body: some View {
    if let mode = mode {
      HStack(spacing: 0) {
        KFImage(URL(string: mode.image)!)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 54 * RatioUtils.heightRatio, alignment: .top)
          .background(Color.green)
          .cornerRadius(6)
      }
    } else {
      HStack(spacing: 0) {
        Rectangle()
          .frame(width: 80 * RatioUtils.widthRatio, height: 54)
          .foregroundColor(.gray)
          .cornerRadius(6)
          .padding(.leading, 24)
        
        VStack(alignment: .leading, spacing: 0) {
          Rectangle()
            .frame(width: 39, height: 20)
            .foregroundColor(.gray)
            .cornerRadius(34)
          
          Rectangle()
            .frame(width: 160, height: 20)
            .foregroundColor(.gray)
            .padding(.top, 8)
        }
        .padding(.leading, 16 * RatioUtils.widthRatio)
        
        Spacer()
        
        Rectangle()
          .frame(width: 62, height: 42)
          .foregroundColor(.gray)
          .padding(.trailing, 24 * RatioUtils.widthRatio)
      }
      .padding(.top, 40)
      .padding(.bottom, 8)
      .listRowBackground(Color(r: 28, g: 30, b: 31))
    }
  }
}

struct ArcadeRatioCell_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ArcadeRatioCell()
      ArcadeRatioCell()
    }
  }
}
