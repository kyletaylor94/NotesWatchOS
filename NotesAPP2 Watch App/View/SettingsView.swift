//
//  SettingsView.swift
//  NotesAPP2 Watch App
//
//  Created by Turdesán Csaba on 20/07/2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("linecount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
        
    }
    
    var body: some View {
        VStack(spacing: 8){
            Text("Settings".uppercased())
                .foregroundStyle(.accent)
                .font(.title3)
                .bold()
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accent)
            
            Text("Lines \(lineCount)".uppercased())
                .bold()
            
            Slider(value: Binding(get:{
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }),in: 1...4, step: 1)
                .accentColor(.accent)
        }
    }
}

#Preview {
    SettingsView()
}
