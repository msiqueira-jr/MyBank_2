//
//  InvoiceVM.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 05/11/20.
//

import Foundation

class InvoiceVM {
    
    typealias  completion <T> = (_ result: T, _ failure: String?) -> Void
   
    private var cardID: String? = ""
    
    private var cardListElement: CardListElement?
    
    private var currentInvoice: Invoice?
    
    init(cardId: String?, cardListElement: CardListElement?, currentInvoice: Invoice? = nil ) {
        
        self.cardID = cardId
        self.cardListElement = cardListElement
        self.currentInvoice = currentInvoice
    }
    
    func loadCardListElement(completion: @escaping completion<Bool>) {
        
        InvoiceWorker().getInvoice(cardID: self.cardID ?? "") { (response, error) in
            
            if let _response = response {
                
                self.cardListElement = _response
                completion(true, nil)
            }else{
                completion(false, error)
            }
        }
    }
    
    
    var numberOfRows: Int {
        return self.cardListElement?.invoice?.count ?? 0
    }
    
    func loadCurrentInvoice(index: Int) {
        self.currentInvoice = self.cardListElement?.invoice?[index]
    }
    
    var id: String {
        return self.currentInvoice?.id ?? ""
    }
    
    var nome: String {
        return self.currentInvoice?.nome ?? ""
    }
    
    var data:String {
        return self.currentInvoice?.data ?? ""
    }
    
    var valor:String{
        return "R$ \(String(format: "%.2f", self.currentInvoice?.valor ?? 0))"
    }
    
    var tipo: Tipo {
        
        if let _tipo = self.currentInvoice?.tipo {
            return _tipo
        }
        return .s
    }
}
