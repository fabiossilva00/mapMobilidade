//
//  TableRxViewController.swift
//  mapMobilidade
//
//  Created by Fabio Sousa da Silva on 10/10/2018.
//  Copyright © 2018 Fabio Sousa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableRxViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar}

    var viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    func atualizaTela(){
        viewModel.data
            .drive(tableView.rx.items(cellIdentifier: "cell")) { _, repository, cell in
                cell.textLabel?.text = repository.repoName
                cell.detailTextLabel?.text = repository.repoURL
        }
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.data.asDriver()
            .map { "\($0.count) Repositories" }
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atualizaTela()
        configureSearchController()
        
        // Do any additional setup after loading the view.
    }
    
    
    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = "NavdeepSinghh"
        searchBar.placeholder = "Enter GitHub ID, e.g., \"NavdeepSinghh\""
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
    }

}
