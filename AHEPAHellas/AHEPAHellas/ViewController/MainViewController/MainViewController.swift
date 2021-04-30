//
//  MainViewController.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 1/5/21.
//  Copyright © 2021 Angelos Staboulis. All rights reserved.
//

import UIKit
import SwiftyGif
class MainViewController: UIViewController {
    @objc func gotoSite(){
        if let url = URL(string: "https://www.ahepahellas.gr") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
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
extension MainViewController{
    func setupViews(){
        do{
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(self.presentLeftMenuViewController(_:)))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "AHEPAHellas", style: .plain, target: self, action: #selector(self.gotoSite))
            let gif = try UIImage(gifName: "patmos.gif")
            let imageview = UIImageView(gifImage: gif, loopCount: -1) 
            imageview.frame = CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height)
            view.sendSubviewToBack(imageview)
            view.addSubview(imageview)
        }
        catch{
            
        }
    }
}
