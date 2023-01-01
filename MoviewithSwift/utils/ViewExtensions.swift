//
//  ViewExtension.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 10/11/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    func underlineText (text :String)  {
        let attributedString = NSMutableAttributedString.init(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
}

extension UIViewController {
    
    static var identifier: String{
        String(describing: self)
    }
}


extension UITableViewCell {
    
    static var identifier: String{
        String(describing: self)
    }
}

extension UICollectionViewCell {
    static var identifier: String{
        String(describing: self)
    }
}

extension UITableView {
    func registerForCell ( identifier : String ) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeCell <T : UITableViewCell>( identifier : String, indexPath : IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
        else {
            return UITableViewCell() as! T
            
        }
        return cell
    }
}

extension UICollectionView {
    func registerForCell ( identifier : String ) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func dequeCell <T : UICollectionViewCell>( identifier : String, indexPath : IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else { return UICollectionViewCell() as! T  }
        return cell
    }
}

