//
//  MovieDetailViewController.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 11/11/2022.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var actorCollectionView: UICollectionView!
    @IBOutlet weak var btnRateMovie: UIButton!
    
    @IBOutlet weak var creatorCollectionView: UICollectionView!
    @IBOutlet weak var ivBack: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initGestureRecognization()
        btnRateMovie.layer.borderColor =  #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8901960784, alpha: 1)
        btnRateMovie.layer.borderWidth = 1
        btnRateMovie.layer.cornerRadius = 20
        actorCollectionView.delegate = self
        actorCollectionView.dataSource = self
        actorCollectionView.registerForCell(identifier: BestActorCollectionViewCell.identifier)
        
        creatorCollectionView.dataSource = self
        creatorCollectionView.delegate = self
        creatorCollectionView.registerForCell(identifier: BestActorCollectionViewCell.identifier)
    }
    
    
    func initGestureRecognization () {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapBack))
        ivBack.isUserInteractionEnabled = true
        ivBack.addGestureRecognizer(tapRecognizer)
    
    }

    @objc func onTapBack() {
        self.dismiss(animated: false)
    }
}

extension MovieDetailViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

extension MovieDetailViewController : ActorActionDelegate {
    func onTapFavorite(isFavorite: Bool) {
        print("\(isFavorite)")
    }
    
    
}

