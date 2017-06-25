//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
    var businesses: [Business]!

    override func viewDidLoad() {
        super.viewDidLoad()
      tableView.delegate = self
      tableView.dataSource = self
      tableView.estimatedRowHeight = 100
      tableView.rowHeight = UITableViewAutomaticDimension
      

        Business.search(with: "") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses

                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
          self.tableView.reloadData()
        }

        // Example of Yelp search with more search options specified
        /*
        Business.search(with: "Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses

                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
        }
        */
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let navController = segue.destination as! UINavigationController
    let filterVC = navController.viewControllers.first as! FilterViewController
    filterVC.delegate = self
  }

}
extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource, FilterViewControllerDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if businesses != nil{
      return businesses.count
    }
    else{
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "businessCell", for: indexPath) as! BusinessCell
    
    cell.business = businesses[indexPath.row]
    return cell
  }
  
  func filterViewController(filterVC: FilterViewController, didUpdateFilters filters: [String]) {
    print("I get new filter from VC")
    
    Business.search(with: "", sort: nil, categories: filters, deals: nil) { (businesses: [Business]?, error: Error?) in
      if let businesses = businesses {
        self.businesses = businesses
        self.tableView.reloadData()
    
      }
    }
  }
}
