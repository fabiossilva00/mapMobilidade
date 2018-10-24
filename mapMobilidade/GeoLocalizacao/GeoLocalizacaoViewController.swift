//
//  GeoLocalizacaoViewController.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 11/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreLocation

//private extension Reactive where Base: UILabel {
//    var coordinates: Binder<CLLocationCoordinate2D> {
//        return Binder(base) { label, location in
//            print("Lat: \(location.latitude)\nLon: \(location.longitude)")
//        }
//    }
//}

class GeoLocalizacaoViewController: UIViewController {
    
    @IBOutlet var habilitaGPS: UIView!
    @IBOutlet weak var configuracoesButton: UIButton!
    @IBOutlet weak var geoLocalizacao: UIButton!
    @IBOutlet weak var coordenadaLabel: UILabel!
    
    let geoLocalicationService = GeolocationService.instance
    var disposeBag = DisposeBag()
    
    private func acaoConfiguracoes() {
        UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        
    }
    
    private func pegaGPS() {
        geoLocalizacao.rx.tap
            .bind {
//                self.geoLocalicationService.location
//                    .drive(onNext: { (location) in
//                        print("Lat: \(location.latitude)\nLon: \(location.longitude)")
//                        self.coordenadaLabel.text = "Lat: \(location.latitude)\nLon: \(location.longitude)"
//                    })
//                    .disposed(by: self.disposeBag)
            }
            .disposed(by: disposeBag)
    }
    
    
    func verificaGPS() {
        
        geoLocalicationService.authorized
            .drive(habilitaGPS.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    func tapConfiguracoes() {
        configuracoesButton.rx.tap
            .bind {
                self.acaoConfiguracoes()
            }
            .disposed(by: disposeBag)
    }
    
    func atualizaTela(){
        view.addSubview(habilitaGPS)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        atualizaTela()
        verificaGPS()
        
        tapConfiguracoes()
        pegaGPS()
        
        self.geoLocalicationService.location
            .drive(onNext: { (location) in
                print("Lat: \(location.latitude)\nLon: \(location.longitude)")
                self.coordenadaLabel.text = "Lat: \(location.latitude)\nLon: \(location.longitude)"
            })
            .disposed(by: self.disposeBag)
        
        // Do any additional setup after loading the view.
    } 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
