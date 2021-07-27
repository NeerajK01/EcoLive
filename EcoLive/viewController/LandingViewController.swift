//
//  LandingViewController.swift
//  EcoLive
//
//  Created by Neeraj kumar on 16/07/21.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var selectLocationView: UIView!
    @IBOutlet weak var selectCategoryView: UIView!
    
    @IBOutlet weak var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchBarView.layer.masksToBounds = true
        self.searchBarView.layer.cornerRadius = self.searchBarView.frame.height * 0.5
        
        self.selectLocationView.layer.masksToBounds = true
        self.selectLocationView.layer.cornerRadius = self.selectLocationView.frame.height * 0.2
        self.selectLocationView.layer.borderWidth = 1
        self.selectLocationView.layer.borderColor = UIColor.gray.cgColor
        
        self.selectCategoryView.layer.masksToBounds = true
        self.selectCategoryView.layer.cornerRadius = self.selectCategoryView.frame.height * 0.2
        self.selectCategoryView.layer.borderWidth = 1
        self.selectCategoryView.layer.borderColor = UIColor.gray.cgColor
        
        self.mainTable.dataSource = self
        self.mainTable.delegate = self
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LandingViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "showMoreCell", for: indexPath) as! ShowMoreCell
            return cell
        } else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell", for: indexPath) as! ShopCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2{
            return 60.0
        }else if indexPath.section == 3{
            return 500.0
        }else{
            return 180.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
}
