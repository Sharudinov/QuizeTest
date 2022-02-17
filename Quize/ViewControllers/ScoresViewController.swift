//
//  ScoresViewController.swift
//  Quize
//
//  Created by Мурад on 25.11.2021.
//

import UIKit

class ScoresViewController: UIViewController {
    
    private var scoresView: ScoresView {
        return view as! ScoresView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoresView.scoresTableView.delegate = self
        scoresView.scoresTableView.dataSource = self
        scoresView.scoresTableView.register(UINib(nibName: "ScoresTableViewCell", bundle: .main), forCellReuseIdentifier: "ScoresTableViewCell")
        // Do any additional setup after loading the view.
    }
    

    

}
extension ScoresViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // брать данные из синглтона скорс(создать)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ScoresTableViewCell",
            for: indexPath
        ) as? ScoresTableViewCell
        else { return UITableViewCell()}
        //1 достать из массива из индекспаса 2сконфигируровать ячейку
        return cell
    }
    
    
    
}
