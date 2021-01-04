import UIKit
import RxCocoa
import RxSwift
import Then

class BaseView: UIView {
  
  let disposeBag = DisposeBag()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    bindConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
    bindConstraints()
  }
  
  func setup() { }
  
  func bindConstraints() { }
}
