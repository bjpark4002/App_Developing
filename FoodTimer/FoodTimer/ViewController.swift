//
//  ViewController.swift
//  FoodTimer
//
//  Created by Bumjin Park on 9/28/19.
//  Copyright © 2019 Bumjin Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let FoodList = ["계란", "라면", "튀김", "냉면", "스파게티"]
    var timeForFood = ["계란":"10m", "라면":"5m", "튀김":"15m", "냉면":"15m", "스파게티":"8m"]
    var filteredFoodList:[String] = []
    var isFiltered:Bool = false
    
    @IBOutlet var foodListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        foodListTableView.delegate = self
        foodListTableView.dataSource = self
        
        let searchBar = UISearchController(searchResultsController: nil)
        searchBar.searchResultsUpdater = self
        self.navigationItem.searchController = searchBar
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    

        foodListTableView.register(UINib(nibName: "foodList", bundle: nil), forCellReuseIdentifier: "foodListCell")
        
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController : UITableViewDelegate{
    
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isFiltered {
        case false:
            return FoodList.count
        case true:
            return filteredFoodList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodListCell") as! foodList
        
        switch isFiltered {
        case true:
            cell.cellLabel.text = filteredFoodList[indexPath.row]
            cell.cellButton.setTitle(timeForFood[filteredFoodList[indexPath.row]], for: UIControl.State.normal)
            
            

        case false:
            cell.cellLabel.text = FoodList[indexPath.row]
            cell.cellButton.setTitle(timeForFood[FoodList[indexPath.row]], for: UIControl.State.normal)
        }


        return cell
        
    }
    
    
}

extension ViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        if let hasText = searchController.searchBar.text?.lowercased() {
            if hasText.isEmpty{
                isFiltered = false
            }else{
                isFiltered = true
                filteredFoodList = FoodList.filter({$0.contains(hasText)})
            }
            foodListTableView.reloadData()

        }
    }
}
