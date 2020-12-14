//
//  InvoiceVC.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 05/11/20.
//

import UIKit


class InvoiceVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: InvoiceVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
    
        self.showLoading()
    
        self.viewModel?.loadCardListElement(completion: { (success, error) in
            
            if success {
                
                DispatchQueue.main.async {
                    
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.hiddenLoading()
                }

            }else{
                
                print(error)
            }
            
        })
        
        
        // Do any additional setup after loading the view.
    }
}

extension InvoiceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: ExtratoCell? = tableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as? ExtratoCell
        
        self.viewModel?.loadCurrentInvoice(index: indexPath.row)
        cell?.setup(value: self.viewModel)
        
        return cell ?? UITableViewCell()
    }
}
