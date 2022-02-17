//
//  MainViewController.swift
//  Quize
//
//  Created by Мурад on 14.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    private var mainView: MainView {
       return view as! MainView
    }
    private let toPaulseVCIdentifier = "toPaulseViewControllerSegue"
    private let levelTableViewCell = "levelTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.helloLabel.text = "Hello " + Singleton.shared.userName
        
        mainView.myTableView.delegate = self
        mainView.myTableView.dataSource = self
        mainView.myTableView.register(UINib(nibName: "LevelTableViewCell", bundle: .main), forCellReuseIdentifier: "LevelTableViewCell")

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == toPaulseVCIdentifier else {return}
        guard let index = (sender as? Int) else {
            return
        }
        guard let paulseVC = segue.destination as? PaulseViewController else {return}
        
        paulseVC.currentPolse = SaveQueezy.pollse[index]
    }
  

}

    
    

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainView.levelPaulse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "LevelTableViewCell",
            for: indexPath
        ) as? LevelTableViewCell
        else { return UITableViewCell()}
        
        let level = mainView.levelPaulse[indexPath.item]
        cell.variantLabel?.text = level
        
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toPaulseViewControllerSegue", sender: indexPath.item)
        }
    }


