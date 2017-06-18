//
//  Created by Dmitry Ivanenko on 01.10.16.
//  Copyright © 2016 Dmitry Ivanenko. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var datepicker: ScrollableDatepicker! {
        didSet {
            var dates = [Date]()
            for day in -15...15 {
                dates.append(Date(timeIntervalSinceNow: Double(day * 86400)))
            }

            datepicker.dates = dates
            datepicker.selectedDate = Date()
            datepicker.delegate = self
        }
    }
    @IBOutlet weak var selectedDateLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.showSelectedDate()
            self.datepicker.scrollToSelectedDate(animated: false)
        }
    }

    fileprivate func showSelectedDate() {
        guard let selectedDate = datepicker.selectedDate else {
            return
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM YYYY"
        selectedDateLabel.text = formatter.string(from: selectedDate)
    }

}


// MARK: - ScrollableDatepickerDelegate

extension ViewController: ScrollableDatepickerDelegate {

    func datepicker(_ datepicker: ScrollableDatepicker, didSelectDate date: Date) {
        showSelectedDate()
    }
    
}
