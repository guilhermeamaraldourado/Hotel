//
//  CellHotelInfo.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 21/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelInfo: UITableViewCell {
    
    @IBOutlet weak var lblNomeHotel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
