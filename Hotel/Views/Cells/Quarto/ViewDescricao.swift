//
//  CellDescricao.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 22/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class ViewDescricao: UIViewController {

    @IBOutlet weak var lblDescricao: UILabel!
    var texto: String?
    
    override func viewDidLoad() {
        lblDescricao.text = texto!
    }

}
