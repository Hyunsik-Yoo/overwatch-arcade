import Combine
import FirebaseFirestore
import Alamofire
import RxSwift


protocol OverwatchServiceProtocol {
  func fetchArcade() -> Observable<Arcade>
  func getArcade() -> AnyPublisher<Arcade, Error>
  func getArcadeHistory() -> AnyPublisher<[Arcade], Error>
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
  
  func getArcade() -> AnyPublisher<Arcade, Error> {
    return Future { promise in
      let urlString = "https://overwatcharcade.today/api/overwatch/today"

      AF.request(urlString, method: .get).responseJSON { response in
        if let value = response.value {
          let arcade: Arcade = JsonUtils.toJson(object: value)!
          
          promise(.success(arcade))
        }
        else {
          let error = CommonError(desc: "value is nil")
          
          promise(.failure(error))
        }
      }
    }.eraseToAnyPublisher()
  }
  
  func getArcadeHistory() -> AnyPublisher<[Arcade], Error> {
    return Future { promise in
      Firestore.firestore().collection("arcade").getDocuments { (document, error) in
        if let error = error {
          let error = CommonError(desc: error.localizedDescription)

          promise(.failure(error))
        } else {
          if let document = document {

            var arcades: [Arcade] = []
            for data in document.documents {
              let arcade = Arcade(map: data.data())

              arcades.append(arcade)
            }

            promise(.success(arcades))
          }
        }
      }
    }.eraseToAnyPublisher()
  }
}
