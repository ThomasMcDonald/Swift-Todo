//
//  details
//  Todoo
//
//  Created by Thomas McDonald on 21/3/18.
//  Copyright © 2018 Thomas McDonald. All rights reserved.
//

import UIKit


/**
 This class handles the Table View cells and its contents
 */
class detailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var taskHistory: UITextField!
    @IBOutlet weak var historyDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    /**
     Sets the selected state of the cell, optionally animating the transition between states.
     */
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
