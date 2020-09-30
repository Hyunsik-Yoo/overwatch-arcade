import SwiftUI
import struct Kingfisher.KFImage

struct ModeCell: View {
  
  @Binding var mode: Mode?
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      ZStack(alignment: .init(horizontal: .leading, vertical: .bottom)) {
        if let urlString = mode?.image {
          KFImage(URL(string: urlString)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 104 * RatioUtils.heightRatio, alignment: .top)
            .background(Color.gray)
            .cornerRadius(6)
            .padding(.bottom, 10)
        }
        
        VStack(alignment: .leading, spacing: 0) {
          Spacer()
          
          HStack {
            Text(mode?.players ?? "")
              .padding()
              .background(Color(r: 249, g: 95, b: 95))
              .font(.custom("koverwatch", size: 12 * RatioUtils.widthRatio))
              .foregroundColor(.white)
              .frame(height: 20)
              .cornerRadius(34)
              .padding(.leading, 4 * RatioUtils.widthRatio)
            
            Spacer()
          }
        }
      }
      
      Text(mode?.name ?? "")
        .font(.custom("koverwatch", size: 20 * RatioUtils.widthRatio))
        .foregroundColor(.white)
        .padding(.leading, 4 * RatioUtils.widthRatio)
        .padding(.top, 8 * RatioUtils.heightRatio)
    }
  }
}

struct ModeCell_Previews: PreviewProvider {
  
  @State static var mode: Mode? = Mode(
    id: 1,
    image: "https://overwatcharcade.today/img/gamemodes/891002778a419e61f56701c2f245c04f.jpg",
    name: "Competitive Elimination",
    players: "3v3"
  )
  
  static var previews: some View {
    ModeCell(mode: $mode)
  }
}
