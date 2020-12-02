//
//  CustomTableViewCell.swift
//  NIT_5.1
//
//  Created by Родион Сприкут on 02.12.2020.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapButton()
}

class CustomTableViewCell: UITableViewCell {

    weak var delegate: CustomTableViewCellDelegate?
    
    static func nib() -> UINib {
        return UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var nextScreenButton: UIButton!
    @IBAction func nextScreenButton(_ sender: Any) {
        delegate?.didTapButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
