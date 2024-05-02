//
//  ListingCell.swift
//  InvadeTask
//
//  Created by Ahmed Kamal on 01/05/2024.
//

import UIKit

class ListingCell: UITableViewCell, ListingCellView {

    //MARK: - out let
    @IBOutlet weak var universityName: UILabel!
    @IBOutlet weak var universityState: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - configure cell
    func configure(viewModel: ListingModel) {
        universityName.text = viewModel.name ?? ""
        universityState.text = viewModel.stateprovince ?? ""
    }
    
}
