//
//  RxAPI.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 10/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa

// http://www.zazzi.com.br:3000/auth

//struct camposUser {
//    let loginToken: String
//    let email: String
//    let idUser: String
//    let nome: String
//    
//}

//class rxAPI {
//
//    func chamadaAPIRx() {
//
//        let json = ["email": "teste01@teste.com", "senha": "123456"]
//
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
//
//            var req = URLRequest(url: URL(string: "http://www.zazzi.com.br:3000/auth")!)
//            req.httpMethod = "POST"
//            req.httpBody = jsonData
//
//            let responseJSON = URLSession.shared.rx.json(request: req)
//                .retry(3)
//
//        } catch {
//            print(error.localizedDescription)
//        }
//
//    }
//
//    func parse(json: Any) -> [camposUser] {
//        guard let itens = json as? [String: Any] else { return [] }
//
//        var campos = [camposUser]()
//
//        itens.forEach({
//            guard   let loginToken = ["token"] as? String,
//                    let email = ["usuario"]["email"] as? String,
//                    let idUser = ["usuario"]["idUser"] as? String,
//                    let nome = ["usuario"]["nome"] as? String
//            else { return }
//
//            campos.append(camposUser(loginToken: loginToken, email: email, idUser: idUser, nome: nome))
//        })
//
//        return campos
//    }
//
//}
