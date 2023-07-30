//
//  InfoView.swift
//  NotesAPP2 Watch App
//
//  Created by Turdesán Csaba on 20/07/2023.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var present
    
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String{
        return "illustrationNo\(randomNumber)"
    }
    
    var body: some View {
        VStack(spacing: 5){
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            Text("Credits".uppercased())
                .foregroundStyle(.accent)
                .bold()
                .font(.title2)
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                    .imageScale(.large)
                
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accent)
            
            Text("Turdesán Csaba")
                .bold()
                .foregroundStyle(.primary)
            
            Text("Developer")
                .foregroundStyle(.secondary)
                
        }
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    present.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.white)
                })
            }
        }
    }
}

#Preview {
    NavigationView{
        InfoView()
    }
}
