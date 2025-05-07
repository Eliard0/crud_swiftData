//
//  EditTask.swift
//  crudSwiftData
//
//  Created by Eliardo Venancio on 07/05/25.
//

import SwiftUI
import SwiftData

struct EditTask: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @Bindable var task: ModelTask
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section {
                        TextField("Título", text: $task.titleTask)
                            .lineLimit(1)
                        TextField("Descrição", text: $task.descriptionTask, axis: .vertical)
                            .lineLimit(5, reservesSpace: true)
                    }
                    
                    Section {
                        Button("Salvar") {
                            do {
                                try context.save()
                                dismiss()
                            }catch {
                                print("Nao alterado")
                            }
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
                    }
                }
                
            }
            .navigationTitle("Editar Tarefa")
            .background(.red)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ModelTask.self, configurations: config)
    EditTask(task: ModelTask(title: "Tarefa de Exemplo", description: "Descrição de Exemplo"))
        .modelContainer(container)
}
