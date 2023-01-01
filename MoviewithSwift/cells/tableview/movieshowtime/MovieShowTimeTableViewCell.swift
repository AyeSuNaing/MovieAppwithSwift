//
//  MovieShowTimeTableViewCell.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 09/11/2022.
//

import UIKit

class MovieShowTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var viewForBackground: UIView!
    @IBOutlet weak var lblSeeMore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewForBackground.layer.cornerRadius = 10
        lblSeeMore.underlineText(text: "SEE MORE")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
