//
//  ViewController.swift
//  AssignmentBothOfUs
//
//  Created by Angelos Staboulis on 23/8/21.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(380.0)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewCell(indexPath: indexPath)
    }
    var viewModel = BothOfUsViewModel()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        // Do any additional setup after loading the view.
    }
    
    
}
extension ViewController {
    func initView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BothOfUsCell", bundle: nil), forCellReuseIdentifier: "cell")
        viewModel.fetchProductTypes { (array) in
            self.tableView.reloadData()
        }
    }
    func viewCell(indexPath:IndexPath)->BothOfUsCell{
        let cell:BothOfUsCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BothOfUsCell
        if indexPath.row < viewModel.rows.count{
            if viewModel.rows[indexPath.row].active {
                cell.mainView.backgroundColor = .purple
                cell.lblActive.text = String(viewModel.rows[indexPath.row].active)
                cell.lblID.text = String(viewModel.rows[indexPath.row].id)
                cell.lblName.text = String(viewModel.rows[indexPath.row].name)
                cell.lblCategory.text = String(viewModel.rows[indexPath.row].category)
                cell.lblCreatedAt.text = String(viewModel.rows[indexPath.row].created_at)
                cell.lblUpdatedAt.text = String(viewModel.rows[indexPath.row].updated_at)
            }
            else{
                cell.lblActive.text = String(viewModel.rows[indexPath.row].active)
                cell.lblID.text = String(viewModel.rows[indexPath.row].id)
                cell.lblName.text = String(viewModel.rows[indexPath.row].name)
                cell.lblCategory.text = String(viewModel.rows[indexPath.row].category)
                cell.lblCreatedAt.text = String(viewModel.rows[indexPath.row].created_at)
                cell.lblUpdatedAt.text = String(viewModel.rows[indexPath.row].updated_at)
            }
        }
        return cell
    }
}
