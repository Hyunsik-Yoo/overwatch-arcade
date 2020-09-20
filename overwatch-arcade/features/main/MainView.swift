
import SwiftUI
import Alamofire
import struct Kingfisher.KFImage


struct MainView: View {
  @ObservedObject var viewModel = MainViewModel(overwatchService: OverwatchService())
  
  var body: some View {
    NavigationView {
      VStack {
        Button(action: self.viewModel.fetchArcade) {
          Text("갱신")
        }
        HStack {
          ModeView(mode: self.$viewModel.mode1)
          ModeView(mode: self.$viewModel.mode2)
          ModeView(mode: self.$viewModel.mode3)
        }
        HStack {
          ModeView(mode: self.$viewModel.mode4)
          ModeView(mode: self.$viewModel.mode5)
          ModeView(mode: self.$viewModel.mode6)
        }
        HStack {
          ModeView(mode: self.$viewModel.mode7)
        }
      }
    }.onAppear(perform: self.viewModel.fetchArcade)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
