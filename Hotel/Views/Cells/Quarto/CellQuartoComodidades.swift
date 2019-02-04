//
//  CellQuartoComodidades.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 21/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellQuartoComodidades: UITableViewCell {

    @IBOutlet weak var viewComodidades: UIView!
    @IBOutlet weak var btnVerMais: UIButton!
    var yPosition: CGFloat = 2
    
    var comodidades: [Comodidade]?{
        didSet{
            if let coms = comodidades{
                for comodidade in coms{
                    
                    let label = UILabel(frame: CGRect(x: 1, y: yPosition, width: viewComodidades.frame.width - 32, height: 36))
                    label.adjustsFontSizeToFitWidth = true
                    label.numberOfLines = 0
                    label.textColor = UIColor.darkGray
                    
                    let atributes = NSMutableAttributedString(string: "", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)])
                    let attachment = NSTextAttachment()
                    attachment.image = UIImage(named:"comodidade\(comodidade.Code!)")
                    attachment.bounds = CGRect(x: 0, y: -2, width: 21, height: 21)
                    atributes.append(NSAttributedString(attachment: attachment))
                    atributes.append(NSMutableAttributedString(string: "  \(comodidade.Name!)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17)]))
                    
                    label.attributedText = atributes
                    viewComodidades.addSubview(label)
                    yPosition += CGFloat(36)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
