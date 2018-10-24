//
//  RxSwift.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 10/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RxSwiftTeste {
    
    func observableRx() {
        
//        let hellpSequence = Observable.just("Hello Rx")
//        let ficonacciSequence = Observable.from([0,1,2,3,4,5,6,7,8,9])
//        let dictSequence = Observable.from([1: "Hello", 2: "World"])
//
//        let observeHello = Observable.of(hellpSequence)
//        let subscription = ficonacciSequence.subscribe { (event) in
//            switch event {
//            case .next(let value):
//                print(value)
//            case .error(let error):
//                print(error)
//            case .completed:
//                print("completed")
//
//            }
//        }
        
        let bag = DisposeBag()
        
        let observable = Observable.from([0,1,2,3,5,8])
        
//        let subscription = observable.subscribe(onNext: {
//            print($0)
//        })
//        subscription.disposed(by: bag)
        
        let justError = observable.subscribe(onNext: {
            print($0)
        }, onError: {
            print($0)
        })
        justError.disposed(by: bag)
        
    }
    
    
}
