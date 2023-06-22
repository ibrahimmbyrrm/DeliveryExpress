//
//  NetworkManager.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func fetchData<T: Decodable>(type : EndPointItems<T>,completion : @escaping(Result<T,httpError>)->Void) {
        print("url")
        guard let url = type.url else {return}
        print(url)
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                print(decodedData)
                guard let decodedData else {return}
                completion(.success(decodedData))
            case .failure(let error):
                print(error)
                completion(.failure(.invalidData))
            }
        }
    }
    
}
