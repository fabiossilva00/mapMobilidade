//
//  ViewController.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 10/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonGoogleAPI: UIButton!
    
    @IBAction func buttonGoogleAPI(_ sender: Any) {
        chamadaAPI()
        
    }
    
    func chamadaAPI() {
//        APIRequest.chamadaGoogle()
        
//        APIClient().send(apiRequest: <#T##APIRequest#>)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RxSwiftTeste().observableRx()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

