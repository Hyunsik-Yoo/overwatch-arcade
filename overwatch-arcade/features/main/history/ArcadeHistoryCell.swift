import SwiftUI
import struct Kingfisher.KFImage

struct ArcadeHistoryCell: View {
  
  @State var arcade: Arcade
  
  var body: some View {
    HStack(spacing: 0) {
      Spacer()
      VStack(alignment: .leading, spacing: 0) {
        Text(arcade.created_at)
          .foregroundColor(.white)
          .font(Font.custom("koverwatch", size: 20))

        HStack(alignment: .center, spacing: 8) {
          KFImage(URL(string: arcade.modes.tile_1.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)

          KFImage(URL(string: arcade.modes.tile_2.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)

          KFImage(URL(string: arcade.modes.tile_3.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)

          KFImage(URL(string: arcade.modes.tile_4.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)

          KFImage(URL(string: arcade.modes.tile_5.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)

          KFImage(URL(string: arcade.modes.tile_6.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)

          KFImage(URL(string: arcade.modes.tile_7.image)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
            .cornerRadius(6)
        }
        .padding(.top, 8)
      }
      Spacer()
    }
    .padding(.top, 40)
    .padding(.bottom, 16)
    .listRowBackground(Color(r: 28, g: 30, b: 31))
  }  
}

//struct ArcadeHistoryCell_Previews: PreviewProvider {
//  static var previews: some View {
//    ArcadeHistoryCell()
//  }
//}
