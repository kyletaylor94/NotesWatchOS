//
//  ContentView.swift
//  NotesAPP2 Watch App
//
//  Created by Turdesán Csaba on 20/07/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    func save(){
        // dump(notes)
        do{
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDiretory().appendingPathComponent("notes")
            
            try data.write(to: url)
        } catch{
            print("saving data has failed")
        }
        
    }
    
    func load(){
        DispatchQueue.main.async {
            do{
                let url = getDocumentDiretory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch{
                print("load data has failed")
            }
        }
    }
    
    func delete(offsets: IndexSet){
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    func getDocumentDiretory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    var body: some View {
        NavigationView{
            VStack {
                HStack(alignment: .center, spacing: 6){
                    TextField("Add New note", text: $text)
                    
                    Button(action: {
                        guard text.isEmpty == false else { return }
                        let note = Note(id: UUID(), text: text)
                        
                        notes.append(note)
                        text = ""
                        
                        save()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    })
                    .fixedSize()
                    
                    .buttonStyle(.plain)
                    .foregroundColor(.accentColor)
                    
                }
                
                Spacer()
                
                if notes.count >= 1 {
                    List{
                        ForEach(0..<notes.count, id: \.self){ i in
                            NavigationLink {
                                DetailView(note: notes[i], count: notes.count, index: i)
                            } label: {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }

                       
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .onAppear{
                load()
            }
        }
    }
}

#Preview {
    ContentView()
}
