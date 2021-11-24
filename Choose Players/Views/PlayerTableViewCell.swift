//
//  PlayerTableViewCell.swift
//  Choose Players
//
//  Created by YashraJ Gujar on 24/11/21.
//

import UIKit

protocol PlayerTableViewCellDelegate: AnyObject {
	func didUpdateScore(score: Double,index:Int)
}

class PlayerTableViewCell: UITableViewCell {
	
	//MARK: OUTLETS
	@IBOutlet weak var playerName: UILabel!
	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var playerScore: UILabel!
	
	var playerData: PlayerModel? {
		didSet {
			configureUI()
		}
	}
	
	//MARK: PROPERTIES
	static let reuseIdentifier = "PlayerTableViewCell"
	weak var delegate: PlayerTableViewCellDelegate?
	
	//MARK: LIFECYCLE
	override func awakeFromNib() {
		super.awakeFromNib()
		setupUI()
	}
	
	//MARK: CONFIGURE
	private func setupUI(){
		selectionStyle = .blue
		playerScore.text = nil
		stepper.value = 0
		stepper.maximumValue = 10
		stepper.minimumValue = -10
		stepper.autorepeat = true
		stepper.isContinuous = true
	}
	
	override func prepareForReuse() {
		playerScore.text = "0"
		stepper.value = 0
		stepper.maximumValue = 10
		stepper.minimumValue = -10
	}
	
	//MARK: CONFIGURE
	private func configureUI(){
		guard let data = self.playerData else {return}
		playerName.text = data.name
		playerScore.text = "\(data.score)"
		if data.isSelected {
			accessoryType = .checkmark
		} else {
			accessoryType = .none
		}
	}
	
	//MARK: ACTIONS
	@IBAction func stepperTapped(_ sender: UIStepper) {
		guard let data = self.playerData else {return}
		delegate?.didUpdateScore(score: data.score + sender.value, index: self.tag)
	}
}
