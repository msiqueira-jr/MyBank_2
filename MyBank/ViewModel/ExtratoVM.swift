//
//  ExtratoVM.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 03/11/20.
//

import Foundation

enum TipoLancamentoElement: String {
    
    case s = "S"
    case e = "E"
}

class ExtratoVM {
    
    private var movimentacao: Movimentacao?
    
    private var worker: ExtratoWorker = ExtratoWorker()
    
    private var currentLancamentoElement: LancamentoElement?
    
    func loadExtrato() {
    
        self.movimentacao = self.worker.loadExtrato()
    }
    
    func loadCurrentLancamentoElement(index: IndexPath) {
        self.currentLancamentoElement = movimentacao?.lancamentos[index.row]
    }
    
    var id: String {
        return self.currentLancamentoElement?.id ?? ""
    }
    
    var nome: String {
        return self.currentLancamentoElement?.nome ?? ""
    }
    
    var data:String {
        return self.currentLancamentoElement?.data ?? ""
    }
    
    var valor:String{
        return "R$ \(String(format: "%.2f", self.currentLancamentoElement?.valor ?? 0))"
    }
    
    var tipo: TipoLancamentoElement {
        return TipoLancamentoElement(rawValue: (self.currentLancamentoElement?.tipo) ?? "") ?? .s
    }
    
    var numberOfRows: Int {
        return self.movimentacao?.lancamentos.count ?? 0
    }
    
}
