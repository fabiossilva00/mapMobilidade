//
//  RxAPI2.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 11/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct UniversityModel: Codable {
    let name: String
    let webPages: [String]?
    let country: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case webPages = "web_pages"
        case country
    }
    
}

public enum RequestType: String {
    case GET, POST
    
}

protocol APIRequest {
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String: String] { get }
    
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard  var  components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
}

class UniversityRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = [String : String]()
    
    init(name: String) {
        parameters["name"] = name
    }
    
}

class APIClient {
    private let baseURL = URL(string: "http://universities.hipolabs.com/")
    
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create({ observer in
          let request = apiRequest.request(with: self.baseURL!)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
                
            })
            task.resume()
            return Disposables.create {
                task.cancel()
            }
            
        })
        
    }
    
}

