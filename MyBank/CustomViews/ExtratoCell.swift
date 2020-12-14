//
//  ExtratoCell.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 03/11/20.
//

import UIKit

class ExtratoCell: UITableViewCell {
   
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var extratoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: InvoiceVM?) {
        
        if let _vm = value {
            
            self.descriptionLabel.text = _vm.nome
            self.valueLabel.text = _vm.valor
            self.extratoImage.image = UIImage.init(systemName:"dollarsign.circle")
            
            if _vm.tipo == .e {
                self.extratoImage.tintColor = UIColor(rgb: 0xA3F7AB)
            }else{
                self.valueLabel.textColor = .red
                self.extratoImage.tintColor = .red
            }
        }
    }
    
    func setup(value: ExtratoVM?) {
        
        if let _vm = value {
            
            self.descriptionLabel.text = _vm.nome
            self.valueLabel.text = _vm.valor
            self.extratoImage.image = UIImage.init(systemName:"dollarsign.circle")
            
            if _vm.tipo == .e {
                self.extratoImage.tintColor = UIColor(rgb: 0xA3F7AB)
            }else{
                self.valueLabel.textColor = .red
                self.extratoImage.tintColor = .red
            }
        }
    }
}


extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
