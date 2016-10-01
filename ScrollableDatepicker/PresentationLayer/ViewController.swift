//
//  Created by Dmitry Ivanenko on 01.10.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  @IBOutlet weak var datepicker: ScrollableDatepicker! {
    didSet {
      var dates = [Date]()
      for day in 0...60 {
        dates.append(Date(timeIntervalSinceNow: Double(day * 86400)))
      }
      
      datepicker.dates = dates
      datepicker.delegate = self
    }
  }
  @IBOutlet weak var selectedDateLabel: UILabel!
  
}


// MARK: - ScrollableDatepickerDelegate

extension ViewController: ScrollableDatepickerDelegate {
  
  func datepicker(_ datepicker: ScrollableDatepicker, didSelectDate date: Date) {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM YYYY"
    selectedDateLabel.text = formatter.string(from: date)
  }
  
}
