//
//  DetailTableCell.swift
//  RickandMortyApiTask
//
//  Created by Elena Noack on 27.11.22.
//

import UIKit

struct DetailTableCellViewModel: ViewModel {
    let textInfo: String
    let detailTextInfo: String
}

extension UITableViewCell {

    func configureCell(with viewModel: ViewModel) {
        guard let vm = viewModel as? DetailTableCellViewModel else { return }
        textLabel?.text = vm.textInfo
        detailTextLabel?.text = vm.detailTextInfo
    }
}

