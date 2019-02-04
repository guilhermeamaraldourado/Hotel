//
//  CellQuartoDescricao.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 21/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellQuartoDescricao: UITableViewCell {
    
    @IBOutlet weak var lblDescricaoQuarto: UILabel!
    var delegate: verMais?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func verMais(_ sender: UIButton) {
        
        if let del = delegate{
            del.verMais()
        }
    }
}
