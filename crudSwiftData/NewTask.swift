//
//  NewTask.swift
//  crudSwiftData
//
//  Created by Eliardo Venancio on 07/05/25.
//

import Foundation
import SwiftUI
import SwiftData

struct NewTask: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Titulo", text: $title)
                TextField("Descrição", text: $description, axis: .vertical)
                    .lineLimit(5, reservesSpace: true)
            }
            .navigationTitle("Adicionar Tarefa")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancelar"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Adicionar"){
                        addNewTask()
                    }
                    .disabled(description.isEmpty)
                }
            }
            
        }
    }
    
    private func addNewTask(){
        let titleValidatio = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let decriptionValidation = description.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if titleValidatio.isEmpty || decriptionValidation.isEmpty {
            return
        }
        
        let newTask = ModelTask(title: titleValidatio, description: decriptionValidation)
        
        context.insert(newTask)
        do {
            try context.save()
            dismiss()
        } catch {
            print("Erro ao cadastrar a tarefa")
        }
    }
}

#Preview {
    NewTask()
        .modelContainer(for: ModelTask.self, inMemory: true)
}
