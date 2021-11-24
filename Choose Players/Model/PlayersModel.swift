//
//  PlayersModel.swift
//  Choose Players
//
//  Created by YashraJ Gujar on 24/11/21.
//

import Foundation
struct PlayerModel {
	
	var name: String = ""
	var isSelected: Bool = false
	var score: Double = 0
	
	 init(name: String,isSelected: Bool,score: Double) {
		self.name = name
		self.isSelected = isSelected
		self.score = score
	}
}
