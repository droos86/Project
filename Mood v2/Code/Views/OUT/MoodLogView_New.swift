//import SwiftUI
//import Charts
//import Foundation
//
//struct MoodLogView_New: View {
//    @State private var selectedOption: String = "W"
//        let options = ["W", "M", "Y"]
//    
//    let moodDay: [moodDay] = [
//        .init(date: Date.from(year: 2023, month: 12, day: 11), moodRating: 3),
//        .init(date: Date.from(year: 2023, month: 12, day: 12), moodRating: 4),
//        .init(date: Date.from(year: 2023, month: 12, day: 13), moodRating: 2),
//        .init(date: Date.from(year: 2023, month: 12, day: 14), moodRating: 1),
//        .init(date: Date.from(year: 2023, month: 12, day: 15), moodRating: 1),
//        .init(date: Date.from(year: 2023, month: 12, day: 16), moodRating: 5),
//        .init(date: Date.from(year: 2023, month: 12, day: 17), moodRating: 2),
//    ]
//    
//    @State private var showingAlert = false
//    
//    var body: some View {
//        ZStack {
//            Color(.black)
//                .edgesIgnoringSafeArea(.all)
//            
//            ScrollView {
//                
//                VStack(alignment: .leading) {
//                    HStack (alignment: .bottom) {
//                        Text("Mood log")
//                            .font(.title)
//                            .bold()
//                            .foregroundColor(.white)
//                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                        
//                        Spacer()
//                        
//                        NavigationLink(destination: HomeView_Alt()) {
//                            Text("Done")
//                                .font(.headline)
//                                .fontWeight(.regular)
//                                .bold()
//                                .foregroundColor(.blue)
//                        }
//                    }
//                    
//                    // Adapt style to black background
//                    Picker("Select an option", selection: $selectedOption) {
//                        ForEach(options, id: \.self) { option in
//                            Text(option)
//                        }
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                    .padding(.bottom, 10)
//                    .colorScheme(.dark)
//                    
//                    // Automate date for current week / month / year
//                    Text("WEEK")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                        .bold()
//                    
//                        Text("11-17 Dec 2023")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                            .bold()
//                            .padding(.bottom, 10)
//                    
//                    // Forn month and year add AreaMark for min and max and LineMark for average of weeks and months respectively
//                    
//                    
//                    Chart {
//                        ForEach(moodDay) { moodDay in
//                            PointMark(
//                                x: .value("Day", moodDay.date, unit: .day),
//                                y: .value("Mood", moodDay.moodRating)
//                            )
//                            .foregroundStyle(by: .value("Mood", moodDay.moodRating))
//                            
//                            LineMark(
//                                x: .value("Day", moodDay.date, unit: .day),
//                                y: .value("Mood", moodDay.moodRating)
//                            )
//                            .interpolationMethod(.stepCenter)
//                            .lineStyle(StrokeStyle(lineWidth: 2, dash: [3]))
//                            .foregroundStyle(.gray)
//                        }
//                    }
//                    .chartLegend(.hidden)
//                    .frame(height: 200)
//                    .chartYAxis {
//                        AxisMarks(
//                            values: [1]
//                        ) {
//                            AxisValueLabel {
//                                Text("""
//                                    Very
//                                    unpleasant
//                                    """
//                                )
//                            }
//                            .font(.caption)
//                            .foregroundStyle(.gray)
//                        }
//                        
//                        AxisMarks(
//                            values: [3]
//                        ) {
//                            AxisValueLabel {
//                                Text("""
//                                    Neutral
//                                    """
//                                )
//                            }
//                            .font(.caption)
//                            .foregroundStyle(.gray)
//                        }
//                        
//                        AxisMarks(
//                            values: [5]
//                        ) {
//                            AxisValueLabel {
//                                Text("""
//                                    Very
//                                    pleasant
//                                    """
//                                )
//                            }
//                            .font(.caption)
//                            .foregroundStyle(.gray)
//                        }
//                        
//                        AxisMarks(
//                            values: [1, 2, 3, 4, 5]
//                        ) {
//                            AxisGridLine()
//                                .foregroundStyle(.gray)
//                        }
//                    }
//                    .chartYScale(domain: 1 ... 5)
//                    .chartXAxis {
//                        AxisMarks(values: .stride(by: .day, count: 1)) {
//                            AxisGridLine()
//                                .foregroundStyle(.gray)
//                            AxisTick()
//                                .foregroundStyle(.gray)
//                            AxisValueLabel(format: .dateTime.weekday())
//                                .font(.caption)
//                                .foregroundStyle(.gray)
//                        }
//                    }
//                    
//                    // Automate with analyses of mood data patterns
//                    ZStack {
//                        Rectangle()
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .foregroundColor(Color(red: 28/255, green: 28/255, blue: 30/255))
//                            .padding(EdgeInsets(top: 10, leading: -16, bottom: -500, trailing: -16))
//                            .edgesIgnoringSafeArea(.all)
//                        
//                        VStack (alignment: .leading){
//                            HStack (alignment: .bottom){
//                                Text("Highlights")
//                                    .font(.title2)
//                                    .foregroundColor(.white)
//                                    .bold()
//                                    .padding(.top, 40)
//                                
//                                Spacer()
//                                
//                                Button(action: {
//                                    showingAlert = true
//                                }) {
//                                    Text("Clear all data")
//                                        .font(.headline)
//                                        .fontWeight(.regular)
//                                        .foregroundColor(.blue)
//                                }
//                                .alert(isPresented: $showingAlert) {
//                                    Alert(
//                                        title: Text("Clear all data"),
//                                        message: Text("Do you really want to clear all data?"),
//                                        primaryButton: .destructive(Text("Yes!")) {
//                                            deleteAllMoodDataFromDatabase()
//                                        },
//                                        secondaryButton: .cancel(Text("No, thanks"))
//                                    )
//                                }
//                            }
//                            
//                            ZStack (alignment: .leading) {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                    .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
//                                    
//                                
//                                VStack (alignment: .leading, spacing: 10) {
//                                    Label("Insights", systemImage: "lightbulb.fill")
//                                        .font(.headline)
//                                        .foregroundColor(.blue)
//                                        .padding(.top, 10)
//                                    
//                                    Text("Insights based on mood patterns.")
//                                        .font(.subheadline)
//                                        .foregroundColor(.white)
//                                        .bold()
//                                        .padding(.bottom, 30)
//                                    
//                                    Spacer()
//                                }
//                                .padding(.horizontal, 16)
//                            }
//                            
//                            Spacer()
//                            
//                            ZStack (alignment: .leading) {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                    .foregroundColor(Color(red: 44/255, green: 44/255, blue: 46/255))
//                                
//                                VStack (alignment: .leading, spacing: 10) {
//                                    Label("Recommendations", systemImage: "exclamationmark.circle.fill")
//                                        .font(.headline)
//                                        .foregroundColor(.blue)
//                                        .padding(.top, 10)
//                                    
//                                    Text("Recommendations based on insights.")
//                                        .font(.subheadline)
//                                        .foregroundColor(.white)
//                                        .bold()
//                                        .padding(.bottom, 30)
//                                    
//                                    Spacer()
//                                }
//                                .padding(.horizontal, 16)
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal, 16)
//            }
//        }
//    }
//    
//    private func deleteAllMoodDataFromDatabase() {
//        DatabaseManager.shared.deleteAllMoodData()
//    }
//}
//
//struct MoodLogView_New_Previews: PreviewProvider {
//    static var previews: some View {
//        MoodLogView_New()
//    }
//}
