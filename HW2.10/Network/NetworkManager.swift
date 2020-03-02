//
//  NetworkManager.swift
//  HW2.10
//
//  Created by Valeria Khristinina on 01/03/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//
import Foundation

private let jsonURL = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"

private var heroes: [Hero] = []

//private var heroes: Hero = []

func fetchDataHero(completion: @escaping ([Hero]) -> Void) {
	guard let url = URL(string: jsonURL) else { return }
	
	URLSession.shared.dataTask(with: url) { (data, _, _) in
		guard let data = data else { return }
		
		let decoder = JSONDecoder()
		do {
			heroes = try decoder.decode([Hero].self, from: data)
			completion(heroes)
		} catch let error {
			print(error.localizedDescription)
		}
	}.resume()
}
