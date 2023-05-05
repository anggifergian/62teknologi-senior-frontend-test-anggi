//
//  HomeViewController.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 04/05/23.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var businessList: [BusinessShort] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        fetchBusiness()
        
        title = ""
    }
    
    func fetchBusiness() {
        YelpService.shared.fetchBusinessByName("") { result in
            switch result {
            case .success(let data):
                self.businessList = data
                self.homeTableView.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }

}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "home_view_cell", for: indexPath) as! HomeViewCell
        
        let item = businessList[indexPath.row]
        
        cell.headingLabel.text  = item.name
        cell.ratingLabel.text   = "\(item.rating)/5 • \(item.reviewCount) reviews"
        
        var categotiesLabel = ""
        for i in 0..<item.categories.count {
            if i == item.categories.count - 1 {
                categotiesLabel += "\(item.categories[i].title)"
            } else {
                categotiesLabel += "\(item.categories[i].title), "
            }
        }
        cell.categoryLabel.text = categotiesLabel
        
        cell.imageCellView.sd_setImage(with: URL(string: item.imageUrl))
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeTableView.deselectRow(at: indexPath, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "home_detail") as! HomeDetailViewController
        
        let item = businessList[indexPath.row]
        vc.businessId   = item.id
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
