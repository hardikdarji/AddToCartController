//
//  HomeVC.swift
//  Test
//
//  Created by Hardik Darji on 21/12/20.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: CONST
    let maxQty:Int = 20
    let minQty:Int = 0
    
    //MARK: VAR DECLARATION
    @IBOutlet var tableViewHome: TQTableView!
    var arrCategory = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonAddTouched(_ sender: UIButton)
    {
        var category = Category()
        category.categoryName = "Header \(String(self.arrCategory.count + 1))"
        category.arrSubCategory = [SubCategory]()
        self.arrCategory.append(category)
        self.tableViewHome.reloadData()
    }
    
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentity.Header.Name) as? HeaderView
        {
            header.labelHeader.text = arrCategory[section].categoryName ?? ""
            header.buttonAdd.tag = section
            
            header.addTouchCompletion = { button in
                //ADD OPERATOIN HERE
                let row = self.arrCategory[button.tag].arrSubCategory?.count ?? 0
                let objSubCategory = SubCategory(name: "Cell \(row + 1)")
                self.arrCategory[section].arrSubCategory?.append(objSubCategory)

                let indexPath = IndexPath(row: row, section: section)
                self.tableViewHome.insertRows(at: [indexPath], with: .automatic)
            }
            return header
        }
        return nil
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arrCategory.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrCategory[section].arrSubCategory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentity.SubHeader.Name, for: indexPath) as? SubHeaderCell
        {
            if let obj = self.arrCategory[indexPath.section].arrSubCategory?[indexPath.row]
            {
                //SET VALUES
                cell.labelTitel.text = obj.subCategoryName ?? ""
                cell.textFieldQty.text = "\(String(obj.qty ?? 0))"
                
                //HANDLE COMPLETION BLOCK OF ACTION
                cell.textChangeCompletion = { textField, index in
                    if let val = textField.text,
                        let row = index?.row,
                        let section = index?.section
                    {
                        
                        if let qty = Int(val),
                            self.validate(val: qty, showError: true)
                        {
                            self.arrCategory[section].arrSubCategory?[row].qty = qty
                        }
                        
                        //RELOAD VALUE
                        if let ip = index
                        {
                            self.tableViewHome.reloadRows(at: [ip], with: .automatic)
                        }
                    }
                }
                
                cell.actionCompletion = { index, action in
                    if  let row = index?.row,
                        let section = index?.section
                    {
                        var val = self.arrCategory[section].arrSubCategory?[row].qty ?? 0
                        if action == .Plus
                        {
                            val = val + 1
                        }
                        else
                        {
                            val = val - 1
                        }
                        
                        if self.validate(val: val)
                        {
                            self.arrCategory[section].arrSubCategory?[row].qty = val
                        }
                        
                        //RELOAD VALUE
                        if let ip = index
                        {
                            self.tableViewHome.reloadRows(at: [ip], with: .automatic)
                        }
                    }
                }
               
                return cell
            }
            
        }
        return UITableViewCell()
    }
    
    //MARK: VALIDAITONS
    func validate(val: Int, showError: Bool = false) -> Bool
    {
        if val > self.maxQty || val < self.minQty
        {
            if showError
            {
                //SHOW INVALID ALERT MESSAGE
                let alert = UIAlertController(title: "TQ Test", message: "Invalid Quantity", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok",
                                              style: .default,
                                              handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            return false
        }
        return true
    }
    
}

