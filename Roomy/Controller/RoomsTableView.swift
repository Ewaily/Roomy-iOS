//
//  ViewController.swift
//  Roomy
//
//  Created by Muhammad Ewaily on 7/9/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import NVActivityIndicatorView
import UIKit

class RoomsTableView: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet private var roomsTableView: UITableView!
    var Rooms: [Room] = []
    var currentIndex = 0
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimating()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(loggingOut)), animated: true)
        roomsTableView.addSubview(refresher)
        let myXibFile = UINib(nibName: "RoomyCell", bundle: nil)
        roomsTableView.register(myXibFile, forCellReuseIdentifier: "roomyCell")
        handleRooms()
    }
    
    lazy private var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRooms), for: .valueChanged)
        return refresher
    }()
    
    @objc private func signOutButton() {
        UserDefaults.standard.removeObject(forKey: "auth_token")
        let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "start")
        present(tab, animated: true)
    }
    
    @objc private func handleRooms() {
        refresher.endRefreshing()
        if Connectivity.isConnectedToInternet() {
            GetRooms.getRoomsFromBackend { (_: Error?, Rooms: [Room]?) in
                if let Rooms = Rooms {
                    self.Rooms = Rooms
                    self.roomsTableView.reloadData()
                }
            }
            stopAnimating()
        }
        else {
            GetRooms.getRoomsFromRealm { (_: Error?, Rooms: [Room]?) in
                if let Rooms = Rooms {
                    self.Rooms = Rooms
                    self.roomsTableView.reloadData()
                }
            }
            stopAnimating()
        }
    }
    
    @objc private func loggingOut() {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to logout?", preferredStyle: .alert)
        
        let mode1 = UIAlertAction(title: "Yes", style: .default, handler: {
            _ in
            self.signOutButton()
        })
        let mode2 = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(mode1)
        alert.addAction(mode2)
        
        present(alert, animated: true, completion: nil)
    }
}

extension RoomsTableView: UITableViewDelegate {}

extension RoomsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = Rooms[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomyCell") as! CustomRoomCell
        cell.configureCell(roomyData: room)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "descriptionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RoomDescription {
            destination.desc = Rooms[currentIndex]
        }
    }
}

extension RoomsTableView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
