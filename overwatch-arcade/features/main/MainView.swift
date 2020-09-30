import SwiftUI
import Alamofire
import struct Kingfisher.KFImage


struct MainView: View {
  @ObservedObject var viewModel = MainViewModel(overwatchService: OverwatchService())
  
  var body: some View {
    NavigationView {
      ZStack {
        Image("img_background")
          .resizable()
          .edgesIgnoringSafeArea([.top, .bottom])
        
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .leading, spacing: 0) {
            HStack {
              Spacer()
              
              NavigationLink(
                destination: Text("Destination"),
                label: {
                  Image("ic_history")
                })
                .padding(.top, 16 * RatioUtils.heightRatio)
            }
            
            Image("img_mayhem")
              .resizable()
              .opacity(self.viewModel.iconOpacity)
              .frame(
                width: 108 * RatioUtils.widthRatio,
                height: 108 * RatioUtils.widthRatio
              )
              .padding(.top, 64 * RatioUtils.heightRatio)
            
            Text("2020. 09.30")
              .font(.custom("koverwatch", size: 20 * RatioUtils.widthRatio))
              .foregroundColor(.white)
              .padding(.top, 16 * RatioUtils.heightRatio)
            
            Text(self.viewModel.titleText)
              .font(.custom("koverwatch", size: 36 * RatioUtils.widthRatio))
              .foregroundColor(.white)
              .padding(.top, 16 * RatioUtils.heightRatio)
              .lineSpacing(10)
            
            MayhemRatioView(predictedValue: self.$viewModel.predictedValue)
              .padding(.top, 24)
            
            HStack(spacing:0) {
              Text("OVERWATCH ARCADE TODAY")
                .font(.custom("koverwatch", size: 20 * RatioUtils.widthRatio))
                .foregroundColor(.white)
              
              Spacer()
              
              Text("18:42:21")
                .font(.custom("koverwatch", size: 20 * RatioUtils.widthRatio))
                .foregroundColor(.white)
            }
            .padding(.top, 72 * RatioUtils.heightRatio)
            
            BigModeCell(mode: self.$viewModel.mode1)
              .padding(.top, 8 * RatioUtils.heightRatio)
            
            HStack(spacing: 15 * RatioUtils.widthRatio) {
              ModeCell(mode: self.$viewModel.mode2)
              ModeCell(mode: self.$viewModel.mode3)
            }
            .padding(.top, 24 * RatioUtils.heightRatio)
            
            HStack(spacing: 15 * RatioUtils.widthRatio) {
              ModeCell(mode: self.$viewModel.mode4)
              ModeCell(mode: self.$viewModel.mode5)
            }
            .padding(.top, 24 * RatioUtils.heightRatio)
            
            HStack(spacing: 15 * RatioUtils.widthRatio) {
              ModeCell(mode: self.$viewModel.mode6)
              ModeCell(mode: self.$viewModel.mode7)
            }
            .padding(.top, 24 * RatioUtils.heightRatio)
          }
          .padding(.leading, 24 * RatioUtils.widthRatio)
          .padding(.trailing, 24 * RatioUtils.widthRatio)
        }
      }
      .navigationBarHidden(true)
    }
    .onAppear(perform: self.viewModel.fetchArcade)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
