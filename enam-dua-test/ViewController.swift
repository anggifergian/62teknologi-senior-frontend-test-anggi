//
//  ViewController.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 25/04/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadListBusiness()
    }
    
    // MARK: - Helpers
    func loadListBusiness() {
        YelpService.shared.fetchBusinessByName("") { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

