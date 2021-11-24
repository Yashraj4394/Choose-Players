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
	
	private var playerNames = ["A","B","C","D","E","F","G","H","I","J"]
	
	//MARK: LIFECYCLE
	override func viewDidLoad() {
		super.viewDidLoad()
		configureTableView()
	}
	
	//MARK:- CONFIGURE
	
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
		
	}
	
	@IBAction func moveToLeft(_ sender: UIButton) {
		
	}
	
	//MARK: HELPERS
}

//MARK: TABLEVIEW DATASOURCE
extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playerNames.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.reuseIdentifier, for: indexPath) as? PlayerTableViewCell {
			cell.playerName.text = playerNames[indexPath.row]
			return cell
		}
		return UITableViewCell()
	}
}

//MARK: TABLEVIEW DELEGATE
extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 45
	}
}








