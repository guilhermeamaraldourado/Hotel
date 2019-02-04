//
//  CellEscolherQuarto.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 23/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellEscolherQuarto: UITableViewCell {
    
    @IBOutlet weak var btnEscolher: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnEscolher.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func escolherQuarto(sender: UIButton){
        
    }
}
