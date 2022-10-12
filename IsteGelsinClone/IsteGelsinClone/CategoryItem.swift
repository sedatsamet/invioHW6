//
//  CategoryItem.swift
//  IsteGelsinClone
//
//  Created by Sedat Samet Oypan on 10.10.2022.
//

import Foundation

class CategoryItem {
    
    var categoryImageName:String?
    var categoryText:String?
    
    init(categoryImageName: String, categoryText: String) {
        self.categoryImageName = categoryImageName
        self.categoryText = categoryText
    }
}
