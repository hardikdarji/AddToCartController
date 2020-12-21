//
//  Helper.swift
//  Test
//
//  Created by Hardik Darji on 21/12/20.
//

import UIKit
//MARK: ENUM CELL IDENTITY
enum CellIdentity: String
{
    case Header =     "HeaderView",
         SubHeader =  "SubHeaderCell"

    var Name: String { return self.rawValue}

}
enum OperationAction
{
    case Plus, Minus
}


//MARK: EXTENSIONS..
extension UITableViewCell {
    var tableView: UITableView? {
        var view = superview
        while let v = view, v.isKind(of: UITableView.self) == false {
            view = v.superview
        }
        return view as? UITableView
    }
}
