//
//  GenreCollectionViewCell.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 09/11/2022.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewOverlay: UIView!
    @IBOutlet weak var lblGenre: UILabel!
    var onTapItem : ((String) -> Void) = {_ in}
    var data : GenreVo? = nil {
        didSet {
            if let genre = data {
                lblGenre.text = genre.name
                ( genre.isSelected ) ? (viewOverlay.isHidden = false) : (viewOverlay.isHidden = true)
            }
           
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureForItem = UITapGestureRecognizer(target: self, action: #selector(didTapItem))
        lblGenre.isUserInteractionEnabled = true
        lblGenre.addGestureRecognizer(tapGestureForItem)
    }
    
    @objc func didTapItem () {
        onTapItem(data?.name ?? "")
    }

}
