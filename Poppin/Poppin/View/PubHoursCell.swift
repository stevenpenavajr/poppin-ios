// File: PubHoursCell.swift
// Purpose: <enter purpose>
// Date Created: 12/11/18
// Created By: Steven Penava

import UIKit

class PubHoursCell: UITableViewCell {
    
    @IBOutlet weak var hoursTitleLabel: UILabel!
    @IBOutlet weak var hoursTextView: UITextView!
    
    let days = [
        "1": "Sunday",
        "2": "Monday",
        "3": "Tuesday",
        "4": "Wednesday",
        "5": "Thursday",
        "6": "Friday",
        "7": "Saturday"
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hoursTextView.isEditable = false
        hoursTextView.isScrollEnabled = false
        hoursTextView.textColor = .black
        hoursTextView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        
        hoursTitleLabel.textColor = .black
        hoursTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        /* fixing padding / margins */
        hoursTextView.textContainer.lineFragmentPadding = 0
        hoursTextView.textContainerInset = .zero
        
        /* setting text */
        hoursTitleLabel.text = "Hours"
        
        /* make cell not selectable */
        self.selectionStyle = .none


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureHours(withPub pub: Pub) {
        
        var hoursText = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        
        for i in 1..<8 {
            let day = days[String(i)]
            let startTime = dateFormatter.string(from: pub.hours?[String(i)]?[0] ?? Date())
            let endTime = dateFormatter.string(from: pub.hours?[String(i)]?[1] ?? Date())

            if (i == 1 || i == 6) {
                hoursText += "\(day ?? "Day"): \t\t\t\(startTime) - \(endTime)\n\n"
            } else {
                hoursText += "\(day ?? "Day"): \t\t\(startTime) - \(endTime)\n\n"
            }
            
        }
        
        hoursTextView.text = hoursText
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let hoursTitleLabelHeight = hoursTitleLabel.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let hoursTextViewHeight = hoursTextView.sizeThatFits(CGSize(width: size.width - 40.0, height: size.height)).height
        let calculatedHeight = hoursTitleLabelHeight + hoursTextViewHeight + 10
        return CGSize(width: size.width, height: calculatedHeight)
    }

}
