//
//  NetworkManager.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/11.
//

import Foundation
import Moya
import Alamofire
class NetworkManager {
    static let shared = NetworkManager()
    func fetchVistorLoginModel(completionHandler: @escaping (VisitorLoginModel) -> ()) {
        
        let provider = MoyaProvider<AccountService>()
        provider.request(.visitorLogin(uuid: "1233333", user_type: "iOS")) { result in
            switch result {
            case let .success(response):
                do{
                    let data = response.data
                    let resultOfFetch = try JSONDecoder().decode(VisitorLoginModel.self, from: data )
                    completionHandler(resultOfFetch)
                } catch let error{
                    print(error)
                }
                
                print("succeed")
                break
            case let .failure(error):
                print(error)
                break
            }
        }
    }
}
