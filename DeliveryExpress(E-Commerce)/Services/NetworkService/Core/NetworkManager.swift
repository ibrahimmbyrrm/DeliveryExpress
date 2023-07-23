//
//  NetworkManager.swift
//  DeliveryExpress(E-Commerce)
//
//  Created by İbrahim Bayram on 22.06.2023.
//

import Foundation
import Alamofire

protocol NetworkService {
    func fetchData<T: Decodable>(type : EndPointItems<T>,completion : @escaping(Result<T,NetworkError>)->Void)
}

class NetworkManager : NetworkService{
    //Singleton
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData<T: Decodable>(type : EndPointItems<T>,completion : @escaping(Result<T,NetworkError>)->Void) {
        
        guard let url = type.url else {
            completion(.failure(.invalidUrl))
            return
        }
        
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                }catch {
                    completion(.failure(.decodingError))
                }
            case .failure(let error):
                print(error)
                completion(.failure(.serverError))
            }
        }
    }
}

