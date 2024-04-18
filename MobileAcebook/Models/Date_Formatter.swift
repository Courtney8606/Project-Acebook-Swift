//
//  Date_Formatter.swift
//  MobileAcebook
//
//  Created by Rachel Turrell on 17/04/2024.
//

import Foundation


func formattedDate(from dateString: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            if let date = isoFormatter.date(from: dateString) {
                return dateFormatter.string(from: date)
        } else {
            return "Invalid date format"
        }
    }

let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy h:mm a"
        return formatter
    }()
