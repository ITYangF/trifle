//
//  TRProfileViewController.swift
//  TRIFLE
//
//  Created by Yang on 2020/2/9.
//  Copyright © 2020 Yang. All rights reserved.
//

import UIKit

class TRProfileViewController: UITableViewController {

    var profileInfo : NSArray? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        profileInfo = self.getDataInfo()
        self.configureProfileController()
    }

    
    // MARK: -配置控制器
    private func configureProfileController(){
        tableView.tableHeaderView = TRLoginView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    }
    
    // MARK: -从plist中获取数据
    private func getDataInfo() -> NSArray{
        let infoPath = Bundle.main.path(forResource: "profile", ofType: "plist")
        guard let path = infoPath else {
            return NSArray()
        }
        let data = NSArray(contentsOfFile: path)
        guard let dataArray = data else {
            return NSArray()
        }
        return dataArray
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInfo!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        }
        
        let msg: [String:String] = profileInfo![indexPath.row] as! [String : String]
        if msg.keys.contains("detail") {
            cell?.detailTextLabel?.text = msg["detail"]
        }
        cell?.textLabel?.text = msg["title"]
        cell?.accessoryType = .disclosureIndicator
        return cell ?? UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
