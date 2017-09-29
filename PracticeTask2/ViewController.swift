//
//  ViewController.swift
//  PracticeTask2
//
//  Created by appinventiv on 28/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

     var categories = ["Region", "Country", "State", "City", "Age", "Gender", "Position", "Organization"]
    var continents = ["Asia", "Africa", "Australila", "Antarctica", "Europe", "North America", "South America"]
    var country = ["India", "pakistan", "USA"]
    var state = ["Up", "Mp", "Pinjab"]
     var city = ["Delhi", "Agra", "Chennai", "Hyderabad"]
     var age = ["2", "3", "4", "6", "56", "53", "5", "64", "34"]
     var gender = ["Male", "Female"]
     var position = ["Engineer", "Doctor"]
      var organization = ["HCl", "Google"]
    var teamRef = "continents"
    
    var filteredData: [String]!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var isClk = [String]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var subTableView: UITableView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var clearBtn: UIButton!
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    @IBAction func clearAllBtnTap(_ sender: UIButton) {
        
        for temp in 0..<continents.count {
            self.isClk.insert("uncheck", at: temp)
        self.subTableView.reloadData()
        
        
         }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        topView.layer.shadowColor = UIColor.gray.cgColor
        topView.layer.shadowOpacity = 1
        topView.layer.shadowOffset = CGSize.zero
        topView.layer.shadowRadius = 8
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
       
       
        let nibCell = UINib(nibName: "TableViewCell", bundle: nil)
        tableViewOutlet.register(nibCell, forCellReuseIdentifier: "TableViewCellId")
        
        let subNibCell = UINib(nibName: "SubTableViewCell", bundle: nil)
        subTableView.register(subNibCell, forCellReuseIdentifier: "SubTableViewCellId")
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        subTableView.delegate = self
        subTableView.dataSource = self
        
        searchBarOutlet.delegate = self
        
         filteredData = continents
        
        for temp in 0..<continents.count {
            self.isClk.insert("uncheck", at: temp)
       
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //====== custom cell========//////////
    func getCell(_ sender: UIButton) -> UITableViewCell {
        var cell: UIView = sender
        //----------jab tak cell superview nh milta-------- superview mil gaya
        while !(cell is SubTableViewCell) {
            if let super_view = cell.superview {
                cell = super_view
            } else {}
            
            
        }
        guard let tableCell = cell as? SubTableViewCell
            else
        {
            fatalError()
        }
        return tableCell
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var no = 0
        
        if tableView == self.tableViewOutlet {
            
            no = categories.count
            
        }
        
         if tableView == self.subTableView {
            
            if teamRef == "Region"
            {
            no =  self.continents.count
            }
          else  if teamRef == "Country"
            {
                no =  self.country.count
            }
            else  if teamRef == "State"
            {
                no =  self.state.count
            }
            else  if teamRef == "City"
            {
                no =  self.city.count
            }
            else  if teamRef == "Age"
            {
                no =  self.age.count
            }
            else  if teamRef == "Gender"
            {
                no =  self.gender.count
            }
            else  if teamRef == "Position"
            {
                no =  self.position.count
            }
            else  if teamRef == "Organization"
            {
                no =  self.organization.count
            }
        }
       return no
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        if tableView == self.tableViewOutlet {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId") as! TableViewCell
            
            cell1.categoriesLabel.text = categories[indexPath.row]
       
            return cell1
        }
         if tableView == self.subTableView {
           let cell2 = tableView.dequeueReusableCell(withIdentifier: "SubTableViewCellId") as!  SubTableViewCell
            
          // cell2.continentsDataLabel.text = filteredData[indexPath.row]
            
            if teamRef == "Region"
            {
                cell2.continentsDataLabel.text = continents[indexPath.row]
            }
            
           else if teamRef == "Country"
            {
                cell2.continentsDataLabel.text = country[indexPath.row]
            }
            
            else if teamRef == "State"
            {
                cell2.continentsDataLabel.text = state[indexPath.row]
            }
            
            else if teamRef == "City"
            {
                cell2.continentsDataLabel.text = city[indexPath.row]
            }
            else if teamRef == "Age"
            {
                cell2.continentsDataLabel.text = age[indexPath.row]
            }
            
            else if teamRef == "Gender"
            {
                cell2.continentsDataLabel.text = gender[indexPath.row]
            }
            
            else if teamRef == "Position"
            {
                cell2.continentsDataLabel.text = position[indexPath.row]
            }
            
            else if teamRef == "Organization"
            {
                cell2.continentsDataLabel.text = organization[indexPath.row]
            }
            
            //cell2.imageOutlet.image = UIImage(named: isClk[indexPath.row])
            
            return cell2
        }
    
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.subTableView {
        
        if isClk[indexPath.row] == "uncheck" {
            isClk[indexPath.row] = "check"
        }
        else if isClk[indexPath.row] == "check" {
            isClk[indexPath.row] = "uncheck"
        }
        subTableView.reloadData()
    }
            
         if tableView == self.tableViewOutlet {
            
            self.teamRef = categories[indexPath.row]
             subTableView.reloadData()
        }
       
        
    }
    
    ////// ====== Search Button method/////////
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = searchText.isEmpty ? continents : continents.filter { (temp: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return temp.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
        }
        if filteredData .isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please Enter valid continent name:", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        subTableView.reloadData()
    }
    
    
}





















extension UIView {
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minX, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
