import UIKit
import SwiftUI

extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
    self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
  }
}

extension Color {
  init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
    self.init(UIColor(r: r, g: g, b: b, a: a))
  }
}

