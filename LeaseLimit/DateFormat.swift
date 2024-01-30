//
//  DateFormat.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/10/24.
//

import Foundation

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter.string(from: date)
}
