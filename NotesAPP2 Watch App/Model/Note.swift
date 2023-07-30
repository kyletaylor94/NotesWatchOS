//
//  Note.swift
//  NotesAPP2 Watch App
//
//  Created by Turdesán Csaba on 20/07/2023.
//

import Foundation

struct Note: Identifiable, Codable{
    let id: UUID
    let text: String
}
