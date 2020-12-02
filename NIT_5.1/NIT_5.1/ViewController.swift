//
//  ViewController.swift
//  NIT_5.1
//
//  Created by Родион Сприкут on 02.12.2020.
//

import UIKit

var cellLabelTexts = ["First", "Second", "Third", "Forth", "Fifth", "Sixth", "Seventh", "Eights", "Ninth", "Tenths", "Eleventh", "Twelfth", "I", "Do", "Not", "Want", "To", "Write", "Any", "More", "Numbers", "Here"]

class ViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
    }
}


extension ViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellLabelTexts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! CustomTableViewCell
        cell.cellLabel.text = cellLabelTexts[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        headerLabel.text = cellLabelTexts[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: CustomTableViewCellDelegate {
    func didTapButton() {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "CollectionVC")
        self.navigationController!.pushViewController(controller, animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let controller = storyboard.instantiateViewController(identifier: "CollectionVC")
//        self.navigationController?.pushViewController(controller, animated: true)
    }
}
