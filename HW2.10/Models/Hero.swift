//
//  Hero.swift
//  HW2.10
//
//  Created by Valeria Khristinina on 01/03/2020.
//  Copyright © 2020 Valeria Khristinina. All rights reserved.
//

struct Hero: Decodable {
	var name: String?
	var biography: HeroBiography?
	var appearance: HeroAppearance?
	var images: HeroImages?
}

struct HeroAppearance: Decodable {
	var gender: String?
	var race: String?
	var eyeColor: String?
	var hairColor: String?
}

struct HeroBiography: Decodable {
	var fullName: String?
	var alterEgos: String?
	var aliases: [String]?
	var placeOfBirth: String?
	var publisher: String?
	var alignment: String?
}

struct HeroImages: Decodable {
	var xs: String?
	var sm: String?
}
