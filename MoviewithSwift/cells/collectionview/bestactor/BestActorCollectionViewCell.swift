//
//  BestActorCollectionViewCell.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 10/11/2022.
//

import UIKit

class BestActorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ivHeart: UIImageView!
    @IBOutlet weak var ivHeartFill: UIImageView!
    var delegate : ActorActionDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initGestureRecognizers()
    }
    
    private func initGestureRecognizers () {
        let tapGuestForFavorite = UITapGestureRecognizer(target: self, action: #selector(onTapFavorite))
        ivHeartFill.isUserInteractionEnabled = true
        ivHeartFill.addGestureRecognizer(tapGuestForFavorite)
        
        let tapGuestForUnFavorite = UITapGestureRecognizer(target: self, action: #selector(onTapUnFavorite))
        ivHeart.isUserInteractionEnabled = true
        ivHeart.addGestureRecognizer(tapGuestForUnFavorite)
        
        
        
    }
    
    @objc func onTapFavorite () {
        ivHeartFill.isHidden = true
        ivHeart.isHidden = false
        delegate?.onTapFavorite(isFavorite: true)
    }
    
    @objc func onTapUnFavorite () {
        ivHeartFill.isHidden = false
        ivHeart.isHidden = true
        delegate?.onTapFavorite(isFavorite: false)
    }

}
