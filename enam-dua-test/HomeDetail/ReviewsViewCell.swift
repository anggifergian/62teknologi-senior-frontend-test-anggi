//
//  ReviewsViewCell.swift
//  enam-dua-test
//
//  Created by Anggi Fergian on 05/05/23.
//

import UIKit

class ReviewsViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var reviewDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup() {
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true
    }
}

extension UIImageView {
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
