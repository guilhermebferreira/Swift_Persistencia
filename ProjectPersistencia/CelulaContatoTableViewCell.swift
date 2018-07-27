//
//  CelulaContatoTableViewCell.swift
//  ProjectPersistencia
//
//  Created by labmacmini12 on 27/07/2018.
//  Copyright © 2018 cursoIOS. All rights reserved.
//

import UIKit

class CelulaContatoTableViewCell: UITableViewCell {

    @IBOutlet weak var vrImage: UIImageView!
    @IBOutlet weak var vrNome: UILabel!
    @IBOutlet weak var vrPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
