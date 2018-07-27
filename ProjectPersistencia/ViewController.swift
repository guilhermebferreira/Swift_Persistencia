//
//  ViewController.swift
//  ProjectPersistencia
//
//  Created by labmacmini12 on 27/07/2018.
//  Copyright © 2018 cursoIOS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    
    

    @IBOutlet weak var vrTableView: UITableView!
    
    //referencia para a busca de objetos no contexto do core data
    var contactManager: NSFetchedResultsController<Contact>!
    
    //Variavel do tipo computed property que retorna objeto do tipo contexto a partir da classe app delegate
    var context:NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = contactManager.fetchedObjects!.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = vrTableView.dequeueReusableCell(withIdentifier: "cell") as! CelulaContatoTableViewCell
        
        //o fetchedObjects possui todos os objetos daquela busca
        let contact = contactManager.fetchedObjects![indexPath.row]
        
        cell.vrPhone.text = contact.fone
        cell.vrNome.text = contact.name
        
        if let image = contact.photo as? UIImage{
            cell.vrImage.image = image
        }else{
            cell.vrImage.image = nil
        }
        
        return cell
        
        
    }
    
    //metodo que busca os contatos na base
    private func getContacts(){
        //referencia a fetchrequest a partir da classe modelada no coredata
        let contactSearch:NSFetchRequest<Contact> = Contact.fetchRequest()
        
        //regra de ordenação por nome
        let sortParam = NSSortDescriptor(key: "name", ascending: true)
        //configura a regra de ordenação no objeto de busca
        contactSearch.sortDescriptors = [sortParam]
        //realiza a busca
        contactManager = NSFetchedResultsController(fetchRequest: contactSearch, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        do{
            //confirma a operação de busca
            try contactManager.performFetch()
        } catch{}
        //solicita que a table view rode novamente o protocolo de preenchimento
        vrTableView.reloadData()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

