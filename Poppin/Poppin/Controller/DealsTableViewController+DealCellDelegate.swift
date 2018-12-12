//
//  DealsTableViewController+DealCellDelegate.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/12/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//


import UIKit

extension DealsTableViewController: DealCellDelegate {
    
    func dealCell(_ dealCell: DealCell, didShareDeal deal: Deal) {
        self.shareDeal(deal)
    }
    
}
