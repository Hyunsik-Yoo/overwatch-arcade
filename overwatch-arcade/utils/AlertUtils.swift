import UIKit

struct AlertUtils {
  
  static func showWithAction(
    controller: UIViewController,
    title: String? = nil,
    message: String? = nil,
    onTapOk: @escaping (() -> Void)
  ) {
    let okAction = UIAlertAction(title: "확인", style: .default) { action in
      onTapOk()
    }
    
    show(controller: controller, title: title, message: message, [okAction])
  }
  
  static func showWithCancel(
    controller: UIViewController,
    title: String? = nil,
    message: String? = nil,
    onTapOk: @escaping () -> Void
  ) {
    let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
      onTapOk()
    }
    let cancelAction = UIAlertAction(title: "취소", style: .cancel)
    
    show(controller: controller, title: title, message: message, [okAction, cancelAction])
  }
  
  static func show(
    controller: UIViewController,
    title: String?,
    message: String?
  ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "확인", style: .default)
    
    alertController.addAction(okAction)
    controller.present(alertController, animated: true)
  }
  
  static func show(
    controller: UIViewController,
    title: String?,
    message: String?,
    _ actions: [UIAlertAction]
  ) {
    let alrtController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    for action in actions {
      alrtController.addAction(action)
    }
    controller.present(alrtController, animated: true)
  }
}


