//
//  CreditCardVM.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 03/11/20.
//

import Foundation

class CreditCardVM {
    
    private var cartoes: Cartoes?
    private var worker: CreditCardWorker = CreditCardWorker()
    private var isReload: Bool = false
   
    var cartoesLoad: Cartoes? {
        
        return self.cartoes
    }
    
    func loadCreditCard() {
        self.cartoes = self.worker.loadCreditCard()
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func appendCreditCard(card: CartoesElement?) {
        
        if let _card = card {
            
            self.cartoes?.cartoes.append(_card)
            self.isReload = true
        }
    }
    
    var reloadCollection: Bool {
        
        return self.isReload
    }
    
    
    
    

}
