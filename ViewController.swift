//
//  ViewController.swift
//  ChatApp
//
//  Created by Shweta Gupta on 13/10/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var messages: [String] = []
    let webSocketManager = WebSocketManager.shared

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // Connect to the WebSocket
        webSocketManager.connect()
        self.tableView.register(UINib(nibName: "ChatTableViewCell",bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .lightGray
        
//        let sendMessage1 = "Hello, World!"
//        let sendMessage2 = "He"
//        let sendMessage3 = "Hello, Wor"
//        let sendMessage4 = "Hello, "
//        let sendMessage5 = "Hello, W!"
//        messages.append(sendMessage1)
//        messages.append(sendMessage2)
//        messages.append(sendMessage3)
//        messages.append(sendMessage4)
//        messages.append(sendMessage5)
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: ChatTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell") as! ChatTableViewCell
        
        cell.textMessageView.layer.cornerRadius = 8.0
        cell.textMessageView.backgroundColor = .cyan
        
        //send message
        cell.messageLabel.text = "Hello World!!!"
        webSocketManager.sendMessage(message: cell.messageLabel.text ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

