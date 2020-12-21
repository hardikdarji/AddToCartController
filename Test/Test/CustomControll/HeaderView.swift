//
//  HeaderView.swift
//  Test
//
//  Created by Hardik Darji on 21/12/20.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    @IBOutlet var labelHeader: UILabel!
    @IBOutlet var buttonAdd: UIButton!

    var addTouchCompletion: ((_ sender: UIButton) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.backgroundColor = #colorLiteral(red: 0.9434361742, green: 0.9434361742, blue: 0.9434361742, alpha: 1)

        self.labelHeader.font = .systemFont(ofSize: 18.0, weight: .medium)
        self.labelHeader.textColor = .black
    }
    @IBAction func buttonAddTouched(_ sender: UIButton)
    {
        if let completion = addTouchCompletion
        {
            completion(sender)
        }
    }
}
