//
//  HomeViewCell.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 03/05/23.
//

import UIKit

protocol HomeViewCellDelegate: AnyObject {
    func homeViewCellTapped(_ cell: HomeViewCell)
}

class HomeViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCellView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    weak var delegate: HomeViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup() {
        imageCellView.layer.cornerRadius = 8
        imageCellView.layer.masksToBounds = true
    }

    
    @IBOutlet weak var cellTapped: UIView!
}
