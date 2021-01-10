import UIKit

class HistoryCell: BaseTableViewCell {
  
  static let registerId = "\(HistoryCell.self)"
  
  let dateLabel = UILabel().then {
    $0.text = "2020. 09.30"
    $0.font = UIFont(name: "koverwatch", size: 20)
    $0.textColor = .white
  }
  
  let modeImage1 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let modeImage2 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let modeImage3 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let modeImage4 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let modeImage5 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let modeImage6 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  let modeImage7 = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleAspectFill
  }
  
  
  override func setup() {
    backgroundColor = .clear
    selectionStyle = .none
    addSubViews(
      dateLabel, modeImage1, modeImage2, modeImage3, modeImage4,
      modeImage5, modeImage6, modeImage7
    )
  }
  
  override func bindConstraints() {
    self.dateLabel.snp.makeConstraints { make in
      make.left.equalToSuperview().offset(24)
      make.top.equalToSuperview().offset(40)
    }
    
    self.modeImage1.snp.makeConstraints { make in
      make.left.equalTo(self.dateLabel)
      make.top.equalToSuperview().offset(70)
      make.width.equalTo(40)
      make.height.equalTo(28)
      make.bottom.equalToSuperview().offset(-16)
    }
    
    self.modeImage2.snp.makeConstraints { make in
      make.centerY.equalTo(self.modeImage1)
      make.left.equalTo(self.modeImage1.snp.right).offset(8)
      make.width.equalTo(40)
      make.height.equalTo(28)
    }
    
    self.modeImage3.snp.makeConstraints { make in
      make.centerY.equalTo(self.modeImage1)
      make.left.equalTo(self.modeImage2.snp.right).offset(8)
      make.width.equalTo(40)
      make.height.equalTo(28)
    }
    
    self.modeImage4.snp.makeConstraints { make in
      make.centerY.equalTo(self.modeImage1)
      make.left.equalTo(self.modeImage3.snp.right).offset(8)
      make.width.equalTo(40)
      make.height.equalTo(28)
    }
    
    self.modeImage5.snp.makeConstraints { make in
      make.centerY.equalTo(self.modeImage1)
      make.left.equalTo(self.modeImage4.snp.right).offset(8)
      make.width.equalTo(40)
      make.height.equalTo(28)
    }
    
    self.modeImage6.snp.makeConstraints { make in
      make.centerY.equalTo(self.modeImage1)
      make.left.equalTo(self.modeImage5.snp.right).offset(8)
      make.width.equalTo(40)
      make.height.equalTo(28)
    }
    
    self.modeImage7.snp.makeConstraints { make in
      make.centerY.equalTo(self.modeImage1)
      make.left.equalTo(self.modeImage6.snp.right).offset(8)
      make.width.equalTo(40)
      make.height.equalTo(28)
    }
  }
  
  func bind(arcade: Arcade){
    self.dateLabel.text = DateUtils.getDateFromString(dateString: arcade.created_at)
    self.modeImage1.setImage(urlString: arcade.modes.tile_1.image)
    self.modeImage2.setImage(urlString: arcade.modes.tile_2.image)
    self.modeImage3.setImage(urlString: arcade.modes.tile_3.image)
    self.modeImage4.setImage(urlString: arcade.modes.tile_4.image)
    self.modeImage5.setImage(urlString: arcade.modes.tile_5.image)
    self.modeImage6.setImage(urlString: arcade.modes.tile_6.image)
    self.modeImage7.setImage(urlString: arcade.modes.tile_7.image)
  }
}
