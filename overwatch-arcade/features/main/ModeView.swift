import UIKit
import Kingfisher

class ModeView: BaseView {
  
  let modeImage = UIImageView().then {
    $0.isSkeletonable = true
    $0.backgroundColor = .gray
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .top
  }
  
  let typeContainerView = UIView().then {
    $0.layer.cornerRadius = 10
    $0.layer.masksToBounds = true
    $0.backgroundColor = UIColor(r: 249, g: 95, b: 95)
  }
  
  let typeLabel = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont(name: "koverwatch", size: 12)
  }
  
  let nameLabel = UILabel().then {
    $0.isSkeletonable = true
    $0.linesCornerRadius = 3
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = UIFont(name: "koverwatch", size: 20)
  }
  
  override func setup() {
    self.isSkeletonable = true
    backgroundColor = .clear
    addSubViews(modeImage, typeContainerView, typeLabel, nameLabel)
  }
  
  override func bindConstraints() {
    self.modeImage.snp.makeConstraints { make in
      make.left.top.right.equalToSuperview()
      make.height.equalTo(104)
    }
    
    self.typeLabel.snp.makeConstraints { make in
      make.left.equalTo(self.modeImage).offset(14)
      make.centerY.equalTo(self.modeImage.snp.bottom)
    }
    
    self.nameLabel.snp.makeConstraints { make in
      make.left.equalTo(self.modeImage).offset(4)
      make.right.equalTo(self.modeImage)
      make.top.equalTo(self.typeLabel.snp.bottom).offset(12)
    }
    
    self.snp.makeConstraints { make in
      make.left.right.top.equalTo(self.modeImage)
      make.bottom.equalTo(self.nameLabel)
    }
    
    self.typeContainerView.snp.makeConstraints { make in
      make.left.equalTo(self.typeLabel).offset(-10)
      make.top.equalTo(self.typeLabel).offset(-4)
      make.bottom.equalTo(self.typeLabel).offset(4)
      make.right.equalTo(self.typeLabel).offset(10)
    }
  }
  
  func bind(mode: Mode) {
    self.setImage(url: mode.image)
    self.typeLabel.text = mode.players
    self.nameLabel.text = mode.name
  }
  
  private func setImage(url: String) {
    guard let url = URL(string: url) else { return }
    KingfisherManager.shared.retrieveImage(with: url) { result in
      switch result {
      case .success(let imageResult):
        let newSize = self.resizeImageByWidth(image: imageResult.image, newWidth: self.bounds.width)
        
        self.modeImage.image = imageResult.image.resize(targetSize: newSize)
        
      case .failure( _):
        break
      }
      self.stopSkeletonAnimation()
    }
  }
  
  private func resizeImageByWidth(image: UIImage, newWidth: CGFloat) -> CGSize {
    let scale = newWidth / image.size.width
    let newHeight = image.size.height * scale
    
    return CGSize(width: newWidth, height: newHeight)
  }
}
