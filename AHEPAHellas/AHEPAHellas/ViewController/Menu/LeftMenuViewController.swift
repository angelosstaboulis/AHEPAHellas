//
//  LeftMenuViewController.swift
//  NikosGiannakoudakis
//
//  Created by Angelos Staboulis on 8/2/19.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit
import AKSideMenu
import Alamofire
import SWXMLHash
protocol MenuProtocolDelegate:AnyObject{
    func setupMenuCell(tableView:UITableView,indexPath:IndexPath)->UITableViewCell
    func setupTableView()
    func handleMenuSelection(indexPath:IndexPath)
    
}
class LeftMenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,MenuProtocolDelegate {
    let defaults = UserDefaults.standard
    var titles = ["Chapters", "News","Videos","Social Media","History"]
    var images = ["logo","logo", "logo", "logo","logo"]
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setupMenuCell(tableView: tableView, indexPath: indexPath)
    }
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        
        // Do any additional setup after loading the view.
    }
    @objc func goBack(){
        self.dismiss(animated:true, completion:nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleMenuSelection(indexPath: indexPath)
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
extension LeftMenuViewController {
    func setupMenuCell(tableView: UITableView, indexPath: IndexPath)->UITableViewCell {
        let cellIdentifier: String = "Cell"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell!.backgroundColor = .clear
            cell!.textLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
            cell!.textLabel?.textColor = .black
            cell!.textLabel?.highlightedTextColor = .lightGray
            cell!.selectedBackgroundView = UIView()
        }
        
        if(indexPath.row < titles.count){
            cell!.textLabel?.text = titles[indexPath.row]
            cell!.imageView?.image = UIImage(named: images[indexPath.row])
        }
        return cell!
    }
    func setupTableView(){
        tableView = UITableView(frame: CGRect(x: 0, y:0, width: self.view.frame.size.width, height: 54 * 6), style: .plain)
        tableView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isOpaque = false
        tableView.backgroundColor = .clear
        tableView.backgroundView = nil
        tableView.separatorStyle = .none
        tableView.bounces = false
        self.view.addSubview(tableView)
    }
    func handleMenuSelection(indexPath: IndexPath) {
        if(indexPath.row==0){
            sideMenuViewController?.hideMenuViewController()
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let chapters = mainStoryboard.instantiateViewController(withIdentifier: "AHEPAChapters") as! AHEPAChapters
            let navChapters = UINavigationController(rootViewController: chapters)
            navChapters.modalPresentationStyle = .fullScreen
            self.present(navChapters, animated: true) {
                self.sideMenuViewController?.hideMenuViewController()
            }
            
        }
        if(indexPath.row==1){
            sideMenuViewController?.hideMenuViewController()
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let news = mainStoryboard.instantiateViewController(withIdentifier: "AHEPANews") as! AHEPANews
            let navNews = UINavigationController(rootViewController: news)
            navNews.modalPresentationStyle = .fullScreen
            self.present(navNews, animated: true, completion: nil)
        }
        if(indexPath.row==2){
            sideMenuViewController?.hideMenuViewController()
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let videos = mainStoryboard.instantiateViewController(withIdentifier: "AHEPAVideos") as! AHEPAVideos
            let navVideos = UINavigationController(rootViewController: videos)
            navVideos.modalPresentationStyle = .fullScreen
            self.present(navVideos, animated: true, completion: nil)
        }
        if(indexPath.row==3){
            sideMenuViewController?.hideMenuViewController()
            if let url = URL(string: "https://www.facebook.com/ahepa.hellas") {
                UIApplication.shared.open(url, options: [:])
            }
            
        }
        if(indexPath.row==4){
            sideMenuViewController?.hideMenuViewController()
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let history = mainStoryboard.instantiateViewController(withIdentifier: "History") as! History
            let navHistory = UINavigationController(rootViewController: history)
            navHistory.modalPresentationStyle = .fullScreen
            self.present(navHistory, animated: true, completion: nil)
        }
    }
}
