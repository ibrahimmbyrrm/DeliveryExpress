//
//  NetworkManager.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import Alamofire

protocol NetworkService {
    func fetchData<T: Decodable>(type : EndPointItems<T>,completion : @escaping(Result<T,httpError>)->Void)
}

class NetworkManager : NetworkService{
    
    //Singleton
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData<T: Decodable>(type : EndPointItems<T>,completion : @escaping(Result<T,httpError>)->Void) {
        guard let url = type.url else {return}
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                guard let decodedData else {return}
                completion(.success(decodedData))
            case .failure(let error):
                print(error)
                completion(.failure(.invalidData))
            }
        }
    }
    
}
