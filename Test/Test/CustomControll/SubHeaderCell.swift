//
//  SubHeaderCell.swift
//  Test
//
//  Created by Hardik Darji on 21/12/20.

import UIKit

class SubHeaderCell: BaseTableViewCell {

    @IBOutlet var labelTitel: UILabel!
    @IBOutlet var textFieldQty: UITextField!
    @IBOutlet var buttonPlus: UIButton!
    @IBOutlet var buttonMinus: UIButton!

    var textChangeCompletion: ((_ textField: UITextField,_ indexPath: IndexPath?) -> Void)?
    var actionCompletion: ((_ indexPath: IndexPath?, _ action: OperationAction) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.labelTitel.font = .systemFont(ofSize: 16.0, weight: .medium)
        self.labelTitel.textColor = .darkGray
    }

    @IBAction func buttonPlusTouched(_ sender: UIButton)
    {
        if let completion = actionCompletion
        {
            completion( self.tableView?.indexPath(for: self), .Plus)
        }
    }
    @IBAction func buttonMinusTouched(_ sender: UIButton)
    {
        if let completion = actionCompletion
        {
            completion( self.tableView?.indexPath(for: self), .Minus)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension SubHeaderCell: UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let completion = textChangeCompletion
        {
            completion(textField, self.tableView?.indexPath(for: self))
        }
    }
}
