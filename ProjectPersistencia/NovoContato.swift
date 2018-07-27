//
//  NovoContato.swift
//  ProjectPersistencia
//
//  Created by labmacmini12 on 27/07/2018.
//  Copyright © 2018 cursoIOS. All rights reserved.
//

import UIKit
import CoreData

class NovoContato: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var vrImage: UIImageView!
    @IBOutlet weak var vrNome: UITextField!
    
    @IBOutlet weak var vrPhone: UITextField!
    
    
    //Variavel do tipo computed property que retorna objeto do tipo contexto a partir da classe app delegate
    var context:NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    //trata o desaparecimento do teclado quando houver um toque na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //liberar modo de edição ao clicar na tela
        vrPhone.resignFirstResponder()
        vrNome.resignFirstResponder()
    }
    
    
    
    @IBAction func handleFindImage(_ sender: UIButton) {
        let photo = UIImagePickerController()
        photo.sourceType = .savedPhotosAlbum
        

        //será necessario implementar o delegate que será chamado quando a foto for selecionada e o album retornar
        photo.delegate = self
        
        //para usar a camera
        //no arquivo Info.plist -> adicionar privacy - camera usage description
        //      photo.sourceType = .camera
        
        self.present(photo, animated: true, completion: nil)
        
    }
    
    //metodo delegate chamado após uma foto ser selecionada
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //busca os dados da imagem no dicionario retornado
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        //seta o imageview da tela com a imagem selecionada
        vrImage.image = photo
        //garante a saida do picker da tela
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func handleCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleAdd(_ sender: UIButton) {
        //cria uma variavel do tipo contact (criada anteriormente no CoreData)
        let contact = Contact(context: context)
        contact.name = vrNome.text
        contact.fone = vrPhone.text
        contact.photo = vrImage.image
        
        do{
            try context.save()
            //chamado para retirar a tela de formulário e retornar para a tela de lista
            self.dismiss(animated: true, completion: nil)
        }catch{}
        
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
