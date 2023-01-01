//
//  BestActorTableViewCell.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 10/11/2022.
//

import UIKit

class BestActorTableViewCell: UITableViewCell {
    @IBOutlet weak var lblMoreActor: UILabel!
    @IBOutlet weak var lblBestActor: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblMoreActor.underlineText(text: "MORE ACTORS")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerForCell(identifier: BestActorCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BestActorTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(identifier: BestActorCollectionViewCell.identifier, indexPath: indexPath) as BestActorCollectionViewCell
        cell.delegate = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 20, height: collectionView.frame.height)
    }
    
}

extension BestActorTableViewCell : ActorActionDelegate {
    func onTapFavorite(isFavorite: Bool) {
        print("\(isFavorite)")
    }
    
    
}
