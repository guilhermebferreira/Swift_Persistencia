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
    
    //Variavel do tipo computed property que retorna objeto do tipo contexto a partir da classe app delegate
    var context:NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

