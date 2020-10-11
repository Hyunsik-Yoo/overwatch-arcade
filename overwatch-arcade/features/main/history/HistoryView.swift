//
//  HistoryView.swift
//  overwatch-arcade
//
//  Created by Hyunsik Yoo on 2020/10/01.
//  Copyright © 2020 Macgongmon. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  @ObservedObject var viewModel = HistoryViewModel(overwatchService: OverwatchService())
  
  @State var tabBarPadding: CGFloat = 0
  @State var pageOffset: CGFloat = 0
  @State var pageIndex = 0
  
  
  var body: some View {
    ZStack {
      Color(r: 28, g: 30, b: 31)
        .edgesIgnoringSafeArea(.all)
      
      VStack(alignment: .leading, spacing: 0) {
        HStack(alignment: .top, spacing: 0) {
          Button {
            self.presentationMode.wrappedValue.dismiss()
          } label: {
            Image("ic_back")
          }
          .padding(.leading, 24 * RatioUtils.widthRatio)
          .padding(.top, 16 * RatioUtils.heightRatio)
          .padding(.bottom, 16 * RatioUtils.heightRatio)
          
          Text("History")
            .font(Font.custom("koverwatch", size: 24 * RatioUtils.widthRatio))
            .foregroundColor(.white)
            .padding(.top, 16 * RatioUtils.heightRatio)
            .padding(.leading, 16 * RatioUtils.widthRatio)
          
          Spacer()
        }
        
        HStack(spacing: 0) {
          Button(action: {
            self.changeView(left: false)
          }, label: {
            Text("아케이드 모드 비율")
              .foregroundColor(self.pageIndex == 0 ? .white : Color(r: 108, g: 108, b: 108))
              .font(Font.custom("koverwatch", size: 16 * RatioUtils.widthRatio))
              .frame(width: UIScreen.main.bounds.width / 2)
              .padding(.top, 12 * RatioUtils.heightRatio)
              .padding(.bottom, 12 * RatioUtils.heightRatio)
          })
          Button(action: {
            self.changeView(left: true)
          }, label: {
            Text("아케이드 모드 기록")
              .foregroundColor(self.pageIndex == 0 ? Color(r: 108, g: 108, b: 108) : .white)
              .font(Font.custom("koverwatch", size: 16 * RatioUtils.widthRatio))
              .frame(width: UIScreen.main.bounds.width / 2)
              .padding(.top, 12 * RatioUtils.heightRatio)
              .padding(.bottom, 12 * RatioUtils.heightRatio)
          })
          
        }
        
        Rectangle()
          .foregroundColor(.white)
          .frame(width: UIScreen.main.bounds.width / 2, height: 1)
          .padding(.leading, self.tabBarPadding)
          .animation(.default)
        
        Text("2020년 9월 30일부터 아케이드 모드 비율입니다.")
          .foregroundColor(Color(r: 109, g: 109, b: 109))
          .font(Font.custom("koverwatch", size: 12 * RatioUtils.widthRatio))
          .padding(.leading, 24 * RatioUtils.widthRatio)
          .frame(width: UIScreen.main.bounds.width, height: 44 * RatioUtils.heightRatio, alignment: .leading)
          .background(Color(r: 21, g: 21, b: 21))
          .edgesIgnoringSafeArea(.trailing)
        
        GeometryReader { geo in
          HStack(spacing: 0) {
            ArcadeRatioView(ratios: self.$viewModel.test)
              .frame(width: geo.frame(in: .global).width)
            ArcadeHistoryView(arcades: self.$viewModel.arcades)
              .frame(width: geo.frame(in: .global).width)
          }
          .offset(x: self.pageOffset)
          .highPriorityGesture(
            DragGesture().onEnded({ (value) in
              if value.translation.width > 50{// minimum drag...
                self.changeView(left: false)
              }
              if -value.translation.width > 50{
                self.changeView(left: true)
              }
            }))
          .animation(.default)
        }
        .edgesIgnoringSafeArea(.bottom)
      }
    }
    .navigationBarHidden(true)
    .onAppear {
      self.viewModel.fetchArcadeHistory()
      self.viewModel.fetchRatio()
    }
  }
  
  func changeView(left : Bool){
    if left {
      self.pageOffset = -UIScreen.main.bounds.width
      self.tabBarPadding = UIScreen.main.bounds.width / 2
      self.pageIndex = 1
    }
    else {
      self.pageOffset = 0
      self.tabBarPadding = 0
      self.pageIndex = 0
    }
  }
}

struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView()
  }
}
