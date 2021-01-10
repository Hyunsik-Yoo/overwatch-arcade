import FirebaseFirestore
import Alamofire
import RxSwift


protocol OverwatchServiceProtocol {
  func fetchArcade() -> Observable<Arcade>
  func fetchArcadeHistory() -> Observable<[Arcade]>
}

struct OverwatchService: OverwatchServiceProtocol {
  
  func fetchArcade() -> Observable<Arcade> {
    return Observable.create { observer -> Disposable in
      let urlString = "https://overwatcharcade.today/api/overwatch/today"
      
      AF.request(urlString, method: .get).responseJSON { response in
        if let value = response.value {
          let arcade: Arcade = JsonUtils.toJson(object: value)!
          
          observer.onNext(arcade)
          observer.onCompleted()
        }
        else {
          let error = CommonError(desc: "value is nil")
          
          observer.onError(error)
        }
      }
      
      return Disposables.create()
    }
  }
  
  func fetchArcadeHistory() -> Observable<[Arcade]> {
    return Observable.create { observer -> Disposable in
      Firestore.firestore().collection("arcade").getDocuments { (document, error) in
        if let error = error {
          let error = CommonError(desc: error.localizedDescription)

          observer.onError(error)
        } else {
          if let document = document {

            var arcades: [Arcade] = []
            for data in document.documents {
              let arcade = Arcade(map: data.data())

              arcades.append(arcade)
            }

            observer.onNext(arcades)
            observer.onCompleted()
          }
        }
      }
      
      return Disposables.create()
    }
  }
}
