//
//  ViewController.swift
//  Swifter
//
//  Created by Ben Lambert on 7/13/18.
//  Copyright © 2018 Collective Idea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var people = [Person]()
    let repo = PersonRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        repo.getPeople { (people, error) in
            if let people = people {
                self.people = people
                self.tableView.reloadData()
            } else if let error = error {
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let person = people[indexPath.row]
        
        let personCell =  tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonCell
        personCell.nameLabel.text = person.name
        
        let favorites = person.favoriteThings.joined(separator: ", ")
        
        personCell.favoritesLabel.text = favorites
        
        return personCell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
