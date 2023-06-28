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

        print("url")
        guard let url = type.url else {return}
        print(url)
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                print("success verildi")
                guard let data = data else {return}
                print("data unwrap edildi")
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                print("decode edildi")
                guard let decodedData else {return}
                print("veri çekildi")
                completion(.success(decodedData))
            case .failure(let error):
                print("veri çekilemedi")
                print(error)
                completion(.failure(.invalidData))
            }
        }
    }
    
}
