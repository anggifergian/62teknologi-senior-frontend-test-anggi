//
//  YelpService.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 03/05/23.
//

import Foundation
import Alamofire

class YelpService {
    
    static let shared: YelpService = YelpService()
    
    private let API_KEY = "amrs_Gxegw8NqDGyNrFvY7j-MpdYQ7k_HNCfdNevjEsAtpCwCqMtSIimRixxZ3XNvmBMk7zho4KC1LLZGpFih4T44m6VgKjKHYpjd_WZnZj6sEV01v4hv13cJT5SZHYx"
    private let BASE_URL = "https://api.yelp.com/v3"
    
    private init() { }
    
    func fetchBusinessByName(_: String, completion: @escaping (Result<[BusinessShort], Error>) -> Void) {
        let urlString = "\(BASE_URL)/businesses/search"
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer \(API_KEY)"]
        
        let parameters: Parameters = ["location": "New York City", "sort_by": "best_match", "limit": 20]
        
        AF.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .validate()
            .responseDecodable(of: BusinessResponse.self) { response in
                switch response.result {
                case .success(let resp):
                    completion(.success(resp.businesses))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
    
    func fetchBusinessDetail(id: String, completion: @escaping (Result<BusinessShort, Error>) -> Void) {
        let urlString = "\(BASE_URL)/businesses/\(id)"
        let headers: HTTPHeaders = ["Content-Type": "application/json", "Authorization": "Bearer \(API_KEY)"]
        
        AF.request(urlString, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: BusinessShort.self) { response in
                switch response.result {
                case .success(let resp):
                    completion(.success(resp))
                case .failure(let err):
                    completion(.failure(err))
                }
            }
    }
}
