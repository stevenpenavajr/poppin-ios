//
//  DealsTableViewController+MFMessageComposeViewControllerDelegate.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/12/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import MessageUI
import UIKit

extension DealsTableViewController: MFMessageComposeViewControllerDelegate {
    
    func shareDeal(_ deal: Deal) {
        if MFMessageComposeViewController.canSendText() {
            // TODO: Add link to app and deep-linking functionality when the app is live
            let controller = MFMessageComposeViewController()
            controller.body = "🍻Look at this deal from Poppin!🍻 \n\n\(deal.title ?? "") at \(deal.pub?.name ?? "") - \(deal.description ?? "") \n\nWe should check it out!"
            controller.recipients = []
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
