//
//  ViewController.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 29/10/20.
//

import UIKit

class CreditCardVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CreditCardVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CreditCardContainerCell", bundle: nil), forCellReuseIdentifier: "CreditCardContainerCell")
        
        
        self.viewModel = CreditCardVM()
        self.viewModel?.loadCreditCard()
        
        
        if self.viewModel?.cartoesLoad != nil {
            self.tableView.delegate = self
            self.tableView.dataSource = self
        }
        
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

}

extension CreditCardVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CreditCardContainerCell? =  tableView.dequeueReusableCell(withIdentifier: "CreditCardContainerCell", for: indexPath) as? CreditCardContainerCell
        cell?.delegate = self
        
        cell?.setup(value:self.viewModel?.cartoesLoad, isReload: self.viewModel?.reloadCollection ?? false)
        
        return cell ?? UITableViewCell()
        
    }    
}

extension CreditCardVC: CreditCardContainerCellDelegate {
   
    func tappedAddCreditCardCell() {
        print("CreditCardVC===>CreditCardContainerCellDelegate====>tappedAddCreditCardCell")
        
        self.performSegue(withIdentifier: "AddCreditCard", sender: nil)
    }
    
    func tappedButton() {
        
        
        print("CreditCardVC===>CreditCardContainerCellDelegate====>tappedButton")
        self.performSegue(withIdentifier: "AddCreditCard", sender: nil)
    }
    
    func tappedCreditCard(id: String) {
        self.performSegue(withIdentifier: "InvoiceVC", sender: id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "InvoiceVC" {
            
            let vc: InvoiceVC? =  segue.destination as? InvoiceVC
            
            vc?.viewModel = InvoiceVM(cardId: sender as? String, cardListElement: nil, currentInvoice: nil)
        }else if segue.identifier == "AddCreditCard" {
            
            let vc: AddCreditCardVC?  = segue.destination as? AddCreditCardVC
            
            vc?.delegate = self
            
        }
        
    }
}

extension CreditCardVC: AddCreditCardVCDelegate {
   
    func successAddCreditCard(card: CartoesElement?) {
        print(card?.nome)
        self.viewModel?.appendCreditCard(card: card)
        self.tableView.reloadData()
    }
}
