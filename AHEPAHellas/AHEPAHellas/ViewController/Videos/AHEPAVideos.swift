//
//  AHEPAVideos.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 22/09/2019.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit
import SafariServices
protocol AHEPAVideosDelegate:AnyObject{
    func openLink(indexPath:IndexPath)
    func setupView()
    func setupCell(tableView:UITableView,indexPath:IndexPath)->AHEPACell
}
class AHEPAVideos: UITableViewController,SFSafariViewControllerDelegate,AHEPAVideosDelegate {
    var items:[String]=[]
    
    @objc func goBack(){
        self.dismiss(animated:true, completion:nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openLink(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupCell(tableView: tableView, indexPath: indexPath)
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
extension AHEPAVideos{
    func fillItems(){
        items.append("AHEPA Video-1")
        items.append("AHEPA Video-2")
        items.append("AHEPA Video-3")
        items.append("AHEPA Video-4")
    }
    func setupView(){
        self.title = "AHEPA Videos"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Επιστροφή", style: .plain, target: self, action: #selector(goBack))
        self.tableView.register(UINib(nibName: "AHEPACell", bundle: nil), forCellReuseIdentifier: "cell")
        fillItems()
    }
    func setupCell(tableView:UITableView,indexPath:IndexPath)->AHEPACell{
        let cell:AHEPACell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AHEPACell
        if(indexPath.row < items.count){
            cell.lblDescription?.text = items[indexPath.row]
            cell.lblDescription?.textAlignment = .center
        }
        
        return cell
    }
    func openLink(indexPath:IndexPath){
        if(indexPath.row==0){
            let svc = SFSafariViewController(url: URL(string:"https://www.youtube.com/embed/nUncRfay6So" )!)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
            
        }
        if(indexPath.row==1){
            let svc = SFSafariViewController(url: URL(string:"https://www.youtube.com/embed/bPhmba4T5Bw" )!)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
            
        }
        if(indexPath.row==2){
            let svc = SFSafariViewController(url: URL(string:"https://www.youtube.com/embed/arOBK2TRME0" )!)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
            
        }
        if(indexPath.row==3){
            let svc = SFSafariViewController(url: URL(string:"https://www.youtube.com/embed/RwJ1cSNig98" )!)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
            
        }
    }
}
