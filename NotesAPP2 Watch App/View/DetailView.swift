//
//  DetailView.swift
//  NotesAPP2 Watch App
//
//  Created by Turdesán Csaba on 20/07/2023.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isTappedInfoButton: Bool = false
    @State private var isTappedGearButton: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
                
            }
            .foregroundColor(.accentColor)
            
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isTappedGearButton.toggle()
                    }
                    .sheet(isPresented: $isTappedGearButton, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
              
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isTappedInfoButton.toggle()
                    }
                .sheet(isPresented: $isTappedInfoButton, content: {
                    InfoView()
                })
                
         
            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

#Preview {
    DetailView(note: .init(id: UUID(), text: "asd"), count: 5, index: 1)
}
