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

            var configuration = Configuration()

            // weekend customization
            configuration.weekendDayStyle.dateTextColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)
            configuration.weekendDayStyle.dateTextFont = UIFont.boldSystemFont(ofSize: 20)
            configuration.weekendDayStyle.weekDayTextColor = UIColor(red: 242.0/255.0, green: 93.0/255.0, blue: 28.0/255.0, alpha: 1.0)

            // selected date customization
            configuration.selectedDayStyle.backgroundColor = UIColor(white: 0.9, alpha: 1)
            configuration.daySizeCalculation = .numberOfVisibleItems(5)

            datepicker.configuration = configuration
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
    
    @IBAction func goToCurrentDate(_ sender: UIButton) {
        datepicker.selectedDate = Date()
        datepicker.scrollToSelectedDate(animated: true)
        showSelectedDate()
    }

}


// MARK: - ScrollableDatepickerDelegate

extension ViewController: ScrollableDatepickerDelegate {

    func datepicker(_ datepicker: ScrollableDatepicker, didSelectDate date: Date) {
        showSelectedDate()
    }
    
}
