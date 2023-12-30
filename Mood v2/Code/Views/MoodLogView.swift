import SwiftUI
import Charts
import Foundation

struct MoodLogView: View {
    @State private var selectedOption: String = "W"
    @State private var showingDataSheet = false
    @State private var date = Date()
    @ObservedObject var databaseManager = DatabaseManager.shared
    
    let options = ["W", "M", "Y"]
    let numberOfDisplayDays = 7
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading) {
                                                
                        Picker("Select an option", selection: $selectedOption) {
                            ForEach(options, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .colorScheme(.dark)
                        
                        Text("WEEK")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .bold()
                        
                        Text("25-31 Dec 2023")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .bold()
                            .padding(.bottom, 10)
                        
                        Chart {
                            ForEach(databaseManager.fetchMoodDataForWeek(), id: \.id) { moodData in
//                            ForEach(databaseManager.fetchAllMoodData(), id: \.id) { moodData in
                                PointMark(
                                    x: .value("Day", moodData.date, unit: .day),
                                    y: .value("Mood", moodData.mood)
                                )
                                .foregroundStyle(.white)

                                LineMark(
                                    x: .value("Day", moodData.date, unit: .day),
                                    y: .value("Mood", moodData.mood)
                                )
                                .interpolationMethod(.stepCenter)
                                .lineStyle(StrokeStyle(lineWidth: 2))
//                                .lineStyle(StrokeStyle(lineWidth: 2, dash: [3]))
                                .foregroundStyle(.white)
                            }
                        }
                        .onAppear {
//                            print("Chart appeared. Fetching mood data...")
                            let fetchedData = databaseManager.fetchMoodDataForWeek()
//                            let fetchedData = databaseManager.fetchAllMoodData()
//                            print("Fetched \(fetchedData.count) rows from the database.")
                        }
                        .onChange(of: databaseManager.moodData) { _ in
//                            print("Mood data changed. Count: \(databaseManager.moodData.count)")
                        }
                        .chartScrollableAxes(.horizontal)
                        .chartXVisibleDomain(length: 3600 * 24 * numberOfDisplayDays)
                        .chartLegend(.hidden)
                        .frame(height: 180)
                        .chartYAxis {
                            AxisMarks(
                                values: [1]
                            ) {
                                AxisValueLabel {
                                    Text("""
                                        Very
                                        unpleasant
                                        """
                                    )
                                }
                                .font(.caption)
                                .foregroundStyle(.gray)
                            }
                            
                            AxisMarks(
                                values: [3]
                            ) {
                                AxisValueLabel {
                                    Text("""
                                        Neutral
                                        """
                                    )
                                }
                                .font(.caption)
                                .foregroundStyle(.gray)
                            }
                            
                            AxisMarks(
                                values: [5]
                            ) {
                                AxisValueLabel {
                                    Text("""
                                        Very
                                        pleasant
                                        """
                                    )
                                }
                                .font(.caption)
                                .foregroundStyle(.gray)
                            }
                            
                            AxisMarks(
                                values: [1, 2, 3, 4, 5]
                            ) {
                                AxisGridLine()
                                    .foregroundStyle(.gray)
                            }
                        }
                        .chartYScale(domain: 1 ... 5)
                        .chartXAxis {
                            AxisMarks(values: .stride(by: .day, count: 1)) {
                                AxisGridLine()
                                    .foregroundStyle(.gray)
                                AxisTick()
                                    .foregroundStyle(.gray)
                                AxisValueLabel(format: .dateTime.weekday())
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        ZStack {
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
                                .padding(EdgeInsets(top: 10, leading: -16, bottom: -500, trailing: -16))
                                .edgesIgnoringSafeArea(.all)
                            
                            VStack (alignment: .leading){
                                HStack (alignment: .bottom){
                                    Text("Highlights")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .bold()
                                        .padding(.top, 40)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        showingDataSheet.toggle()
                                    }) {
                                        Text("View data")
                                            .font(.headline)
                                            .fontWeight(.regular)
                                            .foregroundColor(.blue)
                                    }
                                }
                                
                                ZStack (alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                                    
                                    
                                    VStack (alignment: .leading, spacing: 10) {
                                        Label("Insights", systemImage: "lightbulb.fill")
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                            .padding(.top, 10)
                                        
                                        Text("To come in next version.")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .bold()
                                            .padding(.bottom, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal, 16)
                                }
                                
                                Spacer()
                                
                                ZStack (alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
                                    
                                    VStack (alignment: .leading, spacing: 10) {
                                        Label("Recommendations", systemImage: "exclamationmark.circle.fill")
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                            .padding(.top, 10)
                                        
                                        Text("To come in next version.")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .bold()
                                            .padding(.bottom, 30)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal, 16)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationBarTitle("Mood log")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HomeView()) {
                        Text("Done")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        NavigationLink(destination: HomeView()) {
                            Label {
                                Text("Home")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            } icon: {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.gray)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: LogMoodView()) {
                            Label {
                                Text("Log mood")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            } icon: {
                                Image(systemName: "plus.app.fill")
                                    .foregroundColor(.gray)
                            }
                            .labelStyle(VerticalLabelStyle())
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: MoodLogView()) {
                        Label {
                            Text("View log")
                                .font(.caption)
                                .foregroundColor(.blue)
                        } icon: {
                            Image(systemName: "chart.xyaxis.line")
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
        .sheet(isPresented: $showingDataSheet,
               onDismiss: {
            print("Sheet dismissed")
        },
        content: {
            DataView()
                .presentationDetents([.large, .medium])
                .presentationContentInteraction(.scrolls)
        })
    }
}


struct MoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        MoodLogView()
    }
}

