//
//  FilterViewController.swift
//  Yelp
//
//  Created by Triet on 6/25/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit

var categoriesSwitchStates = [Int: Bool]()
var dealSwitchStates = false
var distanceSwitchStates = [Int: Bool]()
var sortSwitchStates = [Int: Bool]()
protocol  FilterViewControllerDelegate {
  func filterViewController(filterVC: FilterViewController, didUpdateFilters filters: [String:AnyObject])
}
class FilterViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var delegate: FilterViewControllerDelegate!
  let categories: [[String: String]] =
    [["name" : "Afghan", "code": "afghani"],
     ["name" : "African", "code": "african"],
     ["name" : "American, New", "code": "newamerican"],
     ["name" : "American, Traditional", "code": "tradamerican"],
     ["name" : "Arabian", "code": "arabian"],
     ["name" : "Argentine", "code": "argentine"],
     ["name" : "Armenian", "code": "armenian"],
     ["name" : "Asian Fusion", "code": "asianfusion"],
     ["name" : "Asturian", "code": "asturian"],
     ["name" : "Australian", "code": "australian"],
     ["name" : "Austrian", "code": "austrian"],
     ["name" : "Baguettes", "code": "baguettes"],
     ["name" : "Bangladeshi", "code": "bangladeshi"],
     ["name" : "Barbeque", "code": "bbq"],
     ["name" : "Basque", "code": "basque"],
     ["name" : "Bavarian", "code": "bavarian"],
     ["name" : "Beer Garden", "code": "beergarden"],
     ["name" : "Beer Hall", "code": "beerhall"],
     ["name" : "Beisl", "code": "beisl"],
     ["name" : "Belgian", "code": "belgian"],
     ["name" : "Bistros", "code": "bistros"],
     ["name" : "Black Sea", "code": "blacksea"],
     ["name" : "Brasseries", "code": "brasseries"],
     ["name" : "Brazilian", "code": "brazilian"],
     ["name" : "Breakfast & Brunch", "code": "breakfast_brunch"],
     ["name" : "British", "code": "british"],
     ["name" : "Buffets", "code": "buffets"],
     ["name" : "Bulgarian", "code": "bulgarian"],
     ["name" : "Burgers", "code": "burgers"],
     ["name" : "Burmese", "code": "burmese"],
     ["name" : "Cafes", "code": "cafes"],
     ["name" : "Cafeteria", "code": "cafeteria"],
     ["name" : "Cajun/Creole", "code": "cajun"],
     ["name" : "Cambodian", "code": "cambodian"],
     ["name" : "Canadian", "code": "New)"],
     ["name" : "Canteen", "code": "canteen"],
     ["name" : "Caribbean", "code": "caribbean"],
     ["name" : "Catalan", "code": "catalan"],
     ["name" : "Chech", "code": "chech"],
     ["name" : "Cheesesteaks", "code": "cheesesteaks"],
     ["name" : "Chicken Shop", "code": "chickenshop"],
     ["name" : "Chicken Wings", "code": "chicken_wings"],
     ["name" : "Chilean", "code": "chilean"],
     ["name" : "Chinese", "code": "chinese"],
     ["name" : "Comfort Food", "code": "comfortfood"],
     ["name" : "Corsican", "code": "corsican"],
     ["name" : "Creperies", "code": "creperies"],
     ["name" : "Cuban", "code": "cuban"],
     ["name" : "Curry Sausage", "code": "currysausage"],
     ["name" : "Cypriot", "code": "cypriot"],
     ["name" : "Czech", "code": "czech"],
     ["name" : "Czech/Slovakian", "code": "czechslovakian"],
     ["name" : "Danish", "code": "danish"],
     ["name" : "Delis", "code": "delis"],
     ["name" : "Diners", "code": "diners"],
     ["name" : "Dumplings", "code": "dumplings"],
     ["name" : "Eastern European", "code": "eastern_european"],
     ["name" : "Ethiopian", "code": "ethiopian"],
     ["name" : "Fast Food", "code": "hotdogs"],
     ["name" : "Filipino", "code": "filipino"],
     ["name" : "Fish & Chips", "code": "fishnchips"],
     ["name" : "Fondue", "code": "fondue"],
     ["name" : "Food Court", "code": "food_court"],
     ["name" : "Food Stands", "code": "foodstands"],
     ["name" : "French", "code": "french"],
     ["name" : "French Southwest", "code": "sud_ouest"],
     ["name" : "Galician", "code": "galician"],
     ["name" : "Gastropubs", "code": "gastropubs"],
     ["name" : "Georgian", "code": "georgian"],
     ["name" : "German", "code": "german"],
     ["name" : "Giblets", "code": "giblets"],
     ["name" : "Gluten-Free", "code": "gluten_free"],
     ["name" : "Greek", "code": "greek"],
     ["name" : "Halal", "code": "halal"],
     ["name" : "Hawaiian", "code": "hawaiian"],
     ["name" : "Heuriger", "code": "heuriger"],
     ["name" : "Himalayan/Nepalese", "code": "himalayan"],
     ["name" : "Hong Kong Style Cafe", "code": "hkcafe"],
     ["name" : "Hot Dogs", "code": "hotdog"],
     ["name" : "Hot Pot", "code": "hotpot"],
     ["name" : "Hungarian", "code": "hungarian"],
     ["name" : "Iberian", "code": "iberian"],
     ["name" : "Indian", "code": "indpak"],
     ["name" : "Indonesian", "code": "indonesian"],
     ["name" : "International", "code": "international"],
     ["name" : "Irish", "code": "irish"],
     ["name" : "Island Pub", "code": "island_pub"],
     ["name" : "Israeli", "code": "israeli"],
     ["name" : "Italian", "code": "italian"],
     ["name" : "Japanese", "code": "japanese"],
     ["name" : "Jewish", "code": "jewish"],
     ["name" : "Kebab", "code": "kebab"],
     ["name" : "Korean", "code": "korean"],
     ["name" : "Kosher", "code": "kosher"],
     ["name" : "Kurdish", "code": "kurdish"],
     ["name" : "Laos", "code": "laos"],
     ["name" : "Laotian", "code": "laotian"],
     ["name" : "Latin American", "code": "latin"],
     ["name" : "Live/Raw Food", "code": "raw_food"],
     ["name" : "Lyonnais", "code": "lyonnais"],
     ["name" : "Malaysian", "code": "malaysian"],
     ["name" : "Meatballs", "code": "meatballs"],
     ["name" : "Mediterranean", "code": "mediterranean"],
     ["name" : "Mexican", "code": "mexican"],
     ["name" : "Middle Eastern", "code": "mideastern"],
     ["name" : "Milk Bars", "code": "milkbars"],
     ["name" : "Modern Australian", "code": "modern_australian"],
     ["name" : "Modern European", "code": "modern_european"],
     ["name" : "Mongolian", "code": "mongolian"],
     ["name" : "Moroccan", "code": "moroccan"],
     ["name" : "New Zealand", "code": "newzealand"],
     ["name" : "Night Food", "code": "nightfood"],
     ["name" : "Norcinerie", "code": "norcinerie"],
     ["name" : "Open Sandwiches", "code": "opensandwiches"],
     ["name" : "Oriental", "code": "oriental"],
     ["name" : "Pakistani", "code": "pakistani"],
     ["name" : "Parent Cafes", "code": "eltern_cafes"],
     ["name" : "Parma", "code": "parma"],
     ["name" : "Persian/Iranian", "code": "persian"],
     ["name" : "Peruvian", "code": "peruvian"],
     ["name" : "Pita", "code": "pita"],
     ["name" : "Pizza", "code": "pizza"],
     ["name" : "Polish", "code": "polish"],
     ["name" : "Portuguese", "code": "portuguese"],
     ["name" : "Potatoes", "code": "potatoes"],
     ["name" : "Poutineries", "code": "poutineries"],
     ["name" : "Pub Food", "code": "pubfood"],
     ["name" : "Rice", "code": "riceshop"],
     ["name" : "Romanian", "code": "romanian"],
     ["name" : "Rotisserie Chicken", "code": "rotisserie_chicken"],
     ["name" : "Rumanian", "code": "rumanian"],
     ["name" : "Russian", "code": "russian"],
     ["name" : "Salad", "code": "salad"],
     ["name" : "Sandwiches", "code": "sandwiches"],
     ["name" : "Scandinavian", "code": "scandinavian"],
     ["name" : "Scottish", "code": "scottish"],
     ["name" : "Seafood", "code": "seafood"],
     ["name" : "Serbo Croatian", "code": "serbocroatian"],
     ["name" : "Signature Cuisine", "code": "signature_cuisine"],
     ["name" : "Singaporean", "code": "singaporean"],
     ["name" : "Slovakian", "code": "slovakian"],
     ["name" : "Soul Food", "code": "soulfood"],
     ["name" : "Soup", "code": "soup"],
     ["name" : "Southern", "code": "southern"],
     ["name" : "Spanish", "code": "spanish"],
     ["name" : "Steakhouses", "code": "steak"],
     ["name" : "Sushi Bars", "code": "sushi"],
     ["name" : "Swabian", "code": "swabian"],
     ["name" : "Swedish", "code": "swedish"],
     ["name" : "Swiss Food", "code": "swissfood"],
     ["name" : "Tabernas", "code": "tabernas"],
     ["name" : "Taiwanese", "code": "taiwanese"],
     ["name" : "Tapas Bars", "code": "tapas"],
     ["name" : "Tapas/Small Plates", "code": "tapasmallplates"],
     ["name" : "Tex-Mex", "code": "tex-mex"],
     ["name" : "Thai", "code": "thai"],
     ["name" : "Traditional Norwegian", "code": "norwegian"],
     ["name" : "Traditional Swedish", "code": "traditional_swedish"],
     ["name" : "Trattorie", "code": "trattorie"],
     ["name" : "Turkish", "code": "turkish"],
     ["name" : "Ukrainian", "code": "ukrainian"],
     ["name" : "Uzbek", "code": "uzbek"],
     ["name" : "Vegan", "code": "vegan"],
     ["name" : "Vegetarian", "code": "vegetarian"],
     ["name" : "Venison", "code": "venison"],
     ["name" : "Vietnamese", "code": "vietnamese"],
     ["name" : "Wok", "code": "wok"],
     ["name" : "Wraps", "code": "wraps"],
     ["name" : "Yugoslav", "code": "yugoslav"]]
  
  var distanceList = ["Auto", "1 mile", "3 mile", "5 mile", "10 mile"]
  var distanceListValue = [0, 1000, 3000, 5000, 10000]
  var selectedDistance = 0
  var sortByList = ["Best Matched", "Distance", "Highest Rated"]
  var selectedSortBy = 0
  var filters = [String:AnyObject]()
  

  
    let curCategorySwitchstates = categoriesSwitchStates  // captured the current state, need to recover in case user cancel filter
    let curDistanceSwitchstates = distanceSwitchStates
    let curDealSwitchStates = dealSwitchStates
    let curSortSwitchStates = sortSwitchStates
  
    override func viewDidLoad() {
      
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      tableView.delegate = self
      tableView.dataSource = self
//        tableView.reloadData()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func onCancle(_ sender: UIBarButtonItem) {
    categoriesSwitchStates = curCategorySwitchstates
    distanceSwitchStates = curDistanceSwitchstates
    dealSwitchStates = curDealSwitchStates
    sortSwitchStates = curSortSwitchStates
    dismiss(animated: true, completion: nil)
  }

  @IBAction func onSave(_ sender: UIBarButtonItem) {
    
    dismiss(animated: true, completion: nil)
    var selectedCategories = [String]()
    var selectedCategoriesIdx = [Int]()
    for (row, isSelected) in categoriesSwitchStates {
      if isSelected {
        selectedCategories.append(categories[row]["code"]!)
        selectedCategoriesIdx.append(row)
      }
    }
    filters["categories"] = selectedCategories as AnyObject?
    filters["categoriesIdx"] = selectedCategoriesIdx as AnyObject?
    
    filters["sortBy"] = selectedSortBy as AnyObject?
    filters["deal"] = dealSwitchStates as AnyObject?
    if selectedDistance == 0 {
      filters["distance"] = nil
    } else {
      filters["distance"] = distanceListValue[selectedDistance] as AnyObject?
    }
    filters["distanceIdx"] = selectedDistance as AnyObject?
    
    print(filters)
    delegate.filterViewController(filterVC: self, didUpdateFilters: filters)


  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FilterViewController: UITableViewDataSource, UITableViewDelegate, SwitchCellDelegate{

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    switch section {
    case 0: return 1
    case 1: return distanceList.count
    case 2: return sortByList.count
    case 3: return categories.count
    default: return 0
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    // Deal
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchsCell
      cell.categoryLabel.text = "Offerring a deal"
      cell.switchButton.isOn = dealSwitchStates
      return cell
      
    // Distance
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchsCell
      cell.categoryLabel.text = distanceList[indexPath.row]
      cell.switchButton.isOn = distanceSwitchStates[indexPath.row] ?? false

      return cell
      
    // Sort by
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchsCell
      cell.categoryLabel.text = sortByList[indexPath.row]
      cell.switchButton.isOn = sortSwitchStates[indexPath.row] ?? false
      return cell
      
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchsCell
      cell.categoryLabel.text = categories[indexPath.row]["name"]
      cell.delegate = self
      cell.switchButton.isOn = categoriesSwitchStates[indexPath.row] ?? false
      return cell

    default:
      return UITableViewCell()
    }

  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    var headerTitle = UILabel()
    headerTitle = UILabel(frame: CGRect(x: 15, y: 15, width: 200, height: 35))
    switch section {
    case 0: headerTitle.text = "Deal"
    case 1: headerTitle.text = "Distance"
    case 2: headerTitle.text = "Sort by"
    case 3: headerTitle.text = "Categories"
    default: headerTitle.text = ""
    }
    headerTitle.textColor = UIColor(red: 0, green: 0.7, blue: 0, alpha: 1)
    headerView.addSubview(headerTitle)
    headerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 42
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
  
  func switchCell( switchCell: SwitchsCell, didChangeValue value: Bool) {
    let ip = tableView.indexPath(for: switchCell)!
    let section = (tableView.indexPath(for: switchCell)?.section)!
    var reload = false
    switch section {
    case 0:
        dealSwitchStates = value
    case 1:
        distanceSwitchStates[(ip.row)] = value
        
        if (value == true)
        {
          for idx in 0...distanceList.count{
            if ((idx != ip.row) && distanceSwitchStates[idx] == true){
              distanceSwitchStates[idx] = false
              reload = true
            }
          }
          selectedDistance = (ip.row)
        }
      if (reload)
      {
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
      }
      reload = false
      
    case 2:
        sortSwitchStates[(ip.row)] = value
        
        if (value == true)
        {
          for idx in 0...sortByList.count{
            if ((idx != ip.row) && sortSwitchStates[idx] == true){
              sortSwitchStates[idx] = false
              reload = true
            }
          }
          selectedSortBy = (ip.row)
        }
      
        if (reload)
        {
          tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        }
        reload = false
    case 3:
       categoriesSwitchStates[(ip.row)] = value
    default: break
    }

    print("detected row index \(ip.row) \(section)")
  }
}
