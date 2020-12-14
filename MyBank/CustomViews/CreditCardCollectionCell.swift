//
//  CreditCardCollectionCell.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 29/10/20.
//

import UIKit

class CreditCardCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var flagLabel: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var cardBackGroundImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(value: CartoesElement?) {
        
        if let _value = value {
            
            self.nameLabel.text = _value.nome
            self.numberLabel.text = _value.numero
            self.dateLabel.text = _value.data
            self.flagLabel.image = UIImage(named: _value.bandeira)
            self.cardBackGroundImage.image = UIImage(named: "fundo-visa")
            self.cardBackGroundImage.layer.cornerRadius = 4
            self.containerView.layer.cornerRadius = 4
            
            if _value.bandeira == "mastercard" {
                
                self.nameLabel.textColor = .lightGray
                self.numberLabel.textColor = .lightGray
                self.dateLabel.textColor = .lightGray
                self.lineView.backgroundColor = .lightGray
                self.cardBackGroundImage.image = UIImage(named: "fundo-master")
            }

        }
        
    }

}
