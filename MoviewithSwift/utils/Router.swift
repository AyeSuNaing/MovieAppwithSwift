//
//  Router.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 11/11/2022.
//

import Foundation
import UIKit

enum StoryboardName : String {
case Main = "Main"
}

extension UIStoryboard {
    static func mainStoryboard () -> UIStoryboard {
        UIStoryboard(name: StoryboardName.Main.rawValue, bundle: nil)
    }
}

extension UIViewController {
    func navigateToMovieDetailViewController () {
        guard let vc = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: MovieDetailViewController.identifier) as? MovieDetailViewController else { return  }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
