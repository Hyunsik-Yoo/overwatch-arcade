import SwiftUI

struct ArcadeHistoryCell: View {
  
  @State var arcade: Arcade?
  
  var body: some View {
    if let arcade = self.arcade {
      HStack(spacing: 0) {
        Spacer()
        VStack(alignment: .leading, spacing: 0) {
          
          Text(arcade.created_at)
            .foregroundColor(.white)
          
          HStack(alignment: .center, spacing: 8) {
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
          }
          .padding(.top, 8)
        }
        Spacer()
      }
      .padding(.top, 40)
      .padding(.bottom, 16)
      .listRowBackground(Color(r: 28, g: 30, b: 31))
    } else {
      HStack(spacing: 0) {
        Spacer()
        VStack(alignment: .leading, spacing: 0) {
          Rectangle()
            .frame(width: 73, height: 20)
            .foregroundColor(.gray)
          
          HStack(alignment: .center, spacing: 8) {
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
              .cornerRadius(6)
            
            Rectangle()
              .frame(width: 40 * RatioUtils.widthRatio, height: 28 * RatioUtils.widthRatio)
              .foregroundColor(.gray)
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
}

struct ArcadeHistoryCell_Previews: PreviewProvider {
  static var previews: some View {
    ArcadeHistoryCell()
  }
}
