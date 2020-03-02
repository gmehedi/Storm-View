//
//  ImageShowViewController.swift
//  Project1StormView
//
//  Created by Mehedi on 2/28/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit

class ImageShowViewController: UIViewController {

    @IBOutlet weak var selectedImageView: UIImageView!
    var imageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let img = imageName{
            self.title = img
            self.selectedImageView.image = UIImage(named: img)
           // navigationController?.navigationBar.prefersLargeTitles = false;
            navigationItem.largeTitleDisplayMode = .never
        }
        //MARK: Project3, Sharing Media
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareOnTapped))
    }
    override func viewWillAppear(_ animated: Bool) {
          //  super.viewWillAppear(animated)
            navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
      //  super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    //MARK: Selector of Sharing Media
    @objc func shareOnTapped() {
        guard let image = selectedImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image, ], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    

}
