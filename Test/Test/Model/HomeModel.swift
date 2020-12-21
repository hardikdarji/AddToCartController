//
//  HomeModel.swift
//  Test
//
//  Created by Hardik Darji on 21/12/20.
//

import Foundation
struct SubCategory
{
    var subCategoryName: String?
    var qty: Int?

    init(name: String?) {
        self.subCategoryName = name
    }
}

struct Category
{
    var categoryName: String?
    var arrSubCategory: [SubCategory]?
    init() {
    }
}
