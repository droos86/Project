//
//  MoodLogView_Alt.swift
//  Mood v2
//
//  Created by Daniel Roos on 20.12.23.
//

import SwiftUI
import Charts
import Foundation

struct MoodLogView_Alt: View {
    @State private var selectedOption: String = "W"
        let options = ["W", "M", "Y"]
    
    let moodDay: [moodDay] = [
        .init(date: Date.from(year: 2023, month: 12, day: 11), moodRating: 3),
        .init(date: Date.from(year: 2023, month: 12, day: 12), moodRating: 4),
        .init(date: Date.from(year: 2023, month: 12, day: 13), moodRating: 2),
        .init(date: Date.from(year: 2023, month: 12, day: 14), moodRating: 1),
        .init(date: Date.from(year: 2023, month: 12, day: 15), moodRating: 1),
        .init(date: Date.from(year: 2023, month: 12, day: 16), moodRating: 5),
        .init(date: Date.from(year: 2023, month: 12, day: 17), moodRating: 2),
    ]
    
    var body: some View {
        ZStack {
            // Color(red: 185/255, green: 200/255, blue: 250/255) // Light blue
                // .edgesIgnoringSafeArea(.all)
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(red: 185/255, green: 200/255, blue: 250/255), location: 0.4),
                    .init(color: Color.black, location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            
            ScrollView {
                
                VStack(alignment: .leading) {
                    Text("Mood log")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    // Adapt style to black background
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 10)
                    
                    // Automate date for current week / month / year
                    Text("WEEK")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .bold()
                    
                    HStack {
                        Text("11-17 Dec 2023")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom, 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: HomeView()) {
                            Text("Done")
                                .bold()
                                .foregroundColor(.blue)
                        }
                    }
                    
                    
                    // Forn month and year add AreaMark for min and max and LineMark for average of weeks and months respectively
                    
                    
                    Chart {
                        ForEach(moodDay) { moodDay in
                            LineMark(
                                x: .value("Day", moodDay.date, unit: .day),
                                y: .value("Mood", moodDay.moodRating)
                            )
                            .symbol(.circle)
                        }
                    }
                    .frame(height: 200)
                    .chartYAxis {
                        AxisMarks(values: moodDay.map { $0.moodRating }) { moodRating in
                            AxisGridLine()
                                .foregroundStyle(.black)
                            // Improve so it always shows labels 1-5
                            // Convert ints to strings / moodDescriptions
                            AxisValueLabel()
                            // {
                            // switch AxisValue.self {
                            // case 1:
                            // Text("Very Unpleasant")
                            // case 2:
                            // Text("Unpleasant")
                            // case 3:
                            // Text("Neutral")
                            // case 4:
                            // Text("Pleasant")
                            // case 5:
                            // Text("Very Pleasant")
                            // default:
                            // EmptyView()
                            // }
                            // }
                                .font(.caption)
                                .foregroundStyle(.black)
                        }
                    }
                    .chartYScale(domain: 1 ... 5)
                    .chartXAxis {
                        AxisMarks(values: moodDay.map { $0.date }) { date in
                            AxisGridLine()
                                .foregroundStyle(.black)
                            AxisTick()
                                .foregroundStyle(.black)
                            AxisValueLabel(format: .dateTime.weekday())
                                .font(.caption)
                                .foregroundStyle(.black)
                        }
                    }
                    .chartPlotStyle { plotContent in
                        plotContent
                        
                    }
                    // Format x-axis to show days / weeks / months
                    // Format y-axis to show moodDescriptions instead of moodRatings
                    
                    // Automate with analyses of mood data patterns
                    ZStack {
                        Text("")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        // .background(Color(red: 0/255, green: 0/255, blue: 0/255))
                        // LinearGradient(
                            // gradient: Gradient(colors: [
                                // Color(red: 185/255, green: 200/255, blue: 250/255),
                                // Color.black
                            // ]),
                            // startPoint: .top,
                            // endPoint: .bottom
                        // )
                        // .edgesIgnoringSafeArea(.all)
                        // .padding(EdgeInsets(top: 10, leading: -16, bottom: 0, trailing: -16))
                        
                        VStack (alignment: .leading){
                            Text("Highlights")
                                .font(.headline)
                                .foregroundColor(.black)
                                .bold()
                                .padding(.top, 10)
                            
                            ZStack (alignment: .leading) {
                                Text("")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                                    .cornerRadius(10)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                VStack (alignment: .leading, spacing: 10) {
                                    Label("Insights", systemImage: "lightbulb.fill")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 10)
                                    
                                    Text("Insights based on mood patterns.")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                            }
                            
                            Spacer()
                            
                            ZStack (alignment: .leading) {
                                Text("")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                                    .cornerRadius(10)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                VStack (alignment: .leading, spacing: 10) {
                                    Label("Insights", systemImage: "lightbulb.fill")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 10)
                                    
                                    Text("Recommendations based on insights.")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                            }
                            
                            Spacer()
                            
                            ZStack (alignment: .leading) {
                                Text("")
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                    .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                                    .cornerRadius(10)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                VStack (alignment: .leading, spacing: 10) {
                                    Label("Recommendations", systemImage: "exclamationmark.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                        .padding(.top, 10)
                                    
                                    Text("Recommendations based on insights.")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                    
                    
                    
                    
                    // Automate with recommendations for identified mood patters
                    
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct MoodLogView_Alt_Previews: PreviewProvider {
    static var previews: some View {
        MoodLogView_Alt()
    }
}
