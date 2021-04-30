//
//  AHEPAChapters.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 22/09/2019.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation
protocol ChaptersDelegate:AnyObject{
    func fetchCorrectRow(row:Int)->Int
    func openLink(indexPath:IndexPath)
    func countRows()->Int
    func setupCell(tableView:UITableView,indexPath:IndexPath)->AHEPACell
}
class AHEPAChapters: UITableViewController,SFSafariViewControllerDelegate,UISearchBarDelegate,ChaptersDelegate{
    var rssList:[RSSModel]=[]
    var filtered:[RSSModel]=[]
    var searchActive : Bool = false
    @IBOutlet weak var search: UISearchBar!
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = rssList.filter { model -> Bool in
            let tmp: NSString = model.title! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        }
   
        if(filtered.count == 0){
            searchActive = false
        } else {
            searchActive = true
        }
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func fillItems(){
        rssList.append(RSSModel(title: "Athens Chapter HJ-1", link: "http://ahepahellas.org/chapters/athens-chapter-hj-1"))
        rssList.append(RSSModel(title: "Glyfada Chapter HJ-2", link: "http://ahepahellas.org/chapters/glyfada-hj-2"))
        rssList.append(RSSModel(title: "ATG HJ-3 -Thessaloniki", link: "http://ahepahellas.org/chapters/alexander-the-great-hj-3-thessaloniki"))
        rssList.append(RSSModel(title: "Solon Chapter HJ-4 – Halandri", link: "http://ahepahellas.org/chapters/solon-chapter-hj-4-halandri"))
        rssList.append(RSSModel(title: "Zakynthos Chapter HJ-5", link: "http://ahepahellas.org/chapters/zakynthos-hj-5"))
        rssList.append(RSSModel(title: "Kydon Chapter HJ-6 – Chania, Crete", link: "http://ahepahellas.org/chapters/kydon-chapter-hj-6-chania-crete"))
        rssList.append(RSSModel(title: "Papaflessa Chapter HJ-7 – Kalamata", link: "http://ahepahellas.org/chapters/papaflessa-hj-7-kalamata"))
        rssList.append(RSSModel(title: "Strymon Chapter HJ-8 – Serres", link: "http://ahepahellas.org/chapters/strymon-hj-8-serres"))
        rssList.append(RSSModel(title: "Themistoklis Chapter HJ-9 Piraeus", link: "http://ahepahellas.org/chapters/themistoklis-hj-9-piraeus"))
        rssList.append(RSSModel(title: "Pericles Chapter HJ-10 – Holargos", link:"http://ahepahellas.org/chapters/pericles-chapter-hj-10-holargos"))
        rssList.append(RSSModel(title: "Knossos Chapter HJ-11 – Irakleion", link:"http://ahepahellas.org/chapters/knossos-chapter-hj-11-irakleion"))
        rssList.append(RSSModel(title: "Rigas Feraios Chapter HJ-12 – Volos", link:"http://ahepahellas.org/chapters/rigas-ferreos-chapter-hj-12-volos"))
        rssList.append(RSSModel(title: "Argonauts Chapter HJ-13 – Argalasti", link:"http://ahepahellas.org/chapters/argonauts-chapter-hj-13-argalasti"))
        rssList.append(RSSModel(title: "Philippos Chapter HJ-14 – Kavala", link:"https://ahepahellas.org/chapters/philippos-chapter-hj-14-kavala/"))
        rssList.append(RSSModel(title: "Trantas Chapter HJ-15 – Kozani", link:"http://ahepahellas.org/chapters/kozani-trantas-chapter-hj-15"))
        rssList.append(RSSModel(title: "Areti Chapter HJ-16 - Drama", link:"http://ahepahellas.org/chapters/drama-areti-chapter-hj-16"))
        rssList.append(RSSModel(title: "Ifestos Chapter HJ-17 – Varie", link:"http://ahepahellas.org/chapters/vari-ifestos-chapter-hj-17"))
        rssList.append(RSSModel(title: "Lepanto Chapter HJ-18 Nafpaktos", link:"http://ahepahellas.org/chapters/nafpaktos-hj-18"))
        rssList.append(RSSModel(title: "Protagoras Chapter HJ-19 - Xanthi", link:"http://ahepahellas.org/chapters/xanthi-hj-19"))
        rssList.append(RSSModel(title: "Orfeus Chapter HJ-20 – Komotini", link:"http://ahepahellas.org/chapters/komotini-hj-20"))
        rssList.append(RSSModel(title: "Democritus Chapter HJ-21 - Alexandroupoli", link:"http://ahepahellas.org/chapters/alexandroupoli"))
        rssList.append(RSSModel(title: "Arcadia Chapter HJ-22 - Tripolis", link:"http://ahepahellas.org/chapters/tripolis-hj-22"))
        rssList.append(RSSModel(title: "King Pyrros Chapter HJ-23 - Ioannina", link:"http://ahepahellas.org/chapters/ioannina-hj-23"))
        rssList.append(RSSModel(title: "Spartiates - Chapter HJ-24 - Sparti", link:"http://ahepahellas.org/chapters/sparti-spartiates-hj-24"))
        rssList.append(RSSModel(title:"St. Andrew Chapter HJ-25 - Patra", link:"http://ahepahellas.org/chapters/st-andrew-chapter-hj-25-patra"))
        rssList.append(RSSModel(title:"Olympos Chapter HJ-26 - Larissa", link:"http://ahepahellas.org/chapters/olympos-chapter-hj-26-larissa"))
        rssList.append(RSSModel(title:"Kassandros Chapter HJ-27 – Oreokastro Thes.", link:"http://ahepahellas.org/chapters/kassandros-chapter"))
        rssList.append(RSSModel(title:"Jim Londos Chapter HJ-28 – Nafplio", link:"http://ahepahellas.org/chapters/jim-londos-chapter-hj-28-nafplio"))
        rssList.append(RSSModel(title:"Vergina Chapter HJ-29 – Veroia", link:"http://ahepahellas.org/chapters/vergina-chapter-hj-29-veroia"))
        rssList.append(RSSModel(title:"Theagenis Chapter HJ-30 – Thassos", link:"http://ahepahellas.org/chapters/theagenis-chapter-hj-30-thassos"))
        rssList.append(RSSModel(title:"Nearchos Chapter H-31 – Ag. Nikolaos, Crete", link:"http://ahepahellas.org/chapters/nearchos-chapter-h-31-ag-nikolaos-crete"))
        rssList.append(RSSModel(title:"N. Plastiras Chapter HJ-32 - Karditsa", link:"http://ahepahellas.org/chapters/n-plastiras-chapter-hj-32-karditsa/"))
        rssList.append(RSSModel(title:"Chapter HJ-33 - Rhodes", link:"http://ahepahellas.org/chapters/chapter-hj-33-rhodes/"))
    }
    @objc func goBack(){
        self.dismiss(animated:true, completion:nil)
    }
    func setupViews(){
        self.tableView.register(UINib(nibName: "AHEPACell", bundle: nil), forCellReuseIdentifier: "cell")
        search.delegate = self
        self.title = "AHEPA Chapters"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Επιστροφή", style: .plain, target: self, action: #selector(goBack))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fillItems()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 90.0
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController)
    {
        controller.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         openLink(indexPath: indexPath)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countRows()
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
extension AHEPAChapters{
    func fetchCorrectRow(row:Int)->Int{
        var item:Int=0
        var getValue:Int=0
        while(item<self.rssList.count){
            let currentTitle = self.rssList[item].title
            let filteredTitle = self.filtered[row].title
            if currentTitle == filteredTitle  {
                getValue=item
                break
            }
            item=item+1
        }
        return getValue
    }
    func openLink(indexPath:IndexPath){
        if(searchActive==true){
            let svc = SFSafariViewController(url: URL(string:self.rssList[fetchCorrectRow(row: indexPath.row)].link!)!)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
        }
        else{
            let svc = SFSafariViewController(url: URL(string:self.rssList[indexPath.row].link!)!)
            svc.delegate = self
            self.present(svc, animated: true, completion: nil)
            
        }
    }
    func countRows() -> Int {
        if(searchActive) {
            return filtered.count
        }
        return rssList.count
    }
    func setupCell(tableView:UITableView,indexPath:IndexPath)->AHEPACell{
        let cell:AHEPACell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AHEPACell
        if(searchActive){
            if(filtered.count==0){
                var i:Int=0
                while(i<self.rssList.count){
                    self.filtered.append(self.rssList[indexPath.row])
                    i=i+1
                }
            }
            cell.lblDescription.text =  filtered[indexPath.row].title
        } else {
            cell.lblDescription.text =  rssList[indexPath.row].title
        }
        
        return cell
    }
}
