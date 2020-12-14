//
//  AccountBalanceVC.swift
//  MyBank
//
//  Created by Mauro Siqueira Jr on 03/11/20.
//

import UIKit

class AccountBalanceVC: UIViewController {

    @IBOutlet weak var timeLineTableView: UITableView!
    
    private var viewModel: ExtratoVM?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = ExtratoVM()
        self.viewModel?.loadExtrato()
        self.timeLineTableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
        
        self.timeLineTableView.delegate = self
        self.timeLineTableView.dataSource = self
        self.timeLineTableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
    }

}

extension AccountBalanceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ExtratoCell? = tableView.dequeueReusableCell(withIdentifier: "ExtratoCell", for: indexPath) as? ExtratoCell
        self.viewModel?.loadCurrentLancamentoElement(index: indexPath)
        cell?.setup(value: self.viewModel)
        
        return cell ?? UITableViewCell()
    }
}

