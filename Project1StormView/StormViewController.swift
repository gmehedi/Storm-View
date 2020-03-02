//
//  ViewController.swift
//  Project1StormView
//
//  Created by Mehedi on 2/28/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

class StormViewController: UIViewController {
    
    @IBOutlet weak var mtableView: UITableView!
    
    var images = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Pictures"
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0.4, green: 0.5, blue: 0.7, alpha: 0.9)
        navigationController?.navigationBar.prefersLargeTitles = true
        let fileManger = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManger.contentsOfDirectory(atPath: path)
        for item in items{
            if item.hasPrefix("nssl"){
                images.append(item)
            }
        }
        self.mtableView.dataSource = self
        self.mtableView.delegate = self
       // self.mtableView.tableFooterView = UIView(frame: CGRect.zero)
        // Do any additional setup after loading the view.
    }
}
extension StormViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mtableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "ImageShowViewController") as? ImageShowViewController{
            //print(images[indexPath.row])
            vc.imageName = images[indexPath.row]
          //  vc.selectedImageView.image = UIImage(named: images[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}

