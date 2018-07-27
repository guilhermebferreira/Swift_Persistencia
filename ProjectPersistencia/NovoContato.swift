//
//  NovoContato.swift
//  ProjectPersistencia
//
//  Created by labmacmini12 on 27/07/2018.
//  Copyright © 2018 cursoIOS. All rights reserved.
//

import UIKit

class NovoContato: UIViewController {

    @IBOutlet weak var vrImage: UIImageView!
    @IBOutlet weak var vrNome: UITextField!
    
    @IBOutlet weak var vrPhone: UITextField!
    
    @IBAction func handleFindImage(_ sender: UIButton) {
    }
    
    @IBAction func handleCancel(_ sender: UIButton) {
    }
    
    @IBAction func handleAdd(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
