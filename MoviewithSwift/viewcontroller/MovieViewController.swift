//
//  MovieViewController.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 02/11/2022.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivMenu: NSLayoutConstraint!
    @IBOutlet weak var ivSearch: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var sectionsList : [MovieSections] = MovieSections.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    

    func tableViewSetup () {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerForCell(identifier: MovieSliderTableViewCell.identifier)
        tableView.registerForCell(identifier: PopularFlimTableViewCell.identifier)
        tableView.registerForCell(identifier:  MovieShowTimeTableViewCell.identifier)
        tableView.registerForCell(identifier: GenreTableViewCell.identifier)
        tableView.registerForCell(identifier: ShowCaseTableViewCell.identifier)
        tableView.registerForCell(identifier: BestActorTableViewCell.identifier)
        
    }
}

extension MovieViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = sectionsList[section]
        switch currentSection {
        default :
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentSection = sectionsList[indexPath.section]
        switch currentSection {
        
        case .SLIDER:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieSliderTableViewCell.identifier, for: indexPath) as! MovieSliderTableViewCell
            cell.delegate = self
            return cell
        case .POPULAR_FLIM:
            let cell = tableView.dequeCell(identifier: PopularFlimTableViewCell.identifier, indexPath: indexPath) as! PopularFlimTableViewCell
            cell.delegate = self
            return cell
        case .SHOW_TIME:
            let cell = tableView.dequeCell(identifier: MovieShowTimeTableViewCell.identifier, indexPath: indexPath)
            return cell
        case .GENRE:
            let cell = tableView.dequeCell(identifier: GenreTableViewCell.identifier, indexPath: indexPath) as! GenreTableViewCell
            cell.delegate = self
            return cell
        case .SHOW_CASE:
            let cell = tableView.dequeCell(identifier: ShowCaseTableViewCell.identifier, indexPath: indexPath)
            return cell
        case .BEST_ACTOR:
            let cell = tableView.dequeCell(identifier: BestActorTableViewCell.identifier, indexPath: indexPath)
            return cell
        }
    }
}


extension MovieViewController : MovieItemDelegate {
    func onTapMovie() {
        print("Clicked Movie Item")
        navigateToMovieDetailViewController()
    }
    
    
}
