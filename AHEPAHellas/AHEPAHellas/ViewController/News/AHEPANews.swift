//
//  AHEPANews.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 22/09/2019.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit
import SafariServices
import Alamofire
import SWXMLHash
import Toast
protocol AHEPANewsDelegate:AnyObject{
    func setupCellNews(tableView:UITableView,indexPath:IndexPath)->AHEPACell
    func setupView()
    func fillNewsArray()
    func openLink(indexPath:IndexPath)
}
class AHEPANews: UITableViewController,SFSafariViewControllerDelegate,UISearchBarDelegate,AHEPANewsDelegate {
    var rssList:[RSSModel]=[]{
        didSet{
            tableView.reloadData()
        }
    }
    @objc func goBack(){
        self.dismiss(animated:true, completion:nil)
    }
    var ahepaviewmodel:AHEPAViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.makeToast("Παρακαλώ περιμένετε.......")
        fillNewsArray()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.rssList.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openLink(indexPath: indexPath)
        
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupCellNews(tableView: tableView, indexPath: indexPath)
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension AHEPANews{
    func fillNewsArray(){
        self.ahepaviewmodel = AHEPAViewModel()
        self.ahepaviewmodel.fetchRSSList { (array) in
            self.rssList = array
        }
    }
    
    func openLink(indexPath: IndexPath) {
        if(indexPath.row < self.ahepaviewmodel.rssList.count){
            let link = rssList[indexPath.row].link
            let url = URL(string: link!)
            let safari = SFSafariViewController(url: url!)
            safari.delegate = self
            safari.modalPresentationStyle = .fullScreen
            self.present(safari, animated: true, completion: nil)
        }
    }
    
    func setupView(){
        self.tableView.register(UINib(nibName: "AHEPACell", bundle: nil), forCellReuseIdentifier: "cell")
        self.title = "AHEPA News"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Επιστροφή", style: .plain, target: self, action: #selector(goBack))
    }
    
    func setupCellNews(tableView:UITableView,indexPath:IndexPath)->AHEPACell {
        let cell:AHEPACell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AHEPACell
        if indexPath.row < self.rssList.count {
            cell.lblDescription.text = self.ahepaviewmodel.rssList[indexPath.row].title
        }
        
        
        return cell
    }
    
}
