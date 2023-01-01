//
//  GenreVo.swift
//  MoviewithSwift
//
//  Created by AyeSuNaing on 09/11/2022.
//

import Foundation

class GenreVo {
    var name = "Action"
    var isSelected = false
    
    init(name: String = "Action", isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
}
