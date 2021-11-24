//
//  PlayerTableViewCell.swift
//  Choose Players
//
//  Created by YashraJ Gujar on 24/11/21.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
	
	//MARK: OUTLETS
	@IBOutlet weak var playerName: UILabel!
	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var playerScore: UILabel!
	
	//MARK: PROPERTIES
	static let reuseIdentifier = "PlayerTableViewCell"

	//MARK: LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
		 
	 }
    
	@IBAction func stepperTapped(_ sender: UIStepper) {
		
	}
}
