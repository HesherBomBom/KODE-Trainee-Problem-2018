//
//  ViewController.swift
//  KODE Trainee Problem 2018
//
//  Created by Pavel Zykov on 08.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkManager.fetchCurrent()
        networkManager.onCompletion = { [weak self] api in
            guard let self = self else { return }
            print(api.items.count)
        }
    }


}

