//
//  TQTableView.swift
//  Test
//
//  Created by Hardik Darji on 21/12/20.
//

import UIKit

class TQTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    private func commonInit()
    {
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.keyboardDismissMode = .onDrag
        //REGISTAR CELL HERE..
        self.register(UINib(nibName: CellIdentity.Header.Name, bundle: nil), forHeaderFooterViewReuseIdentifier: CellIdentity.Header.Name)
        self.register(UINib(nibName: CellIdentity.SubHeader.Name, bundle: nil), forCellReuseIdentifier: CellIdentity.SubHeader.Name)
    }
}
