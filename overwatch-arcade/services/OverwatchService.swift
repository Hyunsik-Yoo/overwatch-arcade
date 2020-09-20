import Combine
import Alamofire

protocol OverwatchServiceProtocol {
  func getArcade() -> AnyPublisher<Arcade, Error>
}

struct OverwatchService: OverwatchServiceProtocol {
  
  func getArcade() -> AnyPublisher<Arcade, Error> {
    return Future { promise in
      let urlString = "https://overwatcharcade.today/api/overwatch/today"

      Alamofire.request(urlString, method: .get).responseJSON { response in
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
}
