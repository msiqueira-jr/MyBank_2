//
//  ExtratoWorker.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 05/11/20.
//

import Foundation


class ExtratoWorker {
    
    func loadExtrato() -> Movimentacao? {
        
        if let path = Bundle.main.path(forResource: "despesas", ofType: "json"){
            
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let value = try JSONDecoder().decode(Movimentacao.self, from: data)
                
                print("=======>value\(value)")
                
               return  value
                
            }catch{
                print("Deu ruim no parse")
                
            }

        }
        return nil
    }
}
