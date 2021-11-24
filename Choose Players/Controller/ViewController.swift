//
//  ViewController.swift
//  Choose Players
//
//  Created by YashraJ Gujar on 24/11/21.
//

import UIKit

class ViewController: UIViewController {
	
	//MARK: OUTLETS
	@IBOutlet weak var playerListTableView: UITableView!
	@IBOutlet weak var selectedPlayersTableView: UITableView!
	
	//MARK: PROPERTIES
	private var playersData : [PlayerModel] = {
		return [PlayerModel(name: "A", isSelected: false, score: 0),
				  PlayerModel(name: "B", isSelected: false, score: 0),
				  PlayerModel(name: "C", isSelected: false, score: 0),
				  PlayerModel(name: "D", isSelected: false, score: 0),
				  PlayerModel(name: "E", isSelected: false, score: 0),
				  PlayerModel(name: "F", isSelected: false, score: 0),
				  PlayerModel(name: "G", isSelected: false, score: 0),
				  PlayerModel(name: "H", isSelected: false, score: 0),
				  PlayerModel(name: "I", isSelected: false, score: 0),
				  PlayerModel(name: "J", isSelected: false, score: 0)]
	}()
	
	private var selectedPlayers: [PlayerModel] = [PlayerModel]()
	
	//MARK: LIFECYCLE
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTableView()
	}
	
	//MARK: CONFIGURE
	private func configureTableView(){
		playerListTableView.delegate = self
		playerListTableView.dataSource = self
		
		selectedPlayersTableView.delegate = self
		selectedPlayersTableView.dataSource = self
		
		playerListTableView.register(UINib(nibName: PlayerTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PlayerTableViewCell.reuseIdentifier)
		selectedPlayersTableView.register(UINib(nibName: PlayerTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PlayerTableViewCell.reuseIdentifier)
	}
	
	//MARK:- ACTIONS
	@IBAction func moveToRightTapped(_ sender: UIButton) {
		for (i,x) in self.playersData.enumerated() {
			if x.isSelected {
				selectedPlayers.append(x)
				playersData.remove(at: i)
			}
		}
		playersData.sort { value1, value12 in
			return value1.name < value12.name
		}
		
		selectedPlayers.sort { value1, value12 in
			return value1.name < value12.name
		}
		playerListTableView.reloadData()
		selectedPlayersTableView.reloadData()
	}
	
	@IBAction func moveToLeft(_ sender: UIButton) {
		for (i,x) in self.selectedPlayers.enumerated() {
			if x.isSelected {
				playersData.append(x)
				selectedPlayers.remove(at: i)
			}
		}
		playersData.sort { value1, value12 in
			return value1.name < value12.name
		}
		
		selectedPlayers.sort { value1, value12 in
			return value1.name < value12.name
		}
		playerListTableView.reloadData()
		selectedPlayersTableView.reloadData()
	}
}

//MARK: TABLEVIEW DATASOURCE
extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if tableView == playerListTableView {
			return playersData.count
		} else if tableView == selectedPlayersTableView {
			return selectedPlayers.count
		} else {return 0}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if tableView == playerListTableView {
			if let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.reuseIdentifier, for: indexPath) as? PlayerTableViewCell {
				cell.tag = indexPath.row
				cell.playerData = playersData[indexPath.row]
				cell.delegate = self
				return cell
			}
		} else if tableView == selectedPlayersTableView {
			if let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.reuseIdentifier, for: indexPath) as? PlayerTableViewCell {
				cell.tag = indexPath.row
				cell.playerData = selectedPlayers[indexPath.row]
				cell.stepper.isHidden = true
				cell.delegate = self
				return cell
			}
		}
		return UITableViewCell()
	}
}

//MARK: TABLEVIEW DELEGATE
extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if tableView == playerListTableView {
			self.playersData[indexPath.row].isSelected = !self.playersData[indexPath.row].isSelected
		} else if tableView == selectedPlayersTableView {
			self.selectedPlayers[indexPath.row].isSelected = !self.selectedPlayers[indexPath.row].isSelected
		}
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//		if tableView == playerListTableView {
//			self.playersData[indexPath.row].isSelected = !self.playersData[indexPath.row].isSelected
//		} else if tableView == selectedPlayersTableView {
//			self.selectedPlayers[indexPath.row].isSelected = !self.selectedPlayers[indexPath.row].isSelected
//		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 45
	}
}

//MARK: PLAYERTABLEVIEW DELEGATE
extension ViewController: PlayerTableViewCellDelegate {
	func didUpdateScore(score: Double, index: Int) {
		playersData[index].score = score
		self.playerListTableView.reloadData()
	}
}








