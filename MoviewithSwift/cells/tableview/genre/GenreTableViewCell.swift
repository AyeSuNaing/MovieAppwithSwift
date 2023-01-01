//
//  GenreTableViewCell.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 09/11/2022.
//

import UIKit

class GenreTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionViewMovie: UICollectionView!
    @IBOutlet weak var collectionViewGenre: UICollectionView!
    var delegate : MovieItemDelegate? = nil
    
    let genreList = [GenreVo(name: "Action", isSelected: true), GenreVo(name: "Drama", isSelected: false), GenreVo(name: "Adventure", isSelected: false), GenreVo(name: "Biography", isSelected: false), GenreVo(name: "Horor", isSelected: false)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewGenre.delegate = self
        collectionViewGenre.dataSource = self
        collectionViewGenre.registerForCell(identifier: GenreCollectionViewCell.identifier)
        
        collectionViewMovie.delegate = self
        collectionViewMovie.dataSource = self
        collectionViewMovie.registerForCell(identifier: PopularFlimCollectionViewCell.identifier)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GenreTableViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewMovie {
            return 10
        }
        return genreList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewMovie {
            let cell = collectionView.dequeCell(identifier: PopularFlimCollectionViewCell.identifier, indexPath: indexPath) as PopularFlimCollectionViewCell
            return cell
            
        } else {
            let cell = collectionView.dequeCell(identifier: GenreCollectionViewCell.identifier, indexPath: indexPath) as GenreCollectionViewCell

            cell.data = genreList[indexPath.row]
            cell.onTapItem = { genreName in
                self.genreList.forEach{ (genre) in
                    if genre.name == genreName {
                        genre.isSelected = true
                    } else {
                        genre.isSelected = false

                    }
                }
                self.collectionViewGenre.reloadData()
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionViewMovie {
            delegate?.onTapMovie()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewGenre {
            return CGSize(width: widthofString(text: genreList[indexPath.row].name, font: UIFont(name: "Geeza Pro", size: 16) ?? UIFont.systemFont(ofSize: 16)), height: 44)
        } else  {
           return CGSize(width: ( collectionView.frame.width / 2 ) - 50 , height: 280)
        }
        
    }
    
    func widthofString (text : String, font : UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font : font]
        let textSize = text.size(withAttributes: fontAttributes)
        return textSize.width + 30
    }
}
