//
//  HeroInfoViewController.swift
//  HW2.10
//
//  Created by Valeria Khristinina on 01/03/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//

import UIKit

class HeroInfoViewController: UIViewController {
	@IBOutlet var heroImage: UIImageView!
	@IBOutlet var heroNameLabel: UILabel!
	@IBOutlet var heroRealNameLabel: UILabel!
	@IBOutlet var heroGenderLabel: UILabel!
	@IBOutlet var heroRaceLabel: UILabel!
	@IBOutlet var heroEyeColorLabel: UILabel!
	@IBOutlet var heroHairColorLabel: UILabel!
	@IBOutlet var heroPlaceOfBirthLabel: UILabel!
	@IBOutlet var heroPublisherLabel: UILabel!
	@IBOutlet var heroAligmentLabel: UILabel!
	@IBOutlet var heroAliasesLabel: UILabel!
	
	var hero: Hero!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let aliasesString = hero.biography?.aliases?.joined(separator: ", ")
		
		heroNameLabel.text = hero.name
		heroRealNameLabel.text = hero.biography?.fullName
		heroGenderLabel.text = hero.appearance?.gender
		heroRaceLabel.text = hero.appearance?.race
		heroEyeColorLabel.text = hero.appearance?.eyeColor
		heroHairColorLabel.text = hero.appearance?.hairColor
		heroPlaceOfBirthLabel.text = hero.biography?.placeOfBirth
		heroPublisherLabel.text = hero.biography?.publisher
		heroAligmentLabel.text = hero.biography?.alignment
		heroAliasesLabel.text = aliasesString
		
		guard let stringURL = hero.images?.sm else { return }
		guard let imageURL = URL(string: stringURL) else { return }
		guard let imageData = try? Data(contentsOf: imageURL) else { return }
		
		heroImage.image = UIImage(data: imageData)
		
	}


}

