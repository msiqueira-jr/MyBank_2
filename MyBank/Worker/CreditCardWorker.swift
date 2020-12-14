//
//  CreditCardWorker.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 05/11/20.
//

import Foundation


class CreditCardWorker {
    
    func loadCreditCard() -> Cartoes? {
        
        if let path = Bundle.main.path(forResource: "cartoes", ofType: "json"){
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let cartoes = try JSONDecoder().decode(Cartoes.self, from: data)
                
                print("=======>cartoes\(cartoes)")
                
                return cartoes
                
            }catch{
                print("Deu ruim no parse")
                
            }

        }
        return nil
    }
    
}
