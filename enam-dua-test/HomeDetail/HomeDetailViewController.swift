//
//  HomeDetailViewController.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 04/05/23.
//

import UIKit
import SDWebImage

class HomeDetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var businessId: String = ""
    var business: BusinessShort?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = ""
        categoryLabel.text = ""
        ratingLabel.text = ""
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        
        loadBusinessDetail()
    }
    
    func loadBusinessDetail() {
        YelpService.shared.fetchBusinessDetail(id: businessId) { result in
            switch result {
            case .success(let data):
                self.business = data
                self.collectionView.reloadData()
                self.headingLabel.text = data.name
                
                var categotiesLabel = ""
                for i in 0..<data.categories.count {
                    if i == data.categories.count - 1 {
                        categotiesLabel += "\(data.categories[i].title)"
                    } else {
                        categotiesLabel += "\(data.categories[i].title), "
                    }
                }
                self.categoryLabel.text = categotiesLabel
                self.ratingLabel.text = "\(data.rating)/5 • \(data.reviewCount) reviews"
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return business?.photos.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detail_collection_view", for: indexPath) as! DetailCollectionViewCell
        
        if let image = business?.photos[indexPath.row] {
            cell.thumbImage.sd_setImage(with: URL(string: image))
        } else {
            cell.thumbImage.image = nil
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 256)
    }
}
