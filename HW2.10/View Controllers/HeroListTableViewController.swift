//
//  HeroListTableViewController.swift
//  HW2.10
//
//  Created by Valeria Khristinina on 01/03/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//

import UIKit

class HeroListTableViewController: UITableViewController {
	
	var heroes: [Hero] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		fetchDataHero { (heroesResponse) in
			self.heroes = heroesResponse

			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return heroes.count
    }

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "heroNameCell", for: indexPath) as! HeroCellPrototype
		
		let hero = heroes[indexPath.row]
        cell.configure(with: hero)
		
        return cell
    }
	
    // MARK: - Navigation
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			let hero = heroes[indexPath.row]
			performSegue(withIdentifier: "heroInfoSegue", sender: hero)
		}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "heroInfoSegue" {
			let heroInfoVC = segue.destination as! HeroInfoViewController
			heroInfoVC.hero = sender as? Hero
		}
    }
    

}

