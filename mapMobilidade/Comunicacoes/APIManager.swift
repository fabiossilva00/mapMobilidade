//
//  APIManager.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 10/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    static let sharedInstante: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        
        return SessionManager(configuration: configuration)
    }()
    
}
