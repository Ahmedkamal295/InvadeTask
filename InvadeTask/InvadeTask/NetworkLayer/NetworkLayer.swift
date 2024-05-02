//
//  NetworkLayer.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}
// Define custom error type
enum NetworkError: Error {
    case noData
}

class RetryHandler: RequestInterceptor {
    let maxRetry = 3
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        request.retryCount < maxRetry ?  completion(.retry) : completion(.doNotRetry)
    }
}

class NetworkLayer {
    
    //MARK: - variables
    private init() {}
    static let instance = NetworkLayer()
    
    func fetchData<T: Codable>(method: HTTPMethod, url: String, parameters: Parameters, headers: HTTPHeaders?, completion: @escaping (Result<T>) -> ()) {
        print(url)
        //MARK: -  headers
        let finalHeaders: HTTPHeaders? = headers
        
        //MARK: -  method
        var encoder: ParameterEncoding!
        switch method {
        case .get:
            encoder = URLEncoding.default
        default:
            encoder = JSONEncoding.prettyPrinted
        }
        
        //MARK: - request
        AF.request(url, method: method, parameters: parameters, encoding: encoder, headers: finalHeaders, interceptor: RetryHandler()).responseData { response in
            switch response.result {
            // success request
            case .success( _):
                guard let data = response.data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                do {
                    let myModel = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(myModel))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
                
            // failure request
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}

