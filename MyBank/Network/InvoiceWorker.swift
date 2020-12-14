//
//  InvoiceWorker.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 03/12/20.
//

import Foundation



class InvoiceWorker {
    
    
    typealias  completion <T> = (_ result: T, _ failure: String?) -> Void
    
    
    func getInvoice(cardID: String, completion: @escaping completion<CardListElement?>) {
        
        
        let session: URLSession = URLSession.shared
        
        let url: URL? = URL(string: "https://api.mocki.io/v1/b6dfe7f3")
        
        if let _url = url {
            
            let task: URLSessionTask = session.dataTask(with: _url) { (data, response, error) in
                
                
                do {
                    
                    let listInvoice = try JSONDecoder().decode(CardList.self, from: data ?? Data())
                    
                    if let _listInvoice = listInvoice.cardList {
                        
                        let cardElement = _listInvoice.filter({$0.cardID == cardID})
                        completion(cardElement.first, nil)
                        
                    }else {
                        
                        completion(nil, "Deu ruim")
                    }

                }catch {
                    completion(nil, "deu ruim no catch")
                }
                
            }
            
            task.resume()
            
        }
        
        
    }
    
    
    
    
    
    
}
