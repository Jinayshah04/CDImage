//
//  ViewController.swift
//  CDImage
//
//  Created by mobile1 on 30/11/24.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var imgArr:[ImageModel]=[]
    @IBOutlet weak var tableVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        CoreDataManager().addfromCd()
        imgArr=CoreDataManager().readfromCD()
    }
    
    func setupTable()  {
        tableVC.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "imgCell")
        tableVC.delegate=self
        tableVC.dataSource=self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imgCell", for: indexPath) as! ImageCell
        
        return cell
    }
}

