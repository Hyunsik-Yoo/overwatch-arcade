import RxSwift
import RxCocoa

class BaseViewModel {
  
  let disposeBag = DisposeBag()
  let showSystemAlert = PublishRelay<AlertContent>()
}
