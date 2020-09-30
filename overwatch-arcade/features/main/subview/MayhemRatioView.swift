//
//  MayhemRatioView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/09/30.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct MayhemRatioView: View {
  
  @Binding var predictedValue: Int
  
  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      VStack(alignment: .leading, spacing: 0) {
        Text("내일 난장판 모드가 나올 확률")
          .font(.custom("koverwatch", size: 16))
          .foregroundColor(.white)
          .padding(.top, 16 * RatioUtils.heightRatio)
        
        Text("2020년 9월 30일부터 난장판 모드가 나왔던 비율입니다.")
          .font(.custom("koverwatch", size: 12))
          .foregroundColor(Color(r: 108, g: 108, b: 108))
          .padding(.top, 8 * RatioUtils.heightRatio)
          .padding(.bottom, 16 * RatioUtils.heightRatio)
      }
      .padding(.leading, 12 * RatioUtils.widthRatio)
      
      Spacer()
      
      Text("\(predictedValue)%")
        .font(.custom("koverwatch", size: 36 * RatioUtils.widthRatio))
        .foregroundColor(.white)
        .padding(.trailing, 12 * RatioUtils.widthRatio)
    }
    .background(Color.black)
    .cornerRadius(8)
  }
}


struct MayhemRatioView_Previews: PreviewProvider {
  
  @State static var samplePredictedValue = 68
  
  static var previews: some View {
    MayhemRatioView(predictedValue: $samplePredictedValue)
  }
}
