import UIKit
import RxSwift

class MainVC: BaseVC {
  
  private lazy var mainView = MainView(frame: self.view.frame)
  
  
  static func instance() -> MainVC {
    return MainVC(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view = mainView
  }
}
