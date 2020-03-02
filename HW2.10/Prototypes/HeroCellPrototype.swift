//
//  HeroCellPrototype.swift
//  HW2.10
//
//  Created by Valeria Khristinina on 02/03/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//

import UIKit

class HeroCellPrototype: UITableViewCell {
	@IBOutlet var heroImage: UIImageView!
	@IBOutlet var heroFullyName: UILabel!
	@IBOutlet var heroRealName: UILabel!
	@IBOutlet var heroPublisher: UILabel!
	
	func configure(with hero: Hero) {
		heroFullyName.text = hero.name
		heroRealName.text = hero.biography?.fullName
		heroPublisher.text = hero.biography?.publisher

        DispatchQueue.global().async {
			guard let stringURL = hero.images?.xs else { return }
			guard let imageURL = URL(string: stringURL) else { return }
			guard let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.heroImage?.image = UIImage(data: imageData)
            }
        }
    }
	
}
