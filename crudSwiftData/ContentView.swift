//
//  ContentView.swift
//  crudSwiftData
//
//  Created by Eliardo Venancio on 07/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query var tasks: [ModelTask]
    @State var showViewNewTask: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach(tasks) { task in
                        NavigationLink {
                            EditTask(task: task)
                        } label: {
                            HStack {
                                Image(systemName: task.isCompletedTask ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompletedTask ? .green : .red)
                                    .onTapGesture {
                                        task.isCompletedTask.toggle()
                                        try? context.save()
                                    }
                                
                                VStack(alignment: .leading){
                                    Text(task.titleTask)
                                        .font(.headline)
                                        .lineLimit(1)
                                    Text(task.descriptionTask)
                                        .font(.subheadline)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Tarefas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showViewNewTask = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showViewNewTask){
                NewTask()
            }
        }
    }
}

#Preview {
    NavigationStack{
        ContentView()
            .modelContainer(for: ModelTask.self, inMemory: true)
    }
}
