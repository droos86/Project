import SwiftUI

struct DataView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    @ObservedObject var databaseManager = DatabaseManager.shared
    
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
            
                List {
                    ForEach(databaseManager.moodData, id: \.id) { mood in
                        Text("\(dateFormatter.string(from: mood.date)): \(mood.mood)")
                    }
                    .onDelete(perform: deleteMood)
                }
                .onAppear {
                    // Fetch mood data when the view appears
//                    print("Fetching data...")
                    databaseManager.fetchAllMoodData()
//                    print("DataView displayed. Mood data count: \(databaseManager.moodData.count)")
                }
            }
            .navigationBarTitle("Data")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Done")
                            .font(.headline)
                            .bold()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: {
                            showingAlert = true
                        }) {
                            Label {
                                Text("Delete all data")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            } icon: {
                                Image(systemName: "trash")
                                    .foregroundColor(.blue)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Delete all data"),
                                message: Text("Do you really want to delete all data?"),
                                primaryButton: .destructive(Text("Yes!")) {
                                    deleteAllMoodDataFromDatabase()
                                },
                                secondaryButton: .cancel(Text("No, thanks"))
                            )
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            createTestDataFor2023()
                        }) {
                            Label {
                                Text("Create new data set")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                            } icon: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.blue)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .toolbarColorScheme(.dark)
            .toolbarBackground(.ultraThinMaterial)
        }
        .colorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
    
    
    private func deleteAllMoodDataFromDatabase() {
        // Modify the delete method to fetch data after deletion
        DatabaseManager.shared.deleteAllMoodData()
        
        // Fetch data again to refresh the view
        DispatchQueue.main.async {
            self.databaseManager.fetchAllMoodData()
        }
    }
    
    
    private func createTestDataFor2023() {
        DatabaseManager.shared.createTestData()
        
        // Fetch data again to refresh the view
        DispatchQueue.main.async {
            self.databaseManager.fetchAllMoodData()
        }
    }

    
    private func deleteMood(at offsets: IndexSet) {
        for index in offsets {
            let moodToDelete = databaseManager.moodData[index]
            
            // Delete the mood entry from the database
            databaseManager.deleteMoodEntry(moodToDelete)

            // Remove the mood entry from the UI
            databaseManager.moodData.remove(at: index)
        }
    }
}


struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
